import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress sonicPi;

void setup() {
  size(400, 400);
  osc = new OscP5(this, 8000);
  sonicPi = new NetAddress("127.0.0.1", 4560);
}

void draw() {
  background(0);  
}

void mousePressed() {
  background(100);  
  OscMessage sample = new OscMessage("/p5");
  sample.add(mouseX);
  sample.add(mouseY);
  
  osc.send(sample, sonicPi);
}

void oscEvent(OscMessage message) {
  print("### received an osc message.");
  print(" addrpattern: " + message.addrPattern());
}
