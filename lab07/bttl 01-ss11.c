#include <stdio.h>
#include <stdlib.h>
void main()
{
	char *ptr;
	char word[20] ;
	printf("\nEnter a word : ");
	scanf("%s",&word);
	ptr = &word[0];
	int i,count=0;
	for (i=0;i<strlen(word);i++)
	{
		if((*ptr=='a') || (*ptr =='o') || (*ptr =='u') || (*ptr =='e') || (*ptr =='i') || (*ptr =='O') || (*ptr =='U') || (*ptr =='E') || (*ptr =='A') ||(*ptr =='I'))
			count++;
			ptr++;
	}
	printf("\nThe word is %s and so nguyen am trong word la %d",word,count);		
}

