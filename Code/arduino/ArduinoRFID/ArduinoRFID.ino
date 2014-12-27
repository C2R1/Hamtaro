// Bleu : 2005651343 
// Jaune : 6003C35647
// Rouge : 200561B743
// Carte Id 542 : 60044503EA
// Carte ID 508 : 6004715845

#include <SoftwareSerial.h>

SoftwareSerial rfid(2, 3);

unsigned char buffer[14];
int count=0;


int Button1 = 8; // button3
int Button2 = 9; // button2


String rep;  // L'element de repoonse au passage de la carte

// RFID functions:
void clearBufferArray()              // function to clear buffer array
{
  for (int i=0; i<count;i++)
  { 
    buffer[i]=NULL;
  }                  // clear all index of array with command NULL
}
String GetString(unsigned char* inStrReference)
{
  // convert unsigned char to string
  unsigned char* bufPtr = inStrReference; 
  String newstring = (char*)bufPtr;
  return newstring;
}

String GetInfo(unsigned char buff[14], int count)
{
  // remove stx checksum and etx and get name;
  String value = GetString(buff).substring(1,11); 
  //String temp = GetData(value);
  return value;
  //sd_card_write(temp + " » " +digitalClockDisplay());
}




void setup()
{
  // debutr de la communication série
  Serial.begin(9600);
  // start rfid:
  rfid.begin(9600);  
}

unsigned char buff[64];

void loop()
{
  digitalWrite(Button1,LOW);
 digitalWrite(Button2,LOW);   
  if(rfid.available()){
      while(rfid.available())          
      {
        buffer[count++]=rfid.read();     
        if(count == 64)break;
      }
      //print value:
      rep = GetInfo(buffer,count);
      Serial.print(rep);
      //Serial.print(rep);
      Serial.print("/");
      delay(1000);
      
      if (rep == "60044503EA"){
        digitalWrite(Button1,HIGH);
delay(2000);        
      }
      if (rep == "6004715845"){
        digitalWrite(Button2,HIGH);
delay(2000);        
      }
      clearBufferArray();
      count = 0;
    }       
}



