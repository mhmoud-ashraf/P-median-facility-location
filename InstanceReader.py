import os
#%%
class instance:
    def __init__(self, instance_path):
        self.instance_path = instance_path
        
    def parse_instance(self):
        with open(self.instance_path, "r") as file:
            lines = file.readlines()
            J = int(lines[0].split(" = ")[1])
            I = int(lines[1].split(" = ")[1])
            C = int(lines[2].split(" = ")[1])
            P = int(lines[3].split(" = ")[1])
            Omega = int(lines[4].split(" = ")[1])
            f = eval(lines[5].split(" = ")[1])
            g = eval(lines[6].split(" = ")[1])
            l = eval(lines[7].split(" = ")[1])
            d = eval(lines[8].split(" = ")[1])
        return J, I, C, P, Omega, f, g, l, d
#%%
if __name__=="__main__":
    scenarios = 3
    instance_path = "Instance_%s.txt" % scenarios
    J, I, C, P, Omega, f, g, l, d = instance(instance_path).parse_instance()
    print(J, I, C, P, Omega, f, g, l, d)