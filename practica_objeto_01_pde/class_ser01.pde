class Ser {
  color c;  //propiedades o atributos
  int sh;
  float v;
  int posX;
  int posY;
  int s; //tamaño

  Ser(int sh, int s, color c) { //Constructor
    this.sh = sh;
    this.s = s;
    this.c = c;
    this.v = v;
  } 

  void walk() {
    posX += int(random(-10, 10));
    posY += int(random(-10, 10));
    if (posX > width) {
      posX = 0;
    }
    if (posY == height) {

      noStroke();
      fill(c);

      if (sh == 0) {
        rect(posX, posY, s, s);
      } else if (sh == 1) {
        ellipse(posX, posY, s, s);
      } else if (sh == 2) {
        triangle(posX, posY, posX+s, posY, posX+(s/2), posY-(s/2));
      }
    }
  }
}