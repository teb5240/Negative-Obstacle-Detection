#include <I2C.h>
#include <RedBot.h>

#define    LIDARLite_ADDRESS   0x62          // Default I2C Address of LIDAR-Lite.
#define    RegisterMeasure     0x00          // Register to write to initiate ranging.
#define    MeasureValue        0x04          // Value to initiate ranging.
#define    RegisterHighLowB    0x8f          // Register to get both High and Low bytes in 1 call.

const int mainSpeed = 150;
int lastDistance = 19;
const int frontRPP = A1; 
const int frontLPP = A0;

RedBotMotors motor;

void setup(){
  Serial.begin(9600); //Opens serial connection at 9600bps.     
  I2c.begin(); // Opens & joins the irc bus as master
  delay(100); // Waits to make sure everything is powered up before sending or receiving data  
  I2c.timeOut(50); // Sets a timeout to ensure no locking up of sketch if I2C communication fails
}

void loop(){  

  long durationR1, durationL2, inches, frontRcm1, frontLcm2, looper;
    
  goStraight(); // move forward
  
  // Write 0x04 to register 0x00
  uint8_t nackack = 100; // Setup variable to hold ACK/NACK resopnses     
  while (nackack != 0){ // While NACK keep going (i.e. continue polling until sucess message (ACK) is received )
    nackack = I2c.write(LIDARLite_ADDRESS, RegisterMeasure, MeasureValue); // Write 0x04 to 0x00
    delay(1); // Wait 1 ms to prevent overpolling
  }

  byte distanceArray[2]; // array to store distance bytes from read function
  
  // Read 2byte distance from register 0x8f
  nackack = 100; // Setup variable to hold ACK/NACK resopnses     
  while (nackack != 0){ // While NACK keep going (i.e. continue polling until sucess message (ACK) is received )
    nackack = I2c.read(LIDARLite_ADDRESS,RegisterHighLowB, 2, distanceArray); // Read 2 Bytes from LIDAR-Lite Address and store in array
    delay(1); // Wait 1 ms to prevent overpolling
  }
  
  int distance = (distanceArray[0] << 8) + distanceArray[1];  // Shift high byte [0] 8 to the left and add low byte [1] to create 16-bit int
  
  if ((distance - lastDistance) >= 5) {
    motor.stop();
    delay (10000);
    Serial.print("HOLY CRAP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    Serial.println();
  }

  Serial.print("distance: ");
  Serial.print(distance);
  Serial.print(" | last distance: ");
  Serial.println(lastDistance);
  
  lastDistance = distance;

}

void goStraight() {
  Serial.println("STRAIGHT");
  motor.drive(mainSpeed);
}

void turnLeft() {
  Serial.println("LEFT!!!");
  motor.leftStop();
  motor.rightDrive(mainSpeed);
}

void turnRight() {
  Serial.println("RIGHT!!!");
  motor.rightStop();
  motor.leftDrive(mainSpeed);
}

 // time to distance converstion
long microsecondsToCentimeters(long microseconds) {
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}

