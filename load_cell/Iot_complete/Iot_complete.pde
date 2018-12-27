// @author Riccardo Bussola

import processing.serial.*;

Serial myPort;        
int xPos = 30;     
int max_kg = 20; //change this parameter for a different max kg
long x_axis = 0;


int lastxPos=1;
int lastheight=max_kg;
float inByte=0;

float valore1=0;
float valore2=0;
int indice=0;
String inString;
float media_val;

  
Table table;

void setup () {
  table = new Table();
  
  table.addColumn("x");
  table.addColumn("kg");
  
  size(800, 500);        
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);  
  myPort.bufferUntil('\n');
  frameRate(120);
  background(0);      
}
void draw () {
     stroke(0);
     fill(0);
     rect(10,3,150,38);
     
     stroke(174,255,45,255);
     fill(174,255,45);
     textSize(20);
     text(inString+"kg", 10, 30);
     
     textSize(10);
     text(max_kg,6, 53);
     text((max_kg/4)*3,6, 153);
     text((max_kg/4)*2,6, 253);
     text(max_kg/4,6, 353);
     text(0,6, 453);
     
     fill(174,255,45);
     stroke(174,255,45,255);
     line(lastxPos, valore1, xPos, valore2);
     line(2,40,2,height-30);
     if (xPos >= width) {
        xPos = 30;
        lastxPos= 0;
        background(0);
      } 
     else {
        xPos++;
      }
}

void serialEvent (Serial myPort) {
  inString = myPort.readStringUntil('\n');
  TableRow newRow = table.addRow();
  if (inString != null) {
    valore1=valore2;
    inString = trim(inString);               
    float inByte = float(inString);  
    newRow.setLong("x",x_axis++);
    newRow.setFloat("kg", inByte);
    if (  ! Float.isNaN (inByte) ){
    println(inString);
    inByte = map(inByte, 0,max_kg/*inserire il valore massimo in kg*/,height-50,50); 
    valore2 = inByte; 
    lastxPos= xPos;
    lastheight= int((height-50)-inByte);
    indice++;
  }
  }
 }
 
 
 void keyPressed() {
   if (key == CODED) {
   if (keyCode == UP) {
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    int mi = minute();  // Values from 0 - 59
    int h = hour();
    saveTable(table, "data/"+String.valueOf(d)+"-"+String.valueOf(m)+"-"+String.valueOf(y)+"_"+hour()+":"+minute()+".csv");
    exit();
   }

  }
}
