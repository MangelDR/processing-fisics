Ball ball; 

ArrayList<Particle> particles = new ArrayList<Particle>();
float mass = 2;
PVector inicialLocation =  new PVector (0, 400);
PVector inicialVelocity = new PVector (8,-7);
int count = 0; //Controlador temporal de las nuevas particulas

void setup() {
  size(1200, 400);
  
  ball = new Ball (mass, inicialLocation,inicialVelocity);
}

void draw(){
   background(200);
   
   count++;
   
   //Pelota
   ball.applyGravity();
   ball.update();
   ball.display();
   ball.checkEdgeX();
   
   //--Trayectoria
   //Generacion de una nueva particula
   if(count%10 == 0 && ball.velocity.x > 0){
    PVector loc = new PVector(ball.location.x, ball.location.y);
     
    Particle particle = new Particle(inicialVelocity);
    particle.location = loc;
    particle.applyForce(new PVector(0,mass*0.1));
    particle.realPosition(millis()/1000);
    particles.add(particle);
    
  }
  
  //Particulas
  for(int i = 0; i<particles.size(); i++){
    particles.get(i).display();
  }
}