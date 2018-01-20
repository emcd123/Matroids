
from itertools import chain, combinations
E = set([1,2,3])
I = []

def  P_generator(E):
  P = []
  for z in chain.from_iterable(combinations(E, r) for r in range(len(E)+1)):
    P.append(z)

  return P

I.append(P_generator(E))

bigI = []
for i in I:
  for j in i:
    bigI.append(P_generator(j))
    #print P_generator(j)

size = 1
result = [sublist for sublist in 
        (bigI[x:x+size] for x in range(len(bigI) - size + 1))
        if sublist not in sublist
    ]
#print result


J = []
def M_generator(E,J):
  p = []
  j = P_generator(E)
  p.append(j[1] + j[2])
  #print p


M_generator(E,J)

allSubsets = []
def findsubsets(S,m):
    #return set(combinations(S, m))
     k = chain.from_iterable(combinations(S,m) 
     allSubsets.append(k)

findsubsets(E,1)
findsubsets(E,2)
findsubsets(E,3)

#print allSubsets
print allSubsets
