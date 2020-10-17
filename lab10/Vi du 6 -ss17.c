#include <stdio.h>
#include<string.h>
void main()
{
	char hotelname[15] ="Sea View";
	char hotelname1[15]= "Sea Breeze";
	printf("The old name is %s\n",hotelname);
	strcpy(hotelname,hotelname1);
	printf("\nThe new name is %s\n",hotelname);
}
