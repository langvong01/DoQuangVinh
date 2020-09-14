#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	float squ,dai,rong,r;
	float s_squ , c_squ , s_r , c_r , s_rec, c_rec;
	
	printf("\nTinh dien tich va chu vi hinh vuong biet do dai 1 canh hinh vuong = ");
	scanf("%f",&squ);
	s_squ = squ * squ;
	c_squ = squ * 4 ;
	printf("\nS = %f \nC = %f",s_squ,c_squ);
	
	printf("\n\nTinh dien tich va chu vi hinh tron biet do dai ban kinh hinh tron = ");
	scanf("%f",&r);
	c_r = r * 2 * 3.14;
	s_r = r * r * 3.14;
	printf("\nS = %f\nC = %f",s_r,c_r);
	
	printf("\n\nTinh dien tich va chu vi hinh chu nhat biet do dai chieu rong va chieu dai lan luot la:\n ");
	scanf("%f %f",&dai,&rong);
	s_rec = dai * rong;
	c_rec = 2 * dai + 2 * rong;
	printf("\nS = %f\nC = %f",s_rec,c_rec); 
	
	
	
	
	
	
	
}

