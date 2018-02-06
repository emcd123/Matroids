from itertools import chain, combinations

E = [1,2,3] #Finite ground set
I = [] #collection of independent subsets of E

def  P_generator(E):
  P = []
  for z in chain.from_iterable(combinations(E, r) for r in range(len(E)+1)):
    P.append(z)

  return P

powerset = P_generator(E)
#print(powerset)

def M_generator(powerset,I, rank):
	independent = []
	R = rank
	for i in powerset:
		if len(i) == R:
			independent.append(i)
			break
	return P_generator(independent)
	
I = M_generator(powerset,I,2)
print(I)

'''
def Powerset(E,powerset):
	S = E
	#print(S)

	if len(S) == 0: 
		powerset.append([])
		return powerset
	else:
		for e in S:
			if e not in powerset:
				powerset.append([e])
				del S[0]
				return Powerset(E,powerset)

'''
#print(Powerset(E,powerset))

