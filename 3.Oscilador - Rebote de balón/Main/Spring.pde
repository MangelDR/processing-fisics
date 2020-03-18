//Similar a la clase Bob pero en esta añadimos la capacidad de deformarse
class Spring { 

  // position
  PVector anchor;
  float posy, rebote;
  float stretch;

  // Rest length and spring constant
  float len;
  float k = 0.44;
  PVector acceleration, velocity;
  PImage img;
 
  // Constructor
  Spring(float x, float y, int l) {
    anchor = new PVector(x, y);
    len = l;
    img = loadImage("basketBall.png");
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    posy= 0;
    rebote = 0;
  } 

  // Newton's law: F = M * A
  void applyForce(PVector force, Bob b) {
    PVector f = PVector.div(force,b.mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    anchor.add(velocity);
    acceleration.mult(0);
    if (velocity.y>= -1 && velocity.y <= 1){
      rebote = 0;
    }
  }
  
  // Calculate spring force
  void connect(Bob b) {
    // Vector pointing from anchor to bob position
    PVector force = PVector.sub(b.location, anchor);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
     stretch = d - len;
   
    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch); 
    b.applyForce(force);
  }
  
   float isMinlen(Bob b){
    PVector dir = PVector.sub(b.location, anchor);
    float d = dir.mag();
    if (d < 30){
      return 1;
    }else{
      return 0;
    }
  }
  
  // Constrain the distance between bob and anchor between min and max
  void constrainLength(Bob b, float minlen, float maxlen) {
    PVector dir = PVector.sub(b.location, anchor);
    float d = dir.mag();
    // Is it too short?
  
   println(maxlen);
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      // Reset position and stop from moving (not realistic physics)
      b.location = PVector.add(anchor, dir);
      b.velocity.mult(0);
      // Is it too long?
    } 
    else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      // Reset position and stop from moving (not realistic physics)
      b.location = PVector.add(anchor, dir);
      b.velocity.mult(0);
    }
  }
  
  void checkEdges() {

    if (anchor.x > width) {
      anchor.x = width;
      velocity.x *= -1;
    } else if (anchor.x < 0) {
      velocity.x *= -1;
      anchor.x = 0;
    }

    if (anchor.y > height) {
      velocity.y *= -1;
      anchor.y = height;
      rebote = 1;
    }

  }

  void display() { 
    stroke(0);
    fill(175);
    strokeWeight(2);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 10, 10);
  }

  void displayLine(Bob b) {
    strokeWeight(2);
    stroke(0);
    line(b.location.x, b.location.y, anchor.x, anchor.y);
    image(img, width/2 - (b.mass/2), b.location.y , b.mass,  posy);
  }
}