import time
import random
import numpy as np
import gurobipy as gp
from gurobipy import GRB
from InstanceReader import instance
#%%
class model:
    def __init__(self,instance):
        self.J, self.I, self.C, self.P, self.Omega, self.f, self.g, self.l, self.d, self.p = instance
    
    def master_problem(self):
        # Create a new model
        m = gp.Model("Master_Problem")
        
        # Set model parameters
        m.Params.OutputFlag = 0 # Suppress console output
        # m.Params.lazyConstraints = 1 # Enable lazy constraints
        # m.Params.method = 1 # Use dual simplex
        # m.Params.PreCrush = 1 # Enable presolve
        
        # Create variables
        y = m.addVars(self.J, vtype=GRB.BINARY, name="y")
        w = m.addVars(self.J, vtype=GRB.CONTINUOUS, name="w")
        eta = m.addVars(1, vtype=GRB.CONTINUOUS, name="eta")
        # eta = m.addVars(self.Omega, vtype=GRB.CONTINUOUS, name="sub_sol")
        
        m._y, m._w, m._eta = y, w, eta # Store variables
        
        # Objective function
        m.setObjective(
            gp.quicksum(self.f[j]*y[j] for j in self.J) + 
            gp.quicksum(self.g[j]*w[j] for j in self.J) + 
            eta[0], 
            GRB.MINIMIZE
            )
        # m.setObjective(
        #     gp.quicksum(self.f[j]*y[j] for j in self.J) + 
        #     gp.quicksum(self.g[j]*w[j] for j in self.J) + 
        #     gp.quicksum(self.p[k]*eta[k] for k in self.Omega), 
        #     GRB.MINIMIZE
        #     )
        
        # Constraints
        constr4 = m.addConstrs((w[j] <= self.C*y[j] for j in self.J), name="facility_capacity")
        constr5 = m.addConstr((gp.quicksum(y[j] for j in self.J) <= self.P), name="number_of_facilities")
        constr7 = m.addConstr((gp.quicksum(w[j] for j in self.J) >= max(sum(self.d[i,k] for i in self.I) for k in self.Omega)), name="additional_constr")
        
        # Update model
        m.update()
        return m
    
    def sub_problem(self, scenario):
        # Create a new model
        m = gp.Model("Sub_Problem_%s" % scenario)
        
        # Set model parameters
        m.Params.OutputFlag = 0 # Suppress console output
        m.Params.InfUnbdInfo = 1 # Enable infeasible and unbounded model detection
        m.Params.DualReductions = 0 # Disable dual reductions
        # m.Params.method = 1 # Use dual simplex
        
        # Create variables
        x = m.addVars(self.I, self.J, vtype=GRB.CONTINUOUS, name="x")
        
        m._x, m._scenario = x, scenario # Store variables
        
        # Objective function
        # m.modelSense = GRB.MINIMIZE
        m.setObjective(
            gp.quicksum(self.l[i,j]*self.d[i,scenario]*x[i,j] for i in self.I for j in self.J), 
            GRB.MINIMIZE
            )
        
        # Constraints
        constr1 = m.addConstrs((x[i,j] <= 0 for i in self.I for j in self.J), name="assign_to_open_facility")
        # constr1 = m.addConstrs((x[i,j] <= y[j] for i in self.I for j in self.J), name="assign_to_open_facility")
        constr2 = m.addConstrs((gp.quicksum(self.d[i,scenario]*x[i,j] for i in self.I) <= 0 for j in self.J), name="assignment_capacity")
        # constr2 = m.addConstrs((gp.quicksum(self.d[i,scenario]*x[i,j] for i in self.I) <= w[j] for j in self.J), name="assignment_capacity")
        constr3 = m.addConstrs((gp.quicksum(x[i,j] for j in self.J) == 1 for i in self.I), name="demand_fulfillment")
        constr6 = m.addConstrs((x[i,j] <= 1 for i in self.I for j in self.J), name="upper_bound")
        # Update model
        m.update()
        return m
    
    def solve_master_problem(self, m):
        m.optimize()
        # m.write("Master_Problem.lp")
        # m.write("Master_Problem.sol")
        return m
    
    def solve_sub_problem(self, SP, MP):
        # Get master problem solution
        y, w = MP._y, MP._w
        y, w = MP.getAttr('x', y), MP.getAttr('x', w)
        # Add constraints
        for constr in SP.getConstrs():
            if "assign_to_open_facility" in constr.ConstrName:
                i, j = int(constr.ConstrName.split("[")[1].split(",")[0]), int(constr.ConstrName.split(",")[1].split("]")[0])
                constr.setAttr('rhs', y[j])
            if "assignment_capacity" in constr.ConstrName:
                j = int(constr.ConstrName.split("[")[1].split("]")[0])
                constr.setAttr('rhs', w[j])
        SP.optimize()
        # SP.write("Sub_Problem_%s.lp" % SP._scenario)
        # SP.write("Sub_Problem_%s.sol" % SP._scenario)
        return SP
    
    def solve_benders(self, bound_gap=0, epsilon=0):
        # Initialization
        start = time.time() # Start timer
        cut_found = True # Existance of cuts
        n_cuts = 0 # Number of cuts
        n_iters = 0 # Number of iterations
        best_ub = GRB.INFINITY # Best upper bound
        
        # Create master problem
        mp = self.master_problem()
        y, w, eta = mp._y, mp._w, mp._eta # Get master problem variables
        
        # Create sub problems
        sp = {k: self.sub_problem(k) for k in self.Omega} # Create sub problems
        x = {k: sp[k]._x for k in self.Omega} # Get sub problem variables
        
        # Benders loop
        while cut_found:
            cut_found = False
            n_iters += 1 # Update iterations counter
            cut_constr = 0 # Initialize single cut constraint
            sum_eta = 0
            
            # Solve master problem
            mp = self.solve_master_problem(mp)
            mp_obj = mp.objVal # Get master problem objective value
            y_val, w_val, eta_val = mp.getAttr('x', y), mp.getAttr('x', w), mp.getAttr('x', eta) # Get master problem solution
            print(mp_obj)
            print(y_val, w_val, eta_val)
            
            # Update current upper bound (1)
            ub = sum(self.f[j]*y_val[j] for j in self.J) + sum(self.g[j]*w_val[j] for j in self.J)
            print(ub)
            
            for k in self.Omega:
                # Create and solve sub problem
                sp_k = self.sub_problem(k)
                sp_k = self.solve_sub_problem(sp_k, mp)
                sum_eta += sp_k.objVal
                
                # Update current upper bound (2)
                ub += self.p[k] * sp_k.objVal
                
                # Obtain dual solution
                alpha, beta, gamma, delta = (
                    {(i,j): constr.getAttr('Pi') for constr in sp_k.getConstrs() if "assign_to_open_facility" in constr.ConstrName for i in self.I for j in self.J}, 
                    {j: constr.getAttr('Pi') for constr in sp_k.getConstrs() if "assignment_capacity" in constr.ConstrName for j in self.J}, 
                    {i: constr.getAttr('Pi') for constr in sp_k.getConstrs() if "demand_fulfillment" in constr.ConstrName for i in self.I}, 
                    {(i, j): constr.getAttr('Pi') for constr in sp_k.getConstrs() if "upper_bound" in constr.ConstrName for i in self.I for j in self.J}
                    )
                dual_obj = sum(y_val[j]*alpha[i,j] for i in self.I for j in self.J) + sum(w_val[j]*beta[j] for j in self.J) + sum(gamma[i] for i in self.I) + sum(delta[i,j] for i in self.I for j in self.J)
                print(dual_obj, '--', sp_k.objVal)
                
        #         # Accumulate single cut constraint
        #         cut_constr_k = gp.quicksum(y[j]*alpha[i,j] for i in self.I for j in self.J) + gp.quicksum(w[j]*beta[j] for j in self.J) + gp.quicksum(gamma[i] for i in self.I) + sum(delta[i,j] for i in self.I for j in self.J)
        #         cut_constr += self.p[k] * cut_constr_k
                
        #     # Check whether a cut is found
        #     cut_found = (eta_val[0] - sum_eta) > bound_gap
        #     print(eta_val[0], sum_eta)
        #     if cut_found:
        #         # Update single cut
        #         n_cuts += 1
        #         mp.addConstr(eta[0] >= cut_constr, name="single_cut_%s" % n_cuts)
            
        #     # Update best upper bound
        #     best_ub = min(best_ub, ub)
        #     print("Iteration %s: Best upper bound = %s" % (n_iters, best_ub))
            
        #     # Convergence check
        #     if (best_ub - mp_obj) <= epsilon:
        #         print('The algorithm converges.')
        
        # end = time.time() # End timer
    
    def load(self, scenarios):
        m = self.create_model()
        m.read("Instance_%s_benders.sol" % scenarios)
        m.optimize()
        return m
#%%
if __name__=="__main__":
    scenarios = 3
    instance_path = "Instance_%s.txt" % scenarios
    inst = instance(instance_path).parse_instance()
    m = model(inst).solve_benders()
    # m = model(inst).load(scenarios)
    # print("Objective value:", m.objVal)
    # for v in m.getVars():
    #     if v.x > 0:
    #         print(v.varName, v.x)