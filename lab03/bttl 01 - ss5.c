#include<stdio.h>
#include<conio.h>
int main(void)
{
	int s , m = 3 , n = 5 , r;
	float x = 3.0;
	float y = (float) n/m;
	printf("\nt = %i ",n/m);
	printf("\nr = %i",n%m);
	printf("\ny = %f ",y);
	int t = (int) (x*y-m/2);
	y = n/m;
	printf("\nt = %i",t);
	printf("\n\nx after x*2.0 : %f",x*2.0);
	r =n%m;
	printf("\ns = %i",(m+n)/r);
	y = --n;
	printf("\ny = %f",y);
	
	

}
