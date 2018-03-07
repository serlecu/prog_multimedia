ArrayList<Ser> seres;

void setup() {
  size(1280, 800);
  noStroke();
  seres = new ArrayList<Ser>();
}

void draw() {
  background(0);

  for (int i = seres.size()-1; i >= 0; i--) {
    Ser ser = seres.get(i);
    ser.walk();
    ser.display();
    if (ser.muerte()) {
      seres.remove(i);
    }
  }

  if (mousePressed) {
    seres.add(new Ser(1, 20));
  }
}