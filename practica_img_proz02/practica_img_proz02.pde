PImage[] photos = new PImage[5];
PImage a, mask;
int index, count;
int w;

void setup() {
  size(400, 400);
  background(0);

  photos[0] = loadImage("img01.jpeg");
  photos[1] = loadImage("img02.jpeg");
  photos[2] = loadImage("img03.jpeg");
  photos[3] = loadImage("img04.jpeg");
  photos[4] = loadImage("img05.jpeg");

  w =40;
  index=0;
  count=0;

  noStroke();
  fill(40);
  rect(0, 0, w, w);
  mask= get(0, 0, w, w);

  fill(0);
  rect(0, 0, w, w);
}

void draw() {
  if (mousePressed) {
    a = photos[index%5].get(mouseX, mouseY, w, w);
    a.mask(mask); 
    image(a, mouseX, mouseY);
  }
  count++;
  if (count > 100) {
    count = 0;
    index++;
  }
}