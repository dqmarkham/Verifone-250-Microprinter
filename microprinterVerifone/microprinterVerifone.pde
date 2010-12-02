

/***************************************************
 * Hello world for the Verifone250- Got basic formattign functions working, needs refinement and cleanup
 ***************************************************/

#include <SoftwareSerial.h>


/**********************************
 * Declare command hex constants
 **********************************/
//const byte _command = 0x0C; //1D 1B 0A 0C is the power command, nothing else seems to work

const byte _initializePrinter = 0x1B; // Not sure why I need to do this, the hex value doesn't seem to matter but I can't print unless I do this.

/*const byte _clearPrintData = 0x12;
const byte _beep = 0x1E;
const byte _cr = 0x0D;
const byte _lineFeed = 0x0A;
const byte _nlineFeed = 0x61;
const byte _redOn = 0x12;
const byte _redOff = 0x12;*/
//const byte _doubleWidthOn = 0x1E;
/*const byte _doubleWidthOff = 0x14;
const byte _highlightOn = 0x45;
const byte _highlightOff = 0x46;
const byte _underlineToggle = 0x2D;
const byte _doubleHeightToggle = 0x68;
const byte _formFeed = 0x0C;*/

#define rxPin 0
#define txPin 3

SoftwareSerial mySerial = SoftwareSerial(rxPin, txPin);

//char nytimes[512];

void initializePrinter() {
  mySerial.begin(9600);
 
 }
 
void setup() {
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);

  initializePrinter();
}

void loop()
{
  
  //request printer status///////////////
 // mySerial.print(byte(27));// this is the ESC command
 // mySerial.print(byte(100));// supposed to be request printer status used with above but doesnt work
 
  mySerial.print(byte(29));//Enter emulation mode WORKS BUT CAN'T TELL DIFFERENCE BETWEEN EMULATION AND NATIVE
  //mySerial.print(byte(28));//Enter native mode
  
 // mySerial.print("hello world"); //this puts the () contents in the print buffer DOESN'T WORK SO FAR
 // mySerial.print(byte(10));//this prints the buffer contents DOESN'T WORK SO FAR
  
  //mySerial.println(Serial.read());  //should read what with coming over the serial port and print it.
  
  mySerial.print(byte(30));//THIS WORKS AND MAKES IT DOUBLE WIDTH!!! 
  mySerial.print(byte(31));//return to normal width WORKS
  mySerial.print(byte(18));//This makes it use the red ribbon WORKS
  mySerial.println("clever lad"); //WORKS
  //mySerial.print(byte(12));//eject paper 1 inch WORKS
 // mySerial.print(byte(24));// empty print buffer not sure if this does anything
 
  // mySerial.print(byte(27));// this is ESC
  // mySerial.print(byte(43));//this combo of ESC and 67 should avtivate graphics mode CAN'T MAKE THIS WORK



   
  
  delay(5000);
}


