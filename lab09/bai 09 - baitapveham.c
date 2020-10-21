#include <stdio.h>
#include	<math.h>
int main()
{
	int	i,n,sum=0;
	int	arr[100];
	printf("Enter a number of a studens:");
	scanf("%d",&n);
	for(i=0;i<n;i++)
		{
		printf("\nEnter mark of studen %d :",i+1);
		scanf("%d",&arr[i]);
		sum+=arr[i];
		}
	float avg = (float)sum/n;
	printf("Diem trung binh cua lop la : %.2f\n",avg);
	if	(avg>=5 && avg <8)
	{
		printf("Xep loai kha");
	}
	else if	(avg>=8 && avg<9){
		printf("Xep loai gioi");
		}
	else if (avg>=9){
		printf("Xep loai xuat sac");
		}
	else if (avg<5){
		printf("Xep loai trung binh");
		}
					
}
