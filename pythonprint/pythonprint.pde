#include <SoftwareSerial.h>



#define txPin 2
#define rxPin 4

int incomingByte = 0;    // for incoming serial data

SoftwareSerial printer = SoftwareSerial(rxPin, txPin);



void setup()
{
  Serial.begin(9600);
  pinMode(txPin, OUTPUT);
  printer.begin(9600);
  Serial.flush();

}

void loop()
{
  
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();

    printer.print("*******************");
    printer.println(incomingByte,BYTE);
    //delay(1000);
  }
}

