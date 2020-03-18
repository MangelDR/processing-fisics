Mover satelit;
Attractor earth;


PImage imageBoom, imageSat, imageEarth, imageSpace;

int enterOK = 0,idem = 0;
float e = 0, r1 = 0, r2 = 0, r3 = 0, radiusMaxAux = 0, radiusMinAux = 0, rmax, rmin;
char option;

boolean end_points, showEnterOption, primer = true;

PVector initialPos;
PVector omaxi = new PVector(0, 0);


float ar1 = 0, ar2 = 0, ar3 = 0, ar4 = 0;
float time1 = 0, time2 = 0;

ArrayList <PVector> firstArea, secondArea;

void setup() {
  //Creo la ventana con el tamaño 900x600
  size(900, 600);
  smooth();
  
  print("SETUP");
  
  //Cargo las imagenes necesarias
  imageEarth = loadImage("Earth.png");
  imageBoom = loadImage("Explosion.png");
  imageSat  = loadImage("Satellite.png");
  imageSpace = loadImage("space.jpg");
  
  earth = new Attractor();
  satelit = new Mover();
  
  
  //Inicializo algunas variables
  option = 'C';
  
  //Creo objetos para el desarrollo correcto de cada tipo de question
  switch(option) {
    case 'A':
      satelit.moveObjectTo(new PVector(random(0.1, 2), random(100, 400), random(100, 400)));
      satelit.velocity = new PVector(0,0);
    break;
    case 'B':
      satelit.moveObjectTo(new PVector(width/2,100));
      satelit.velocity = new PVector(0.78, 0.22);
    
    break;
    case 'C':  
      satelit.moveObjectTo(new PVector(width/2,100));
      satelit.velocity = new PVector(0.7, 0.3);
    break;
    case 'D':  
      satelit.moveObjectTo(new PVector(width/2 - 100,height/2));
      
      //Compensamos la fuerza de gravedad con una velocidad de orbitación que cree una orbita circular 
      float dist = (PVector.sub(earth.location, satelit.location)).mag();
      
      satelit.velocity = new PVector (0.0, 0.0);
      satelit.velocity.y = dist * sqrt(((earth.G *earth.mass)/pow(dist,3)));
      
      questionD();
    break;
  }
  
  initialPos = new PVector(satelit.location.x, satelit.location.y);
  firstArea = new ArrayList<PVector>();
  secondArea = new ArrayList<PVector>();
  
  rmin = 999999; rmax = 0;
  
  end_points = false; showEnterOption = false;
}

void draw() {
  background(0, 2, 10);
  //image(imageSpace, 0, 0, 900, 600);
  
  switch(option) {
    case 'A': questionA(); break;
    case 'B': questionB(); break;
    case 'C': questionC(); break;
    case 'D': questionD(); break;
    
  }
}