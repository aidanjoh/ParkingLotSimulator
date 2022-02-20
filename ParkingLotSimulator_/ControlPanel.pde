class ControlPanel
{
  int xCoord;
  int yCoord;
  int xWidth;
  int yHeight;

  ControlPanel(int x, int y, int w, int h)
  {
    xCoord=x;
    yCoord=y;
    xWidth=w;
    yHeight=h;
    
  }
  
  void drawControlPanel()
  {
    stroke(0);
    strokeWeight(3);
    fill(#AFACAC);
    rect(xCoord, yCoord, xWidth, yHeight);
    rect(xCoord+480, yCoord, xWidth-200, yHeight+5);
    rect(xCoord+750, yCoord, xWidth-180, yHeight+10);
    stroke(255);
    strokeWeight(3);
    fill(0);
    textSize(16);
    text("Parking Rates:", 35,30);
    text("$3.00/Hour         Monday-Saturday           All Day", 35, 60);
    text("$1.50/Hour         Sunday                           All Day", 35, 90);
    stroke(0);
    fill(#AFACAC);
    ellipse(560,60,75,75);
    ellipse(660,60,75,75);
    fill(#45FF39);
    triangle( 550,40,580,60,550,80);
    stroke(0);
    strokeWeight(10);
    line(645,40,645,80);
    line(675,40,675,80);
    fill(0);
    text("Simulation Values: ", 790, 30);
    textSize(14);
    text("Net Profit: " + netProfit, 790,50);
    text("Time Elapsed: " + timeElasped + " Hours", 790,75);
    text("Customers: " + customers, 790,100);
    
    fill(0);
    textSize(13);
    text("Time: " + date, 1010, 20);
    
    if (date.hour >= 7 && date.hour < 12 && date.am == false || date.hour < 7 && date.am == true || date.hour == 12 && date.am == true)
    {
      rect(xCoord+1040, yCoord+20, xWidth-280, yHeight-10);
      noStroke();
      fill(255);
      ellipse(1125, 70, 60,60);
    
      fill(0);
      ellipse(1105, 70, 50, 50);
    }
    else if (date.hour >= 7 && date.am == true || date.hour < 7 && date.am == false || date.hour == 12 && date.am == false)
    {
      strokeWeight(2);
      stroke(255);
      fill(#5393EA);
      rect(xCoord+1040, yCoord+20, xWidth-280, yHeight-10);
      
      fill(#F2E70A);
      ellipse(1130, 70, 60, 60);
    }
    }
}