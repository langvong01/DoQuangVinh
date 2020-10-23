#include <stdio.h>
#include <math.h>
int main()
{
	int a , b , c;
	printf("\nNhap vao 3 canh cua tam giac :\n");
	scanf("%d %d %d",&a,&b,&c);
	printf("\nDien tich tam giac abc la : %d",S(a,b,c));
	if((a+b)>c && (a+c)>b && (b+c)>a){
		printf("\n 3 canh thoa man dieu kien tao thanh mot tam giac");
	}
	else{
		printf("\n3 canh chua du dieu kien thoa man tao thanh mot tam giac");
	}
}
S(int ia , int ib , int ic)
{
	int p,s;
	p = (ia +  ib + ic)/2;
	s=sqrt(p*(p-ia)*(p-ib)*(p-ic));
	return(s);
}
