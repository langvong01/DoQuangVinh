#include<stdio.h>
void main()
{
	int x;
char i , ans;
i =' ';
do{
	x = 0;
	ans = 'y';
	printf("\nEnter sequence of character: ");
	do{
		i = getchar();
		x++;
	}while (i != '\n');
		i = ' ';
	printf("\nNumber of characters entered is : %d",--x);
	printf("\nMore sequencers m(Y/N)?");
		ans = getch();
}while(ans =='Y' || ans =='y');
}
