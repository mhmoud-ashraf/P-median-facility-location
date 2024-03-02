import os
import numpy as np
#%%
class instance:
    def __init__(self, J, I, C, P, Omega, f, g, l, d, seed):
        self.J = J # Set of potential sites
        self.I = I # Set of customers
        self.C = C # Upper bound of capacity
        self.P = P # Number of facilities to be opened
        self.Omega = Omega # Set of scenarios
        self.f = f # Fixed cost of opening a facility at site j
        self.g = g # Capacity cost per unit at site j
        self.l = l # Service cost from site j to customer i
        self.d = d # Demand of customer i under scenario k
        self.seed = seed
        
    def generator(self):
        """
        The function generates random values for the variables f, g, l, and d based on specified ranges
        and sizes.
        :return: The `generator` method is returning the instance of the class itself (`self`) after
        updating the `f`, `g`, `l`, and `d` attributes with new random values based on the specified
        ranges and sizes.
        """
        np.random.seed(self.seed)
        self.f = dict(enumerate(np.random.randint(self.f[0], self.f[1]+1, size=J), 1))
        self.g = dict(enumerate(np.random.randint(self.g[0], self.g[1]+1, size=J), 1))
        self.l = {(i,j): np.random.randint(self.l[0], self.l[1]+1) for i in range(1,I+1) for j in range(1,J+1)}
        self.d = {(i,k): np.random.randint(self.d[0], self.d[1]+1) for i in range(1,I+1) for k in range(1,Omega+1)}
        return self
        
    def save_instance(self):
        # This block of code is creating a text file to save the instance data in a readable format.
        # Here's a breakdown of what each line is doing:
        file = open("Instance_%s.txt" % self.Omega, "w")
        file.write("J = %s\n" % self.J)
        file.write("I = %s\n" % self.I)
        file.write("C = %s\n" % self.C)
        file.write("P = %s\n" % self.P)
        file.write("Omega = %s\n" % self.Omega)
        file.write("f = %s\n" % self.f)
        file.write("g = %s\n" % self.g)
        file.write("l = %s\n" % self.l)
        file.write("d = %s\n" % self.d)
        file.close()
#%%
if __name__ == "__main__":
    # Define sets and parameters
    J = 6 # Set of potential sites
    I = 4 # Set of customers
    C = 50 # Upper bound of capacity
    P = 3 # Number of facilities to be opened
    Omega = 100 # Set of scenarios
    f = (3, 15) # Fixed cost of opening a facility at site j
    g = (1, 5) # Capacity cost per unit at site j
    l = (2, 10) # Service cost from site j to customer i
    d = (1, 10) # Demand of customer i under scenario k
    seed = 0
    # Generate an intsance
    inst = instance(J, I, C, P, Omega, f, g, l, d, seed).generator()
    inst.save_instance()