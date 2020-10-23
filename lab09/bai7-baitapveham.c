int main(int argc, char * argv[])
{

   int i,s=0;

   for (i=301;i<500;i++)
 {
	  if(i%7==0)
	  {
	  	s = s + i;
	  }
 }

 printf ("\nsum : %d",s);

   return 0;
}
