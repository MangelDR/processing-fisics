void questionA(){
  //Actualizo la fuerza de atracción de la tiera sobre el satelite 
  PVector force = earth.attract(satelit);
  satelit.applyForce(force);

  earth.display(imageEarth);
  
  if(satelit.checkCollision(earth)){
    //Colision entre Tierra y satelite
    satelit.displayExplosion();
  }else{
    //No han colisionado, seguimos orbitando...
    satelit.display();
    //Actualizamos la posicion del satelite
    satelit.update(idem);
  }
}