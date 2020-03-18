//Partícula individual de la cola
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  //Box Collider (Caja para las colisiones)
  PVector[] boxSnake;
 
  Particle() {
    location = new PVector(400, 400);
    velocity = new PVector(0,0);
    boxSnake = new PVector[2];
    topspeed = 6;
  }
 
 //Movimiento de la particula
  void update(PVector follow) {
    PVector dir = PVector.sub(follow,location);

    if (dir.mag() > 10){
      dir.normalize();
      dir.mult(1);
  
      acceleration = dir;
      
      boxSnake[0] = new PVector(location.x - 35/2, location.y - 35/2);
      boxSnake[1] = new PVector(location.x + 35/2, location.y + 35/2);
   
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
    }
  }
 

  //Pintado de la aparticula 
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(87,166,57);
    ellipse(location.x,location.y,30,30);
  }
  
  //Comprobación de los bordes del mapa
   void checkEdges() {

    if (location.x > width - 10) {
      location.x = width - 10;
    } else if (location.x < 10) {
      location.x = 10;
    }
 
    if (location.y < 10) {
      location.y = 10;
    }  else if (location.y > height - 10) {
      location.y = height - 10;
    }
  }
}