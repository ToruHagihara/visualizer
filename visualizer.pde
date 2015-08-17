//Serial prosessing 
//This program should receives ','separated float value 0.0~1.0
//ex) 1.000000,0.98760,
import processing.serial.*;

Serial myPort;  // Create object from Serial class
float val;      // Data received from the serial port

void setup() 
{
  size(200, 200);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if (myPort.available() > 8) {  // If 9byte or more data exists,
    String buf = myPort.readStringUntil(',');     // read it and store it in buf
    buf = buf.split(",")[0];     //remove ","
    println(buf);
    val =float(buf);
  }
  background(255);          

  if (val == 0) {              
    fill(val);                 
    noStroke();
  } else {                       
    fill(204*val);               
    noStroke();
  }
  ellipse(100, 100, 150*val, 150*val);
  noFill();
  stroke(255, 50, 255);
  strokeWeight(10);
  arc(100, 100, 180, 180, 0, 2*PI*val*0.95);
}

