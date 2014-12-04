#include <SoftwareSerial.h>
SoftwareSerial rfid(2, 3);
unsigned char buffer[14];
int count=0;

void setup()
{
  Serial.begin(9600);
 
  // start rfid:
  rfid.begin(9600);  
}

unsigned char buff[6];

void loop()
{
  if(rfid.available()){
      while(rfid.available())          
      {
        buffer[count++]=rfid.read();     
        if(count == 64)break;
      }
      //print value:
      Serial.print(GetInfo(buffer,count));
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

String GetData(String id)
{                       
  String bd[5][2] = {
    {
      "0F000C9C0E","Joao Pereira"         }
    ,
    {
      "0F00088CD2","Ricardo Lopes"        }
    ,
    {
      "0F00086052","Pedro Rosas"          }
    ,
    {
      "0F00096159","Filipe Macedo"        }
    ,
    {
      "0F000CF1F5","Mariana Gomes"        }
  };

  String data = id;

  for(int i=0; i<5;i++){
    if(bd[i][0]==id){
      data = bd[i][1];
    }
  }

  return data;
}

