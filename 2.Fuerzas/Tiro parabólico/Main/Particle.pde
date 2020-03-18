/*
 * Particula que formarán la trayectoria
 */
 
class Particle {
  PVector location = new PVector(0,0);
  PVector velocity =  new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float angle;
  
  Particle(PVector InicialVelocity) {
    velocity.add(InicialVelocity);
    angle = -atan(velocity.y/velocity.x);
  }
  
  //Segunda ley de Newton
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  //Calculo analítico de la trayectoria
  void realPosition(float t){
    location.y =location.y + velocity.y*sin(angle)*t - 1/2*acceleration.y*t*t  ;
}
  
  //Funcio para pintar cada particula
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(175);
    ellipse(location.x,location.y, 10, 10);
  }
  
  
}