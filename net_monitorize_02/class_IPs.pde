
class IPs {
  float posx;
  int posy;
  String text;

  IPs(float posx, int posy, String text) {
    this.posx = posx;
    this.posy = posy+10*20;
    this.text = text;
  }
  
  void display(){
     fill(255);
    noStroke();
    text(text, posx, posy);
  }
  
  void move(){
    posx++;
  }
  
  boolean delete() {
    if (posx > width) {
      return true;
    } else {
      return false;
    }
  }
}