import gurobipy as gp
from gurobipy import GRB
from InstanceReader import instance
#%%
class model:
    def __init__(self,instance):
        self.J, self.I, self.C, self.P, self.Omega, self.f, self.g, self.l, self.d, self.p = instance
        
    def create_model(self):
        # Create a new model
        m = gp.Model("Scenatio_%s" % self.Omega)
        
        # Set model parameters
        m.Params.OutputFlag = 0 # Suppress console output
        
        # Create variables
        y = m.addVars(self.J, vtype=GRB.BINARY, name="y")
        w = m.addVars(self.J, vtype=GRB.CONTINUOUS, name="w")
        x = m.addVars(self.I, self.J, self.Omega, vtype=GRB.CONTINUOUS, name="x")
        # Objective function
        m.setObjective(
            gp.quicksum(self.f[j]*y[j] for j in self.J) + 
            gp.quicksum(self.g[j]*w[j] for j in self.J) + 
            gp.quicksum(self.p[k]*gp.quicksum(self.l[i,j]*self.d[i,k]*x[i,j,k] for i in self.I for j in self.J) for k in self.Omega), 
            GRB.MINIMIZE
            )
        # Constraints
        constr1 = m.addConstrs((x[i,j,k] <= y[j] for i in self.I for j in self.J for k in self.Omega), name="assign_to_open_facility")
        constr2 = m.addConstrs((gp.quicksum(self.d[i,k]*x[i,j,k] for i in self.I) <= w[j] for j in self.J for k in self.Omega), name="assignment_capacity")
        constr3 = m.addConstrs((gp.quicksum(x[i,j,k] for j in self.J) == 1 for i in self.I for k in self.Omega), name="demand_fulfillment")
        constr4 = m.addConstrs((w[j] <= self.C*y[j] for j in self.J), name="facility_capacity")
        constr5 = m.addConstr((gp.quicksum(y[j] for j in self.J) <= self.P), name="number_of_facilities")
        constr6 = m.addConstrs((x[i,j,k] <= 1 for i in self.I for j in self.J for k in self.Omega), name="upper_bound")
        # Update model
        m.update()
        return m
    
    def solve(self, scenarios):
        m = self.create_model()
        m.optimize()
        # m.write("Instance_%s.lp" % scenarios)
        # m.write("Instance_%s.sol" % scenarios)
        return m

    def load(self, scenarios):
        m = self.create_model()
        m.read("Instance_%s.sol" % scenarios)
        m.optimize()
        return m
#%%
if __name__=="__main__":
    scenarios = 3
    instance_path = "Instance_%s.txt" % scenarios
    inst = instance(instance_path).parse_instance()
    m = model(inst).solve(scenarios)
    # m = model(inst).load(scenarios)
    print("Objective value:", m.objVal)
    for v in m.getVars():
        if v.x > 0:
            print(v.varName, v.x)