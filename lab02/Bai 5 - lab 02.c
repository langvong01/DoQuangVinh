#include<conio.h>
#include<stdio.h>
int main(void)
{
	float top,bottom,height,S;
	printf("Tinh dien tich hinh thang S biet");
	printf("\nDo dai day nho = ");
	scanf("%f",&top);
	printf("\nDo dai day lon = ");
	scanf("%f",&bottom);
	printf("\nDo dai chieu cao = ");
	scanf("%f",&height);
	S = 0.5 *  height * top + 0.5 * height * bottom;
	printf("\nS = 0.5 * %f * %f + 0.5 * %f * %f = %f",height,top,height,bottom,S);
	return 0;
	
}
