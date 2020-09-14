#include<stdio.h>
#include<conio.h>
int main(void)
{
	float C,F;
	printf("Nhap vao do C = ");
	scanf("%f",&C);
	F = 1.8*C + 32;
	printf("\nKet qua do F : 1.8*%f + 32 = %f ",C,F);
	return 0;
	
}
