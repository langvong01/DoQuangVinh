#include <stdio.h>
#include<string.h>
int main()
{
	char str_arr [5] [20],str[20];
	int i , j ;
	for (i=0;i<5;i++){
	
		printf("\nEnter the string %d :",i+1);
		scanf("%s",str_arr[i]);
		}
	for (i=0;i<4;i++)
	for(j=i+1;j<5;j++)
	{
		if(strlen(str_arr[i]) < strlen(str_arr[j]))
			{
				strcpy(str,str_arr[i]);
				strcpy(str_arr[i],str_arr[j]);
				strcpy(str_arr[j],str);
			}
	}
printf("\nThe string in order to :\n");
for(i=0;i<5;i++)
	printf("\n%s",str_arr[i]);
}

