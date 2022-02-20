class BackGround
{
  int xPos;
  int yPos;
  
  BackGround(int x, int y)
  {
    xPos=x;
    yPos=y;
  }
  
  void drawBackGround()
  {
    fill(#28AF17);
    rect(xPos,yPos,1200,800);
  }
  
}