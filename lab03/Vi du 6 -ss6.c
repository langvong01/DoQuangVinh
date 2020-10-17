#include<stdio.h>
#include<conio.h>
int main(void)
{
	int a;
	float d;
	char ch, name[40];
	printf("Please enter the data \n");
	scanf("%d %f %c %s", &a,&d,&ch, name);
	printf("\nThe values accepted are : %d %f %c, %s",a,d,ch, name);

}
