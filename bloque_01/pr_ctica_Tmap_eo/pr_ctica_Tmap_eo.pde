//http://fcordon.webs.upv.es/tecnoProcessin8/Tmap_eo/
float posH, tam;
int tamStatic;

void setup() {
  size(400, 400);
  smooth();
  tamStatic = 25;
}

void draw() {
  background(255);
  fill(255);
  stroke(1);
  rect(20, 330, 50, 50);
   
  posH = map(mouseX,tamStatic,50,0,width-tamStatic);
  tam = map(mouseY,330,380,0,height/2);
  
  fill(0);
  rect(-tamStatic,height/2-tamStatic/2,posH,tamStatic);
  
  rect(posH-(tamStatic*2),height/2-tam,tamStatic,tam*2);
}