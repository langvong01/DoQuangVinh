#include <stdio.h>
int main()
{
	int i ,count_a=0,count_i=0,count_e=0,count_o=0,count_u=0;
	int count=0;
	char str[30] , *ptr_str;
	printf("Enter a string :");
	gets(str);
	ptr_str = &str[0];
	for	(i=0;i<strlen(str);i++)
	{
		if((*ptr_str)=='i'||(*ptr_str=='I'))
		{
			count++;
			ptr_str++;
			count_i++;
		}
		else if((*ptr_str=='A')||(*ptr_str=='a')){
			count++;
			ptr_str++;
			count_a++;
		}
		else if((*ptr_str=='O')||(*ptr_str=='o')){
			count++;
			ptr_str++;
			count_o++;
		}
		else if((*ptr_str=='E')||(*ptr_str=='e')){
			count++;
			ptr_str++;
			count_e++;
		}
		else if((*ptr_str=='U')||(*ptr_str=='u')){
			count++;
			ptr_str++;
			count_u++;
		}
		
		else{
			ptr_str++;
		}
	}				
float a =	(float)count_a/strlen(str);
float o =	(float)count_o/strlen(str);
float u =	(float)count_u/strlen(str);
float e =	(float)count_e/strlen(str);
float I =	(float)count_i/strlen(str);


printf("\nSo ky tu nguyen am trong chuoi la : %d",count);
printf("\nSo ky tu khong phai nguyen am trong chuoi la: %d",strlen(str)-count);
printf("\nSo lan xuat hien cua ky tu a la :%d va ty le phan tram xuat hien la :%.2f ",count_a,a*100);
printf("\nSo lan xuat hien cua ky tu o la :%d va ty le phan tram xuat hien la :%.2f ",count_o,o*100);
printf("\nSo lan xuat hien cua ky tu u la :%d va ty le phan tram xuat hien la :%.2f ",count_u,u*100);
printf("\nSo lan xuat hien cua ky tu e la :%d va ty le phan tram xuat hien la :%.2f ",count_e,e*100);
printf("\nSo lan xuat hien cua ky tu i la :%d va ty le phan tram xuat hien la :%.2f ",count_i,I*100);




}
