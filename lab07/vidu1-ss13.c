#include<stdio.h>
void main()
{
	int var ,*point_var;
	printf("\nEnter a value of var :");
	scanf("%d",&var);
	
	point_var = &var;
	printf ("\nEnter a value of poin_var : %u",point_var);
	//var = &point_var;
	var = &point_var;
	printf("\nEnter a value of var : %d ",var);
	
	
}
