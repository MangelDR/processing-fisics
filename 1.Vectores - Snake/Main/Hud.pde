//Controlador de el HUB (información que se muestra al usuario: tiempo y puntuación)
class Hud{
  PImage wormGray;
  
  Hud(){
    wormGray = loadImage("images/imageGRAYWorm.png");
  }
  
  //Actualización de la información que se muestra por pantalla (tiempo y puntuación)
  void update(){
    fill(0,0,0);
    textSize(35);
    text("Time: " + time, 20, 35);
    text("Food: " + puntos, 220, 35);
    image(wormGray,370,8,25, 25);
  }
  
  //Mensaje final mostrando la puntuación final 
  void end(){
    fill(0,0,0,60);
    rect(0, 0, 900, 700);
   
    fill(255,240,240);
    rect(width/3 - 40, height/2 - 40, width/3 + 170, height/4 - 50);
    
    fill(0,0,0);
    textSize(35);
    text("¡¡ Time is out !!", width/3 + 50, height/2);
    text("You have eaten " + puntos + " worms", width/3 - 20, height/2 + 40);
  }
  
}