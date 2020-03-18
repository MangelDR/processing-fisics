//Controlador de los/el gusano
class Worm {
  //Box Collider (Caja para las colisiones)
  PVector[] w_box; 
 //Imagen que tendrá el gusano
  PImage image;
  
  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;
  float contact;
  float finish;

  Worm() {
    
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(0,0);
    w_box = new PVector[2];
    
    image = loadImage("images/imageWorm.png");
    
    topspeed = 0.7;
    finish = 0;
  }

  void update() {
    
    //Creamos otro gusano si el jugador impacta con el primero
    if(contact == 1){
      location = new PVector(random(0,width),random(0,height));
      contact = 0;
    }
    //Randomizamos el movimiento del gusano
    acceleration = PVector.random2D();
    acceleration.mult(random(1));
    
    w_box[0] = new PVector(location.x - 40/2, location.y - 40/2);
    w_box[1] = new PVector(location.x + 40/2, location.y + 40/2);

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
    
    checkEdges();
    
   if(finish == 0){
      image(image, location.x, location.y, 40, 40);
    }
    
  }
  
  //Comprobación de las colisiones
  int isContact(PVector[] bxSke){
    int contact = 0;
    if((w_box[0].x > bxSke[0].x && w_box[0].x < bxSke[1].x && w_box[0].y > bxSke[0].y && w_box[0].y < bxSke[1].y) ||
       (w_box[1].x > bxSke[0].x && w_box[1].x < bxSke[1].x && w_box[1].y > bxSke[0].y && w_box[1].y < bxSke[1].y) ||
       (bxSke[0].x > w_box[0].x && bxSke[0].x < w_box[1].x && bxSke[0].y > w_box[0].y && bxSke[0].y < w_box[1].y) ||
       (bxSke[1].x > w_box[0].x && bxSke[1].x < w_box[1].x && bxSke[1].y > w_box[0].y && bxSke[1].y < w_box[1].y)){
        
         contact = 1;
    }else{
      contact = 0;
      //println(bxSke[1].x);
    }
    return contact;
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