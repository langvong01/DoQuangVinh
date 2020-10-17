#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	int num1,num2=0;

	do{
	printf("Enter a number\n");
	fflush(stdin);
	scanf("%d",num1);
	printf("No. is %d",num1);
	num2++;
	}while (num1 != 0);
	printf("\nThe total numbers is %d",--num2);
	
}
