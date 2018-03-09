
class IPs {
  float posx;
  int posy;
  String text;

  IPs(float posx, int posy, String text) {
    this.posx = posx;
    this.posy = posy;
    this.text = text;
    
    fill(255);
    noStroke();
    //text(text, posx, posy);
  }


  boolean delete() {
    posx++;
    if (x > width) {
      return true;
    } else {
      return false;
    }
  }
}