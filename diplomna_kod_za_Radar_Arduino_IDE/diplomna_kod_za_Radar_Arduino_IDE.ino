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