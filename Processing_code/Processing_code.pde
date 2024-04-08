 import processing.serial.*; 
    import java.awt.event.KeyEvent;
    import java.io.IOException;
    Serial myPort; 
   
    String angle="";
    String distance="";
    String data="";
    String noObject;
    float pixsDistance;
    int iAngle, iDistance;
    int index1=0;
    int index2=0;
    PFont orcFont;
    void setup() {
      
     size (1280, 720);
     smooth();
     myPort = new Serial(this,"COM5", 9600); 
     myPort.bufferUntil('.'); 
     
    }

    void draw() {
      
      fill(98,245,31);
      
      noStroke();
      fill(0,4); 
      rect(0, 0, width, height-height*0.065); 
      
      fill(98,245,31); 
     
      drawRadar(); 
      drawLine();
      drawObject();
      drawText();
    }
   
      void serialEvent (Serial myPort) { 
      data = myPort.readStringUntil('.');
      data = data.substring(0,data.length()-1);
      
      index1 = data.indexOf(","); 
      angle= data.substring(0, index1); 
      distance= data.substring(index1+1, data.length()); 
      
      
      iAngle = int(angle);
      iDistance = int(distance);
    }

    void drawRadar() {
      pushMatrix();
      translate(width/2,height-height*0.074); 
      noFill();
      strokeWeight(2);
      stroke(98,245,31);

      arc(0,0,(width-width*0.0625),(width-width*0.0625),PI,TWO_PI);
      arc(0,0,(width-width*0.27),(width-width*0.27),PI,TWO_PI);
      arc(0,0,(width-width*0.479),(width-width*0.479),PI,TWO_PI);
      arc(0,0,(width-width*0.687),(width-width*0.687),PI,TWO_PI);

       line(-width/2,0,width/2,0);
      line(0,0,(-width/2)*cos(radians(30)),(-width/2)*sin(radians(30)));
      line(0,0,(-width/2)*cos(radians(60)),(-width/2)*sin(radians(60)));
      line(0,0,(-width/2)*cos(radians(90)),(-width/2)*sin(radians(90)));
      line(0,0,(-width/2)*cos(radians(120)),(-width/2)*sin(radians(120)));
      line(0,0,(-width/2)*cos(radians(150)),(-width/2)*sin(radians(150)));
      line((-width/2)*cos(radians(30)),0,width/2,0);
      popMatrix();
    }
