class Car
{
  int speed;
  float positionX;
  int positionY = 135;
  boolean parking, inLot;
  color colour;
  boolean occupied = false;
  int sectionRandom = 0;
  int stallRandom = 0;
  
  Car (float px)
  {
    positionX = px;
    colour = color(random(0,255), random(0,255), random(0,255));
    if (random(0,10)>1)
      parking = true;
    else
      parking =false;
  }
  
  
  void drawCar()
  {
    stroke(0);
    strokeWeight(2);
    fill(colour);
    rect(positionX, positionY, 50, 30);
    stroke(0);
    strokeWeight(2);
    fill(#11D2F2);
    rect(positionX+10,positionY+5,10,20);
    rect(positionX+30, positionY+5,10,20);
    noStroke();
    fill(#F4F50C);
    ellipse(positionX+50,positionY+8,5,5);
    ellipse(positionX+50,positionY+20,5,5);
  }
  
  void turnedCar()
  {
    stroke(0);
    strokeWeight(2);
    fill(colour);
    rect(positionX, positionY, 30, 50);
    strokeWeight(2);
    stroke(0);
    fill(#11D2F2);
    rect(positionX+5,positionY+5,20,10);
    rect(positionX+5, positionY+25,20,10);
    noStroke();
    fill(#F4F50C);
    ellipse(positionX+8,positionY+50,5,5);
    ellipse(positionX+20,positionY+50,5,5);
    
    
    
    if(positionY == 160)
    {
     positionY = 2000;
     occupyStall();
     leaveStall();
    }
  }
  
  void turnCarOut()
  {
    stroke(0);
    strokeWeight(2);
    fill(colour);
    rect(positionX, positionY, 50, 30);
    stroke(0);
    strokeWeight(2);
    fill(#11D2F2);
    rect(positionX+10,positionY+5,10,20);
    rect(positionX+30, positionY+5,10,20);
    noStroke();
    fill(#F4F50C);
    ellipse(positionX+50,positionY+8,5,5);
    ellipse(positionX+50,positionY+20,5,5);
    
  }
  
  void leavingCar()
  {
    if(positionY < 730)
    {
    fill(colour);
    positionX = 600;
    positionY = 600;
    }
    else if(positionY == 730)
    {
     turnCarOut();
    }
  }
  
  void moveCar()
  {
    positionX = positionX + 2;
    
    if(parking == true && positionX > 570 && gate.spaces > 0)
    {
      ++positionY;
      positionX = 585;
    }
    else
      positionY = 135;
      
    if(gate.spaces < 120)
    {
      leaveStall();
    }
    if(positionY == 730)
    {
      positionX++;
      positionY = 730;
    }
  }
  
  void occupyStall()
  {
    customers = customers +1;
    
    randomStall();
    
      if(lot.stallSections[sectionRandom].stalls[stallRandom].occupied == false)
      {
        lot.stallSections[sectionRandom].stalls[stallRandom].setStatus(true, date);
        occupied = true;
      }
      else
      {
        occupyStall();
      }
  }
  
  

void randomStall()
{
  sectionRandom = (int)random(0,6);
  stallRandom = (int)random(0,10);
}
  
  
void leaveStall()
  {
    randomStall();
    
    if((int)random(0,10000) < 1)
    {
      if(lot.stallSections[sectionRandom].stalls[stallRandom].occupied == true)
      {
        lot.stallSections[sectionRandom].stalls[stallRandom].setStatus(false, date);
        occupied = false;
        leavingCar();
      }
    }
  }
}
