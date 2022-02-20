//FinalProject
//Aidan Johnson and Serena Hasham
//UCID #30043501 and #3002558
//November 20, 2017
ParkingLot lot = new ParkingLot();
Street northSt;
Street southSt;

Date date;
Car car[];
Gate gate;
int customers;
int timeElasped = 0;
int twelveHourElasped = 0;
float netProfit = 0;
boolean pause = true;
float fee = 0;

void setup()
{
  frameRate(600);
  size(1200,800);
  lot.setDimensions(50, 200, 1100, 510);
  northSt = new Street("North City Street", -5, 120, 1210, 60);
  southSt = new Street("South City Street", -5, 730, 1210, 60);
  lot.drawLot();
  
  backGroundCreator(); 
  
  car = new Car[1000];
  float begin = -10;
  date = new Date(0, 1, 0, false);
  gate = new Gate(date);
  gateCreator();
  for(int i = 0; i< car.length; i++, begin = begin - random(75,220))
    car[i] = new Car(begin);
  controlPanelCreator();
}

void draw()
{
  if(pause)
  {
  backGroundCreator();
  lot.drawLot();
  controlPanelCreator();
  
  northSt.drawStreet(); 
  southSt.drawStreet(); 
  
  
  gate = new Gate(date);
  gateCreator();
  
  for(int i = 0; i < 1000; i++)
  {
    if(car[i].positionX > 570 && car[i].parking == true && gate.spaces > 0)
    {
      car[i].turnedCar();
    }
    else if (car[i].positionY == 730)
    {
      car[i].leavingCar();
      car[i].turnCarOut();
    }
    else
      car[i].drawCar();

    car[i].moveCar();
  }
  
  
  if(frameCount%10==0)
  {
    date.addMinute();
    gate.PriceCalculator();
  }
  
  
  timeElasped = (date.hour%12) + (twelveHourElasped*12);
  
  fill(0);
  textSize(14);
  text(" $ " + fee, 525, 725);
  }
}


void mouseClicked()
{
  if(mouseX > 520 && mouseX < 600 && mouseY>20 && mouseY < 100)
    pause = true;
  else if (mouseX > 620 && mouseX < 700  && mouseY> 20 && mouseY < 100)
    pause = false;
}


void gateCreator()
{
  //gate = new Gate(new Date(4,2,30,false));
  gate.drawGate();
}

void backGroundCreator()
{
  BackGround backGround = new BackGround(0,0);
  backGround.drawBackGround();
}

void controlPanelCreator()
{
   ControlPanel mainPanel = new ControlPanel(30, 10, 400, 90);
   mainPanel.drawControlPanel();
   
}
