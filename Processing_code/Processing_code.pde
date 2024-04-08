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
