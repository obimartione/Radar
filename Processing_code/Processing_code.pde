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
   
