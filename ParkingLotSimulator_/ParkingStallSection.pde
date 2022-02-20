class ParkingStallSection
{
  
  ParkingStall[] stalls;  //array of objects or feel free to use arraylists
  
  int numStalls; 
  
  int xcoor;
  int ycoor;


  ParkingStallSection()
  {
    numStalls = 10;
    stalls = new ParkingStall[numStalls];
    
    int x = 0;
    int y =0;
    for(int i = 0; i < stalls.length; i++)
    { 
       if(i == 5)
       {
        y = 1; 
        x = 0; 
        }
       stalls[i] = new ParkingStall(xcoor+(x*100), ycoor+(57*y),100,55);
       stalls[i].drawStall(); 
       x++;
    }
  
  }

  void setDimensions(int x, int y)
  {
    xcoor = x;
    ycoor = y;
  }
  
  void drawSection()
  {
    
    int x = 0;
    int y =0;
    for(int i = 0; i < stalls.length; i++)
    { 
       if(i == 5)
       {
        y = 1; 
        x = 0; 
       }
        stalls[i].posX =xcoor+(x*100);
        stalls[i].posY =ycoor+(57*y);
        stalls[i].stallWidth =100;
        stalls[i].stallHeight =55;
        stalls[i].drawStall(); 
       
        x++;
    }
  }
}