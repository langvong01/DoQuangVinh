#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	float math , phy, chem, sum, average;
	printf("Nhap diem toan, ly,hoa\n");
	scanf("%f %f %f",&math,&chem,&phy);
	sum = math + phy + chem ;
	average = sum/3;
	printf("\nTong diem 3 mon la: %f +%f +%f = %f ",math,phy,chem,sum);
	printf("\nDiem trung binh la:%f ", average);
	return 0;
			}
