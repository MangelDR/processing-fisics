//Controlador de los/el gusano
Worm worm;

//Controlador de la cola y cada una de sus partículas
Tail tail;

//Controlador de el HUB (información que se muestra al usuario: tiempo y puntuación)
Hud hud; 

int contact = 1;
int puntos = 0;
int time = 0;
int milis = 0;

PImage imagen; 


void setup() {
  
  size(900,700);
  background(255);
  
  worm = new Worm();  
  tail = new Tail();
  hud = new Hud();
  
  //Imagen que se utilizará para el fondo
  imagen = loadImage("images/background.jpg");
}

void draw() {
  background(255);
  image(imagen,0,0);
  
  time = 60 -millis()/1000;
  
  if (time <= 0){
    time = 0;
    
    //Mensaje final cuando el tiempo se agota que muestra la puntuación final
    hud.end();
  
  }else{
    //Controla el movimiento de la cola (cada una de las partículas de esta)
    tail.update();
    //Controla el movimiento del gusano así como si este colisiona o no
    worm.update();
  
    //Comprobación de la colisión
    contact = worm.isContact(tail.particles.get(0).boxSnake);
    
    //Si hay contacto actualizamos la puntación y añadimos un partícula más a la cola
    if (contact == 1){
      puntos++;
      worm.contact = 1;
      tail.particles.add(new Particle());
    }
    
  }
  
  //Controla la información que se muestra por pantalla (Tiempo y Puntos) 
  hud.update();
}