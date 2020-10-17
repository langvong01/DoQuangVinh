#include <stdio.h>
#include<string.h>
void uppername(char name_arr[]);
int main()
{
	char str_arr [5] [20];
	int i;
	for (i=0;i<5;i++){
	
		printf("\nEnter the string %d :",i+1);
		scanf("%s",str_arr[i]);
	}
	
	printf("\nEnd");
	for(i=0;i<5;i++)
	{
		uppername(str_arr[i]);
		printf("\nNew the string %d is : %s",i+1,str_arr[i]);
	}
}
uppername(char name_arr[])
{
	int x;
	for(x=0;name_arr[x] != '\0';x++)
	{
		if(name_arr[x]>=97&&name_arr[x]<=122)
			name_arr[x]-=32;
	}
}

