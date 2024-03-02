from InstanceReader import instance
#%%
scenarios = 100
instance_path = "Instance_%s.txt" % scenarios
inst = instance(instance_path).parse_instance()
