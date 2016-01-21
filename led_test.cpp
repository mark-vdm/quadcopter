#include "BlackLib/BlackLib.h"
#include "BlackLib/BlackCore.h"
#include "BlackLib/BlackGPIO/BlackGPIO.h"
#include <iostream>
 #include <stdio.h>
 #include <unistd.h>

 using namespace std;
 
 int main(){
 cout << "LED Flash Start" << endl;
 FILE *LEDHandle = NULL;
 const char *LEDBrightness="/sys/class/leds/beaglebone:green:usr0/brightness";

 BlackLib::BlackGPIO led1(GPIO_44, output); 

 for(int i=0; i<10; i++){
  if((LEDHandle = fopen(LEDBrightness, "r+")) != NULL){
   fwrite("1", sizeof(char), 1, LEDHandle);
   fclose(LEDHandle);
  }
  led1.setValue(high);
  usleep(500000);
 led1.setValue(low);
  if((LEDHandle = fopen(LEDBrightness, "r+")) != NULL){
   fwrite("0", sizeof(char), 1, LEDHandle);
   fclose(LEDHandle);
  }
  usleep(1000000);
  }
  cout << "LED Flash End" << endl;
}
