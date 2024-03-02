import gurobipy as gp
from gurobipy import GRB
from InstanceReader import instance
#%%
class model:
    def __init__(self,instance):
        self.J, self.I, self.C, self.P, self.Omega, self.f, self.g, self.l, self.d, self.p = instance
        
    def solve(self):
        # Create a new model
        m = gp.Model("Scenatio_%s" % self.Omega)
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
        constr6 = m.addConstrs((w[j] >= 0 for j in self.J), name="non_negativity")
        constr7 = m.addConstrs((x[i,j,k] >= 0 for i in self.I for j in self.J for k in self.Omega), name="non_negativity")
        constr8 = m.addConstrs((x[i,j,k] <= 1 for i in self.I for j in self.J for k in self.Omega), name="upper_bound")
        # Update model
        m.update()
        # Solve model
        m.optimize()
        # Return model
        return m
#%%
if __name__=="__main__":
    scenarios = 100
    instance_path = "Instance_%s.txt" % scenarios
    inst = instance(instance_path).parse_instance()
    m = model(inst).solve()
    print("Objective value:", m.objVal)
    for v in m.getVars():
        if v.x > 0:
            print(v.varName, v.x)