#include<stdio.h>
#include<conio.h>
int main(void)
{
	int sn;
	float st;
	double db;
	char kt;
	long int l_sn;
	long double l_db;
	st = sizeof(float);
	sn = sizeof(int);
	kt = sizeof(char);
	db = sizeof(double);
	l_sn = sizeof(long int);
	l_db = sizeof(long double);
	
	printf("\nKieu int : %d Byte\nSo nguyen : ",sn);
	scanf("%d",&sn);

	printf("\n\nKieu float : %f Byte\nSo thuc kieu float : ",st);
	scanf("%f",&st);
	
	printf("\n\nKieu double : %f Byte\nSo thuc kieu double: ",db);
	scanf("%f",&db);
	
	printf("\n\nKieu char : %c Byte\nKy tu : ",kt);
	scanf("%c",&kt);
	
	printf("\n\nKieu long int : %d Byte",l_sn);
	printf("\n\nKieu long double : %f Byte",l_db);
	getch();
	return 0;
	
}

