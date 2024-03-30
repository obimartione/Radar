#include <Servo.h> 

const int trigPin = 10;
const int echoPin = 11;

const int piezoPin = 8;

long duration;
int distance;


int notes[] = {262, 462, 862, 1662, 3262};

Servo myServo; 

void setup() {
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT); 
  Serial.begin(9600);
  myServo.attach(12); 
}

void loop() {
  
  for(int i=15;i<=165;i++){  
  myServo.write(i);

  distance = calculateDistance();
  

  if(distance > 40){
    noTone(piezoPin);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 40 && distance > 30){
    tone(piezoPin, notes[1]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 30 && distance > 20){
    tone(piezoPin,notes[2]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 20 && distance > 10){
    tone(piezoPin,notes[3]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else {
    tone(piezoPin,notes[4]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
     
      
   Serial.print(i); 
  Serial.print(",");
  Serial.print(distance); 
  Serial.print("."); 
  }

  for(int i=165;i>15;i--){  
  myServo.write(i);
 
  distance = calculateDistance();
  if(distance > 40){
    noTone(piezoPin);
    delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 40 && distance > 30){
    tone(piezoPin, notes[1]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 30 && distance > 20){
    tone(piezoPin,notes[2]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else if (distance <= 20 && distance > 10){
    tone(piezoPin,notes[3]);
     delay(10);
    noTone(piezoPin);
    delay(30);
  }
  else {
    tone(piezoPin,notes[4]);
    delay(10);
    noTone(piezoPin);
    delay(30);
  }
     
  Serial.print(i);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");
  
  }
}




