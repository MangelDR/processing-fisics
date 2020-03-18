//La clase Bob, es como el Mover normal utilizado en las prácticas anteriores(location, velocity, acceleration, mass)
class Bob { 
  PVector location, velocity, acceleration;
  PImage img;
  PVector Energy, Epot;
  float damping;
  float phi;
  float k, mass;
  float x, y;
  
  // Constructor
  Bob() {
    location = new PVector(width/2,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    mass = 50;
    k = 1;
    phi = 0;
    damping = 0;
    
    Energy = new PVector(0,0);
    Epot = new PVector(0,0);
        
    img = loadImage("basketBall.png");
  } 
  
  //Controlamos el impacto con el suelo
  void checkEdges(char question) {
    if (location.y > height-10) {
      location.y = height - 10;
      velocity.y = velocity.y*-1;
      if(question == 'b'){
        phi = 1;
        velocity.y *= 0.7; 
      }
    }
  }

  // Standard Euler integration
  void update(char question) { 
    velocity.add(acceleration);
    location.add(velocity);
    if(question == 'b'){
      Energy.set(0.5*mass*pow(velocity.x,2), 0.5*mass*pow(velocity.y,2));
      Epot.set(0.8*Energy.x,0.8*Energy.y);
      
      y = sqrt(2*Epot.y/k);
      x = sqrt(Epot.y/k+3);
    }
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  //Draw the Bob
  void display(char question) { 
    if(question == 'a'){
      image(img, location.x-24, location.y-40, 48, 48);
    }else{
      if(question == 'b'){
        if(location.y < height-50){
          y = 0;
        }
        if(phi == 0){
          x = 0;
        }
        if(phi == 1 && x < 1){
          phi = 0;
        }
        image(img, width/2 - 48, location.y, mass - x, mass - y);        
      }
    }
  }
}