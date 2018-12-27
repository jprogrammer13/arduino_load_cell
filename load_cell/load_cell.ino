// Scaricare libreria da https://circuits4you.com/wp-content/uploads/2016/11/HX711-master.zip

//@ Riccardo Bussola

/*
 Setup your scale and start the sketch WITHOUT a weight on the scale
 Once readings are displayed place the weight on the scale
 Press +/- or a/z to adjust the calibration_factor until the output readings match the known weight
 Arduino pin 6 -> HX711 CLK
 Arduino pin 5 -> HX711 DOUT
 Arduino pin 5V -> HX711 VCC
 Arduino pin GND -> HX711 GND 
*/

#include "HX711.h"

HX711 scale(5, 6);

float calibration_factor = 2230; // this calibration factor is adjusted according to my load cell
float units;
float ounces;

void setup() {
  Serial.begin(115200);
  Serial.println("HX711 calibration sketch");
  Serial.println("After readings begin, place known weight on scale");
  Serial.println("Press + or a to increase calibration factor");
  Serial.println("Press - or z to decrease calibration factor");

  scale.set_scale();
  Serial.println("Remove all weight from scale");
  delay(5000);
  scale.tare();  //Reset the scale to 0

  long zero_factor = scale.read_average(); //Get a baseline reading
  Serial.print("Zero factor: "); //This can be used to remove the need to tare the scale. Useful in permanent scale projects.
  Serial.println(zero_factor);

  Serial.print("Ready to mesure, switch to the gui, press UP int the gui to save the data into a csv file");
}

void loop() {

  scale.set_scale(calibration_factor); //Adjust to this calibration factor

  units = scale.get_units(), 10;
  if (units < 0)
  {
    units = 0.00;
  }
  ounces = units * 0.035274;
  Serial.print(units); //Parte chiave

  if(Serial.available())
  {
    char temp = Serial.read();
    if(temp == '+' || temp == 'a')
      calibration_factor += 1;
    else if(temp == '-' || temp == 'z')
      calibration_factor -= 1;
  }
}