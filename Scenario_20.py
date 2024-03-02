from InstanceReader import instance
#%%
scenarios = 20
instance_path = "Instance_%s.txt" % scenarios
J, I, C, P, Omega, f, g, l, d = instance(instance_path).parse_instance()
print(J, I, C, P, Omega, f, g, l, d)