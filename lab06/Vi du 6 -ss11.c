#include <stdio.h>
void main()
{
	int i, n = 0;
	int item;
	char x[10][12];
	char temp[12];
	
	
	printf("Enter each string on a separate line \n\n");
	printf("Type 'End' when over \n\n");
	do
	{
		printf("String %d :", n+1);
		scanf("%s",x[n]);
		
	} while (strcmp(x[n++],"End"));
	
	n = n - 1;
	for(item = 0;item<n-1;++item);
	{
	
	 for(i = item+1;i<n;++i)
	 {
	 	if(strcmp(x[item], x[i])>0)
	 	{
	 		strcpy(temp,x[item]);
	 		strcpy(x[item],x[i]);
	 		strcpy(x[i],temp);
		 }
	 }
	printf("Recorded list of string : \n");
	for (i=0;i<n;++i)
	{
		printf("\nString %d is  %s",i+1,x[i]);
	}
	
	
	}
}
	
