//Controlador de la cola y cada una de sus partículas
class Tail {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector location;
  
  Tail() {
    location = new PVector(random(0 + 10, width),random(0 + 10,height));
    
    //Añadimos la "cabeza" de la serpiente
    particles.add(new Particle());
  }
  
  //Controla el movimiento de la cola (cada una de las partículas de esta)
  //- Cada una de las partículas sigue a la posición de la anterior 
  //- En el caso de la "cabeza" sigue al ratón 
  void update(){
    //Punto al que seguira la particula (Ratón/Anterior)
    PVector follow;
    
    for (int i = particles.size() - 1; i >= 0; i--) {
      if (i == 0){ 
        follow = new PVector(mouseX,mouseY);
      }else{
        follow = particles.get(i-1).location;
      }
      
      Particle part = particles.get(i);
      
      //Comprobación de los bordes del mapa
      part.checkEdges();
      
      //Actualización y pintado de la partícula de forma individual 
      part.update(follow);
      part.display();
    }
  }
}