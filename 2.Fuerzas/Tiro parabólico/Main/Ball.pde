/*
 * Objeto del tiro parabólico
 */

class Ball{
  PVector location = new PVector(0,0);
  PVector velocity =  new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float mass;
 
 Ball (float m, PVector p0, PVector v0) {
   mass = m;
   velocity.add(v0);
   location.add(p0);
 }
 
 void update (){
   velocity.add (acceleration);
   location.add(velocity);
   acceleration.mult(0);
 }
 
 void display(){
   stroke(0);
   strokeWeight(2);
   fill(0,127);
   ellipse(location.x,location.y, 30, 30);
 }
 
 //Segunda ley de Newton
 void applyForce (PVector force){
    PVector f = PVector.div(force, mass); 
    acceleration.add(f);
  }
  
  //Aplicación de la gravedad si la pelota no se encuentra en el suelo
  void applyGravity(){
    if(checkFloor()){
      stopVelocity(); 
    }else{
      PVector gravity = new PVector(0, 0.1 * ball.mass);
      ball.applyForce(gravity);
    }
  }
  
  //Función que para el movimiento de la pelota
  void stopVelocity(){
    velocity = new PVector (0, 0);
  }
 
 //Función que controla que la pelota se vaya por el lado derecho de la pantalla
 void checkEdgeX() {
    if (location.x > width) {
      location.x = width;
      
      velocity.x = 0;
      velocity.y = 0;
    } 
  }
  
  //Función que comprueba si la pelota esta en ele suelo
  boolean checkFloor(){
    if (location.y > height){
      return true;
    }
    
    return false; 
  }
  
}