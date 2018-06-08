String[] readLine;
int x, counter;

void setup(){
  size(400,600,P3D);
  readLine = loadStrings("data.txt");
  counter= 0;
}

void draw(){
  background(255);
  if(counter >= 100){
  x= int(random(0,readLine.length));
  counter=0;
  counter++;
  } else {
    counter++;
  }
  fill(0);
  textAlign(CENTER,CENTER);
  textMode(MODEL);
  textSize(24);
  text(readLine[x], width*0.5,height*0.5);
}
