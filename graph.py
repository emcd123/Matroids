V = ['a','b','c'] #vertex set of graph G
E = [1,2,3] #numbered edge set of graph
G = {} #The graph G

def InitGraph(G,V):
    #Function to initialise the graph G,
    #edge sets need to be hard coded at present
    for i in V:
        G[i] = [0]
    #Now add the edge sets of each vertex as a list in the values
    #field of the dictionary making up G.
    #edges should be entered alphabetically to aid in matching.
    G['a'] = ['ab','ac']
    G['b'] = ['ab','bc']
    G['c'] = ['ac','bc']

print(InitGraph(G,V))

def w(graph):
    #A weight function for the edges of G.
    pass
w(G)

def findSpanningTree(graph):
    Tree = []
    
    return Tree
    

