#include <stdio.h>
int	sumarr(int i);
int	main()
{
	int sum;
	printf("Sum is %d",sumarr(sum));
}
int	sumarr(i)
{
	int sum=0;
	for	(i=301;i<500;i++)
		{
			
			if	(i% 7 ==0 )
				{
					sum+=i;
				}
		}
	return sum;
}
