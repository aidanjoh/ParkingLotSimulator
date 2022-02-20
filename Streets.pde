class Street 
{
  
  String streetName; 
  int xcoor; 
  int ycoor; 
  int xWidth; 
  int yHeight; 
  
  
  
  Street(String name, int x, int y, int w, int h)
  {
    streetName = name;
    xcoor = x; 
    ycoor = y; 
    xWidth = w; 
    yHeight = h; 
  }
  
  void drawStreet()
  {
    stroke(255);
    strokeWeight(6);
    fill(#717070); 
    rect(xcoor, ycoor, xWidth, yHeight); 
    fill(255);
    textSize(20);
    text(streetName, xcoor+(xWidth/2)-(streetName.length()*5), ycoor+(yHeight/2));
    
    noStroke();
    fill(#717070);
    rect(574,170,53,60);
    rect(574,680,53,60);
    
    stroke(#FFFFFF);
    strokeWeight(5);
    line(574, 180, 574, 200);
    line(574, 710, 574, 730);
    
    line(627, 180, 627, 200);
    line(627, 710, 627, 730);
    
    noStroke();
    rect(574, 780, 53, 30);
  }
}