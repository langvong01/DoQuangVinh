#include<stdio.h>
#include<conio.h>
int main()
{
	int num1,num2,tong,tich,hieu,thuong;
	printf("\nNhap vao so num1 = ");
	scanf("%d",&num1);
	printf("\nNhap vao so num2 = ");
	scanf("%d",&num2);
	tong = num1 + num2;
	tich = num1 * num2;
	hieu = num1 - num2;
	thuong = num1/num2;
	printf("\nTong = %d + %d = %d",num1,num2,tong);
	printf("\nHieu = %d - %d = %d",num1,num2,hieu);
	printf("\nTich = %d * %d = %d",num1,num2,tich);
	printf("\nThuong = %d/%d = %d",num1,num2,thuong);
}

