#include <stdio.h>

int main (){
  int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int sum = 0;

  for (int i=0; i<10; i++){
        if(i % 2 == 0) 
        {
                arr[i] <<= 1; 
				printf("%d \n", arr[i]);
        }
        else
        {
                arr[i] = arr[i] >> 1; 
				printf("%d \n", arr[i]);
        }
  }
  
  return 0;
}
