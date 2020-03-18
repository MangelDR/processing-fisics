/*
  Satelite / Satelit
*/

class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector initialPosition;
  
  ArrayList<PVector> points;

  PVector[] colisionBox;

  float mass, radius;
 
 //Contructor
  Mover() {
    mass = 1; //Masa del satelite 
    radius = 8; // Radio del satelite
    initialPosition = new PVector(0,0);
    location = new PVector(30,30);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    
    points = new ArrayList<PVector>(); //Array para mostrar la estela
    
    //Bounding box para detectar la colision con la tierra
    colisionBox = new PVector[2];
    colisionBox[0] = new PVector(location.x - 25, location.y - 25);
    colisionBox[1] = new PVector(location.x + 25, location.y + 25);
    initialPosition.add(location);
}
 
  //Segunda ley de Newton
  void applyForce(PVector force) {
    //Recive la fuerza, la divide por massa, y la añade a la aceleracion.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
 
  void update(int count) {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    colisionBox[0] = new PVector(location.x - 25, location.y - 25);
    colisionBox[1] = new PVector(location.x + 25, location.y + 25);
    
    if(count < 1){
      PVector newPoint = new PVector(location.x,location.y);
      points.add(newPoint);
    }
  }
  
  //Comprobación de si hay colision
  boolean checkCollision(Attractor earth){
    boolean stateCollision = false;
    // Distancia entra los elementos a colisionar (tierra y satelite)
    PVector distanceVect = PVector.sub(earth.location, location);
    
    //Magnitud de esta distancia
    float distanceVectMag = distanceVect.mag();
    
    // Minima distancia de colision
    float minDistance = radius + earth.radius;
    
    if (distanceVectMag < minDistance) {
      stateCollision = true;
    }
    return stateCollision;
  }
 
  void display() {
    image(imageSat, location.x-25, location.y-25, 50, 50);
    displayPoints();
  }
  
  void displayExplosion() {
    image(imageBoom, location.x-25, location.y-25, 50, 50);
  }
  
  void displayPoints(){
    for(int i = 0; i < points.size(); i += 6){
      stroke(255);
      point(points.get(i).x, points.get(i).y);
    }
  }
  
  //Funcion que mueve el satelite a un punto determinado de la scena
  void moveObjectTo(PVector pv){
    
    location = new PVector(pv.x, pv.y);
    
    initialPosition.mult(0);
    initialPosition.add(location);
   }
  void changeVelocity(float vx, float vy){
    velocity.mult(0);
    velocity.add(vx,vy);
    
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}