void questionB(){
  //Actualizo la fuerza de atracción de la tiera sobre el satelite 
  PVector force = earth.attract(satelit);
  satelit.applyForce(force);
 
  //No han colisionado, seguimos orbitando...
  satelit.display();
  earth.display(imageEarth);
  //Actualizamos la posicion del satelite
  satelit.update(idem);
  
  r1 = (PVector.sub(earth.location, satelit.location)).mag();
  if(r1 > rmax){
    rmax = r1;
  }
  if(r1 < rmin){
    rmin = r1;
  }
  
  if(rmax > 0 && rmin < 999999){
    //Equivale a =>  SIMPLIFICADO => e = (((rmax+rmin)/2)-rmin)/((rmax+rmin)/2);
    e = (rmax - rmin)/(rmax+rmin);
    end_points = true;
  }
 
  if( round(initialPos.x) == round(satelit.location.x) && round(initialPos.y) == round(satelit.location.y)){
    idem++;
  }
  
  //Printamos las estadísticas
  //Tamaño
  textSize(14);
  if (rmin == 999999){
    //Color azulado
    fill(0, 102, 153);
    text("R min: - px",120,460);
  }else{
    //Color azulado
    fill(0, 102, 153);
    text("R min: " + nf(rmin, 0, 2) + "px",120,460);
  }
  //Tamaño
  textSize(14);
  if( rmax == 0){
    text("R max: - px",120,410);
  }else{  
    text("R max: " + nf(rmax, 0, 2) + "px",120,410);
  }
  //mostramos la excentricidad
  textSize(16);
  text("E: " +  nf(e, 0, 2), 120, 510);
}