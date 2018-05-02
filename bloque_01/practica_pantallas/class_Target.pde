class Target {
  int tarX, tarY;
  int dirx, diry;
  int s;
  int vida, vidaMax;
  Target() {
    s = 20;
    dirx =int(random(-1, 1));
    diry =int(random(-1, 1));
    vida = 0;
    vidaMax = 50;
  }

  void move() {
    tarX = tarX+ dirx;
    tarY = tarY+ diry;
    if (tarX > width-s || tarX < 0+s ) {
      dirx = dirx*(-1);
    }
    if (tarY > width-s || tarY < 0+s ) {
      diry = diry*(-1);
    }
  }

  void display() {
    fill(vida);
    noStroke();
    ellipse(tarX, tarY, s, s);
  }

  boolean muerte() {
    boolean resultado= false;
    vida++;
    if (mousePressed) {
      if (mouseX>=tarX && mouseX<=tarX+s && mouseY>=tarY && mouseY<=tarY+s ) {
        resultado = true;
      }
    } else {
      if (vida > vidaMax) {
        resultado = true;
      } else {
        resultado = false;
      }
    }
    return resultado;
  }
}