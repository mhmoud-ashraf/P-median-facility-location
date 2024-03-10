import os
#%%
class instance:
    def __init__(self, instance_path):
        self.instance_path = instance_path
        
    def parse_instance(self):
        with open(self.instance_path, "r") as file:
            lines = file.readlines()
            J = list(range(1, int(lines[0].split(" = ")[1])+1))
            I = list(range(1, int(lines[1].split(" = ")[1])+1))
            C = int(lines[2].split(" = ")[1])
            P = int(lines[3].split(" = ")[1])
            Omega = list(range(1, int(lines[4].split(" = ")[1])+1))
            f = eval(lines[5].split(" = ")[1])
            g = eval(lines[6].split(" = ")[1])
            l = eval(lines[7].split(" = ")[1])
            d = eval(lines[8].split(" = ")[1])
            p = eval(lines[9].split(" = ")[1])
        return J, I, C, P, Omega, f, g, l, d, p
#%%
if __name__=="__main__":
    scenarios = 3
    instance_path = "Instance_%s.txt" % scenarios
    J, I, C, P, Omega, f, g, l, d, p = instance(instance_path).parse_instance()
    print(J, I, C, P, Omega, f, g, l, d, p)
    