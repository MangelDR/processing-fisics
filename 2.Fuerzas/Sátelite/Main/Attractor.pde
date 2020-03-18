/*
  Tierra / Earth
*/

class Attractor {
  float mass; //Masa de la tierra
  PVector location; //Localización en escena
  float G, radius; //Constante de gravitación y radio de la tierra respecticamente
  
   //Contructor
  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    radius = 10;
    G = 9.81;
  }
 
 
 //Función para atraer a un objeto (devuelve la fuerza de atracción)
  PVector attract(Mover m) {
    //Calculamos la dirección de la fuerza de atracción
    PVector force = PVector.sub(location,m.location);
    //Calculamos la distancia entre los dos objetos
    float distance = force.mag();

    //Forzamos restringir la distancia para que nuestro calculo
    //de la fuerza de atracción no se vaya de control
    //distance = constrain(distance,5.0,25.0);
   
    //Normalizamos el vector y le damos la fuerza de atracción correspondiente
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
  
  //Funcion que muestra la tierra 
  void display(PImage iEarth) {
    image(iEarth, location.x-25, location.y-25, 50, 50);
  }
}