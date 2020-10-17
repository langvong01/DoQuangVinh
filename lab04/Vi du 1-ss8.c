#include<stdio.h>
#include<conio.h>
int main(void)
{
	float sales_amt,com = 0;
	printf("Enter the Sales Amount :");
	scanf("%f",&sales_amt);
	if(sales_amt>=10000)
		com= sales_amt * 0.1;
		printf("\n Commission = %f",com);
	return 0;
	
}
