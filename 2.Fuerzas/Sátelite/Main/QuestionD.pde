void questionD(){
  //Fuerza de atraccion gravitacional 
   PVector force = earth.attract(satelit);
   satelit.applyForce(force);
   
   satelit.update(idem);
   satelit.display();
   
   earth.display(imageEarth);
}