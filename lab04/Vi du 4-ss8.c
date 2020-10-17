#include<stdio.h>
#include<conio.h>
int main(void)
{
	float com = 0,sales_amt;
	char grade;
	printf("Enter the sales_amt\n");
	scanf("%f",&sales_amt);
	printf("\nEnter the grade :");
	fflush(stdin);
	scanf("%c",&grade);
	if (sales_amt>10000)
		if (grade =='A')
			com = sales_amt * 0.1;
		else
			com = sales_amt * 0.08;
	
	else
		com = sales_amt * 0.05;
	printf("\n Commission = %f",com);
	return 0;
	
}
