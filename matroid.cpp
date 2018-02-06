#include <iostream>

#ifndef _Matroid_H_INCLUDED
#define _Matroid_H_INCLUDED

class matroid{

private:
//	int *E;//the finite ground set
	int *Powerset; //collection of subsets of E
public:
matroid(unsigned int ESize);// Cardinality of the ground set
matroid(const matroid &m); //copy constructor
~matroid(void); //Destructor
};
//Constructors and the Destructor
matroid::matroid(void){
}
matroid::matroid(unsigned int ESize){
	N = ESize;
 	Powerset = new int [2**N]
}
matroid::~matroid(){
  delete [] Powerset;
}

matroid::generatePowerset(int E){
	for (int i = 0; i < N**2; ++i){
		
		Powerset[i] = e//e is a subset of the power set
	}
}