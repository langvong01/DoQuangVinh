#include<stdio.h>
#include<conio.h>
int main(void)
{
	float c,f,i;
	printf("Nhap chieu cao cua ban la : cm");
	scanf("%f",&c);
	i =  c/2.54;
	printf("\nChieu cao cua ban tuong duong : %f inches",i);
	f = i/12;
	printf("\nChieu cao cua ban tuong duong : %f feet",f);
	
	
	
}
