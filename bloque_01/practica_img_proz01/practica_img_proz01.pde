PImage[] photos = new PImage[5];
int click, index, count, countPh;
color catchPx, otherPx, catchPx2, otherPx2;
float R, G, B;

void setup() {
  size(400, 400);
  frameRate(10);
  photos[0] = loadImage("img01.jpeg");
  photos[1] = loadImage("img02.jpeg");
  photos[2] = loadImage("img03.jpeg");
  photos[3] = loadImage("img04.jpeg");
  photos[4] = loadImage("img05.jpeg");

  click=0;
  index =0;
}

void draw() {
  image(photos[index % 5], 0, 0);

  for (int i = 0; i<400; i++) {
    for (int j =0; i<400; j++) {
      catchPx = get(i, j);

      if (mouseX >= 150) {
        R = map(mouseX, 150, width, red(catchPx), 255);
      } else {
        R = map(mouseX, 150, 0, red(catchPx), 0);
      } 
      
      if (mouseY >= 150) {
        G = map(mouseY, 150, height, green(catchPx), 255);
      }else {
        G = map(mouseY, 150, 0, green(catchPx), 0);
      } 

      B = blue(catchPx);

      otherPx = color(R, G, B);
      set(i, j, otherPx);
    }
  }
}

void mousePressed() {
  index++;
}