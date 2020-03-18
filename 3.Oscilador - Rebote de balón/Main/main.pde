// Mover object
Bob bob;

// Spring object
Spring spring;

//Controlador de los enunciados (a, b (apartado b1), c (apartado b2)) 
char question = 'c';

PVector gravity;

void setup() {
  size(600,400);
  smooth();
  
  //Relantitzem el moviment
  frameRate(100);
  
  gravity = new PVector(0,0.2);
 
 //Constructores
  bob = new Bob();
  spring = new Spring(width/2,10,100); 
}

void draw() {
  background(255);
    switch(question){
    case 'a':
      q1();
    break;
    case 'b':
      q2();
    break;
    case'c':
      q3();
    break;
  }
}

//Apartado A
void q1(){
  bob.applyForce(gravity);  
  bob.checkEdges(question);
  bob.update(question);
  bob.display(question); 
}

//Apartado B
void q2(){
  bob.applyForce(gravity);  
  bob.checkEdges(question);
  bob.update(question);
  bob.display(question); 
}

//Apartado C
void q3(){
  PVector gravity = new PVector(0,2);
  float c = 0.4;
  PVector friction = bob.velocity.get();
  PVector friction2 = spring.velocity.get();

  friction.mult(-1); 
  friction.normalize();
  friction.mult(c);
  friction2.mult(-1); 
  friction2.normalize();
  friction2.mult(c);

  bob.applyForce(friction);
  bob.applyForce(gravity);
  spring.applyForce(friction2,bob);
  spring.applyForce(gravity, bob);
  spring.update();
  
  // Connect the bob to the spring (this calculates the force)
  spring.connect(bob);
  
  // Constrain spring distance between min and max
  float maxlen;
  
  spring.constrainLength(bob, 30, 55);
   
     
  // Update bob
  bob.update(question);
  bob.checkEdges(question);
 
  spring.checkEdges();
  spring.posy = -(bob.location.y - spring.anchor.y);

  // Draw everything
  spring.displayLine(bob); // Draw a line between spring and bob
  
  fill(0);
}