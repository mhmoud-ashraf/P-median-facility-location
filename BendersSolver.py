import gurobipy as gp
from gurobipy import GRB
from InstanceReader import instance
#%%
class model:
    def __init__(self,instance):
        self.J, self.I, self.C, self.P, self.Omega, self.f, self.g, self.l, self.d, self.p = instance
    
    def master_problem(self, sub_sol):
        # Create a new model
        m = gp.Model("Master_Problem")
        # Create variables
        y = m.addVars(self.J, vtype=GRB.BINARY, name="y")
        w = m.addVars(self.J, vtype=GRB.CONTINUOUS, name="w")
        # eta = m.addVar(vtype=GRB.CONTINUOUS, name="eta")
        # Objective function
        m.setObjective(
            gp.quicksum(self.f[j]*y[j] for j in self.J) + 
            gp.quicksum(self.g[j]*w[j] for j in self.J) + 
            gp.quicksum(self.p[k]*sub_sol[k] for k in self.Omega), 
            GRB.MINIMIZE
            )
        # Constraints
        constr1 = m.addConstrs((w[j] <= self.C*y[j] for j in self.J), name="facility_capacity")
        constr2 = m.addConstr((gp.quicksum(y[j] for j in self.J) <= self.P), name="number_of_facilities")
        # Set model parameters
        m.Params.OutputFlag = 0 # Suppress console output
        m.Params.lazyConstraints = 1 # Enable lazy constraints
        # Update model
        m.update()
        return m, y, w
    
    def sub_problem(self, scenario, master_sol_y, master_sol_w):
        # Create a new model
        m = gp.Model("Sub_Problem_%s" % scenario)
        # Create variables
        x = m.addVars(self.I, self.J, scenario, vtype=GRB.CONTINUOUS, name="x")
        y, w = master_sol_y, master_sol_w
        # Objective function
        m.setObjective(
            gp.quicksum(self.l[i,j]*self.d[i,scenario]*x[i,j] for i in self.I for j in self.J), 
            GRB.MINIMIZE
            )
        # Constraints
        constr1 = m.addConstrs((x[i,j] <= y[j] for i in self.I for j in self.J), name="assign_to_open_facility")
        constr2 = m.addConstrs((gp.quicksum(self.d[i,scenario]*x[i,j] for i in self.I) <= w[j] for j in self.J), name="assignment_capacity")
        constr3 = m.addConstrs((x[i,j] <= 1 for i in self.I for j in self.J), name="upper_bound")
        constr4 = m.addConstrs((gp.quicksum(x[i,j] for j in self.J) == 1 for i in self.I), name="demand_fulfillment")
        # Set model parameters
        m.Params.OutputFlag = 0 # Suppress console output
        m.Params.InfUnbdInfo = 1 # Enable infeasible and unbounded model detection
        m.Params.DualReductions = 0 # Disable dual reductions
        # Update model
        m.update()
        return m, x
    
    def solve_master_problem(self, subproblem_solutions):
        m = self.master_problem(subproblem_solutions)
        m.optimize()
        # m.write("Master_Problem.lp")
        # m.write("Master_Problem.sol")
        return m, m.detVarByName("y"), m.detVarByName("w")
    
    def solve_sub_problem(self, scenario, master_sol_y, master_sol_w):
        m = self.sub_problem(scenario, master_sol_y, master_sol_w)
        m.optimize()
        # if m.status == GRB.OPTIMAL:
              
        # m.write("Sub_Problem_%s.lp" % scenario)
        # m.write("Sub_Problem_%s.sol" % scenario)
        return m, m.getVarByName("x")
    
    def solve_benders(self):
        mp, y, w = self.solve_master_problem(x)
        for scenario in self.Omega:
            msp, x = self.solve_sub_problem(scenario, y, w)
        # m.write("Instance_%s_benders.lp" % scenarios)
        # m.write("Instance_%s_benders.sol" % scenarios)
        return m

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
    print("Objective value:", m.objVal)
    for v in m.getVars():
        if v.x > 0:
            print(v.varName, v.x)