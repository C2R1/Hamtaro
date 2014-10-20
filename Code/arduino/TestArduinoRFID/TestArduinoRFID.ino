// Bleu : 2005651343 
// Jaune : 6003C35647
// Rouge : 200561B743
// Carte Id 542 : 60044503EA
// Carte ID 508 : 6004715845

#include <SoftwareSerial.h>

SoftwareSerial rfid(2, 3);

unsigned char buffer[14];
int count=0;


int ledBleu = 8; //led bleu en sortie 8
int ledRouge = 9; // led rouge en sortie 9
int ledJaune = 10;  // led jaune en sortie 10

String rep;  // L'element de repoonse au passage de la carte

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
  if(rfid.available()){
      while(rfid.available())          
      {
        buffer[count++]=rfid.read();     
        if(count == 64)break;
      }
      //print value:
      rep = GetInfo(buffer,count);
      //Serial.print(GetInfo(buffer,count));
      Serial.print(rep);
      Serial.print("/");
      delay(1000);
      if (rep=="2005651343"){
        digitalWrite(ledBleu,HIGH);
        digitalWrite(ledRouge,LOW);
        digitalWrite(ledJaune,LOW);
      }
      if (rep=="200561B743"){
        digitalWrite(ledBleu,LOW);
        digitalWrite(ledRouge,HIGH);
        digitalWrite(ledJaune,LOW);
      }
      if (rep=="6003C35647"){
        digitalWrite(ledBleu,LOW);
        digitalWrite(ledRouge,LOW);
        digitalWrite(ledJaune,HIGH);
      }
      if (rep=="6004715845"){
        digitalWrite(ledBleu,LOW);
        digitalWrite(ledRouge,LOW);
        digitalWrite(ledJaune,LOW);
      }
      if (rep=="60044503EA"){
        digitalWrite(ledBleu,HIGH);
        digitalWrite(ledRouge,LOW);
        digitalWrite(ledJaune,LOW);
        delay(1000);
        digitalWrite(ledBleu,LOW);
        digitalWrite(ledRouge,HIGH);
        digitalWrite(ledJaune,LOW);
        delay(1000);
        digitalWrite(ledBleu,LOW);
        digitalWrite(ledRouge,LOW);
        digitalWrite(ledJaune,HIGH);
        delay(1000);
        digitalWrite(ledJaune,LOW);        
      }
      clearBufferArray();
      count = 0;
    }       
}


// RFID functions:
void clearBufferArray()              // function to clear buffer array
{
  for (int i=0; i<count;i++)
  { 
    buffer[i]=NULL;
  }                  // clear all index of array with command NULL
}

String GetInfo(unsigned char buff[14], int count)
{
  // remove stx checksum and etx and get name;
  String value = GetString(buff).substring(1,11); 
  String temp = GetData(value);
  return temp;
  //sd_card_write(temp + " » " +digitalClockDisplay());
}

String GetString(unsigned char* inStrReference)
{
  // convert unsigned char to string
  unsigned char* bufPtr = inStrReference; 
  String newstring = (char*)bufPtr;
  return newstring;
}

