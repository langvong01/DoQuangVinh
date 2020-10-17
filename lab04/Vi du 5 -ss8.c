#include<stdio.h>
#include<conio.h>
int main(void)
{
	int num1, num2,res;
	char op;
	num1 = 90;
	num2 = 33;
	op = '-';
	switch(op)
{
		case'+':
			res = num1 +num2;
			printf("\n The sum is : %d",res);
			break;
		case '-':
			res = num1-num2;
			printf("\nNumber after subtraction: %d",res);
			break;
		case '/':
			res = num1/num2;
			printf("\nNumber after division: %d",res);
			break;
		case '*':
			res = num1*num2;
			printf("\nNumber after multiplication: %d",res);
			break;
		default:
			printf("\nInvalid");
		break;
}
	return 0;
}


