#include <stdio.h>
main3()
{
	incres();
	incres();
	incres();
	
}
incres()
{
	static char var = 65;
	printf("\nThe character stored in var is %c",var++);
}
