import random

li=[]
for i in range(10):#creating a random list using code from blackboard
	li=li+[random.randrange(0,50)]
print(li)
def insertionSort(li):#insertion sort function
	i=1
	while(i < len(li)):
		j = i
		while (j>0) and (li[j-1] > li[j]):
			li[j], li[j-1] = li[j-1], li[j]
			j = j-1
		i = i+1
	return li
print(insertionSort(li))
#print(li)

