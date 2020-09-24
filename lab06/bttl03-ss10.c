#include<stdio.h>
void main()
{
	int i,j,num,t=0;
	printf("Enter a number :");
	scanf("%d",&num);
	printf("Bang cuu chuong cua so vua nhap la : \n");
	for(i=0,j=1;i<10;i++,j++)
	{
	t = num * j;
	printf("\n%d * %d = %d",num,j,t);
	}
	
}
