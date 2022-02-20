class ParkingLot
{
  int xWidth; //Dimension X
  int yHeight;//Dimension Y  
  int xcoor;// x location
  int ycoor;// y location
  
  int numSections; 
  int numStalls; 
  ParkingStallSection[] stallSections; 
  
  
  //constructor 
  ParkingLot()
  {
     numSections = 6; 
     stallSections = new ParkingStallSection[6];
  }


  // GUI functions 
  void drawLot()
  {
    //Draw main ParkingLot
    fill(#717070);
    strokeWeight(6);
    stroke(255);
    rect(xcoor,ycoor,xWidth,yHeight);
    
    //DrawSection
    for(int i = 0; i < stallSections.length; i++)
      stallSections[i].drawSection();  
  }
  
  void setDimensions(int x, int y, int width, int height)
  {
    xWidth = width;
    yHeight = height;
    xcoor=x;
    ycoor=y;
    
    setParkingSectionDimensions(); 
  }
   
  void setParkingSectionDimensions()
  {
     
     int x = 70; 
     int y = 220;
     //Add StallSection object to each array 
     for(int i= 0; i < 6; i++ )
     {
         stallSections[i] = new ParkingStallSection();
         
         if(i == 3)
         {
           x = 630;
           y = 220;    
         }
         //add dimensions to StallSections
         stallSections[i].setDimensions(x, y); 
         
         //increase Y coor 
         y += 180; 
       } 
  }
  
}