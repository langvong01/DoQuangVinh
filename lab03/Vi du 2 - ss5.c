#include<stdio.h>
#include<conio.h>
int main(void)
{
	int a,b,c,d;
	a = 50;
	b=24;
	c=68;

	d=a*b+c/2;
	printf("\nThe value afer a*b+c/2 is : %d ",d);
	
	d = a % b;
	printf("\nThe value after a mod b is : %d ",d);
	
	d = a * b - c;
	printf("\nThe value after a*b - c is : %d ",d);
	
	d = a/b + c;
	printf("\nThe value after a/b + c is : %d",d);
	
	d = a + b*c;
	printf("\nThe value after a+ b*c is : %d",d);
	
	d = (a+b)*c;
	printf("\nThe value after (a+b)*c is : %d ",d);
	
	d = a*(b+c+(a-c)*b);
	printf("\nThe value after a*(b+c+(a-c)*b) is : %d ",d);	
	
}
