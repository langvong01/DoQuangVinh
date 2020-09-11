/*Ex 1  session 3 */
#include <stdio.h>
int main(void)
{
	int principal , period;
	float rate , si ;
	principal = 1000;
	period = 3;
	rate = 8.5;
	si = 	principal * period * rate / 100;
	printf("%f",si);
	return 0;
}


