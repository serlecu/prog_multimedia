//juego
ArrayList<Target> targets;
int tarX, tarY;
int sentido,xpos,count2,spawn,timeUp;
int puntos;
int aSize =1;

void setupDos(){
  sentido = 1;
  xpos=20;
  count2=0;
  timeUp=200;
  puntos =0;
  spawn=0;
}

void drawDos(){
  background(0,255,0);
  
  for(aSize = targets.size(); aSize >= 1; aSize--) {
    Target target = targets.get(i);
    target.move();
    target.display();
    if (target.muerte()) {
      targets.remove(i);
      puntos++;
    }
  }
  xpos=xpos+sentido;
  count2++;
  spawn++;
  if (spawn > 10){
    targets.add(new Target());
    spawn = 0;
  }
  if(count2 >= timeUp){
    pantalla=3;
    count2=0;
  }
  
  if(xpos >= width-20 || xpos <= 20){
    sentido = sentido*(-1);
  }
}