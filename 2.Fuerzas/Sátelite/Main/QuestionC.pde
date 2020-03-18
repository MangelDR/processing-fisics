void questionC(){
    //Actualizo la fuerza de atracción de la tiera sobre el satelite 
  PVector force = earth.attract(satelit);
  satelit.applyForce(force);
  
  //----- Guardamos los puntos de cada area recorrida en un intervalo de tiempo 
  time1 = time1 + 1;
  
  if(primer){
    time2 = time1;
    primer = false;
   }
   if((time1 - time2) > 100){
     PVector aux = new PVector();
     aux.x = satelit.location.x;
     aux.y = satelit.location.y;
     if(time1 >= 50 && time1 <= 200){
       firstArea.add(aux);
        
    }
    if(time1 >= 400 && time1 <= 600){
       secondArea.add(aux); 
     }
    }  
   //-----
   
  //No han colisionado, seguimos orbitando...
  satelit.display();
  earth.display(imageEarth);
  //Actualizamos la posicion del satelite
  satelit.update(idem);
  
  r1 = (PVector.sub(earth.location, satelit.location)).mag();
  if(r1 > rmax){
    rmax = r1;
    omaxi.add(satelit.location);
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
    showEnterOption = true;
  }
  
  
  if (idem >= 1 && enterOK != 1){
    textSize(16);
    //Color amarillento
    fill(255, 255, 10);
    text("Press 'ENTER' to calculate the areas ", 550, 500);
  }
  if(showEnterOption){
    if (keyPressed) {
      if (key == ENTER) {
        enterOK = 1;
      }
    }
  }
  if (enterOK == 1){
    textSize(20);
    //Color azulado
    fill(0, 255, 240);
    text("Trapezi Areas:", 120,410);
    textSize(20);
    fill(0, 255, 240);
    text("Simpson Areas:", 290, 410);
    
    textSize(20);
    text(ar2, 120, 475); 
    text(ar4, 290, 475);
    text(ar1, 120, 450); 
    text(ar3, 290, 450);
    
    for(int j = 0; j < firstArea.size(); j++){
      stroke(color(255, 0, 0));
      strokeWeight(0.1);
      line(earth.location.x+5, earth.location.y+5, firstArea.get(j).x, firstArea.get(j).y); 
      strokeWeight(1);
    }
    for(int j = 0; j < secondArea.size(); j++){
      stroke(color(0, 255, 0));
      strokeWeight(0.1);
      line(earth.location.x+5, earth.location.y+5, secondArea.get(j).x, secondArea.get(j).y); 
      strokeWeight(1);
    }
    

    
    //----- Trapecio y Simpson
    float a = sqrt(pow(earth.location.x+5 - firstArea.get(0).x, 2) + pow(earth.location.y+5 - firstArea.get(0).y, 2));
    float b = sqrt(pow(earth.location.x+5 - firstArea.get(firstArea.size()-1).x, 2) + pow(earth.location.y+5 - firstArea.get(firstArea.size()-1).y, 2));
    PVector oa = new PVector(-earth.location.x+5 + firstArea.get(0).x, -earth.location.y+5 + firstArea.get(0).y);
    PVector ob = new PVector(-earth.location.x+5 + firstArea.get(firstArea.size()-1).x, -earth.location.y+5 + firstArea.get(firstArea.size()-1).y);
    PVector obab = new PVector(oa.x + ob.x, oa.y+ ob.y);
    float fa = PVector.angleBetween(oa , omaxi); 
    float fb = PVector.angleBetween(ob , omaxi);

    
    ar1 = abs((a-b)*(fb+fa)/2);
    ar3 = abs(((a-b)/6)*(fa+fb+4*(PVector.angleBetween(obab , omaxi))));
   
   
    a= sqrt(pow(earth.location.x+5 - secondArea.get(0).x, 2) + pow(earth.location.y+5 - secondArea.get(0).y, 2));
    b = sqrt(pow(earth.location.x+5 - secondArea.get(secondArea.size()-1).x, 2) + pow(earth.location.y+5 - secondArea.get(secondArea.size()-1).y, 2));
    oa = new PVector(earth.location.x+5 - secondArea.get(0).x, earth.location.y+5 - secondArea.get(0).y);
    ob = new PVector(earth.location.x+5 - secondArea.get(secondArea.size()-1).x, earth.location.y+5 - secondArea.get(secondArea.size()-1).y);
    fa = PVector.angleBetween(oa , omaxi);  
    fb = PVector.angleBetween(ob , omaxi);
    obab = new PVector(oa.x + ob.x, oa.y+ ob.y);

    
    ar2 = abs((a-b)*(fb+fa)/2);
    ar4 = abs(((a-b)/6)*(fa+fb+4*(PVector.angleBetween(obab , omaxi))));
 
   //-----
    
  }else{
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
}