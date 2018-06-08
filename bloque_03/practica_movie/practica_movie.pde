import processing.video.*;
import gab.opencv.*;

Capture cam;
OpenCV opencv;

void setup() {
  size(600,400);
  String[] cameras = Capture.list();
  
  cam = new Capture(this, cameras[1]);
  opencv = new OpenCV(this, width,height);
  cam.start();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  if (cam.available()){
    cam.read();
  }
  image(cam, 0, 0, width, height);
}
