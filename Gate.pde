class Gate
{
  boolean status; //true means the gate is opened and false means the gate is closed
  int xCord;
  int yCord;
  Date currentDate; 
  Date[] carStartTimeSlot;  
  int spaces;
  
  Gate (Date date)
  {
    spaces = 60;
    status = true;
    carStartTimeSlot = new Date[60];
    currentDate = date;
    
    for(int i = 0; i < 6; i++)
    {
      for(int j = 0; j < 10; j++)
      {
        if(lot.stallSections[i].stalls[j].occupied == true)
        {
          spaces--;
        }
        else
          spaces++;
      }
      
    }
  }
  
  
  
  void PriceCalculator()
{
    for(int i = 0; i < 6; i++)
    {
      for(int j = 0; j < 10; j++)
      {
        if(lot.stallSections[i].stalls[j].occupied)
        {
          if(date.today == 6)
          {
            //adding fee per minute for Sunday
            lot.stallSections[i].stalls[j].fee += 0.025;
          }
          else
          {
            //Adding fee per minute for weekdays and Saturday
            lot.stallSections[i].stalls[j].fee += 0.05;
          }
        }
        
        if(lot.stallSections[i].stalls[j].occupied == false && lot.stallSections[i].stalls[j].fee != 0)
        {
          fee = 0.5*Math.round(lot.stallSections[i].stalls[j].fee);
          netProfit += 0.5*Math.round(lot.stallSections[i].stalls[j].fee);
          lot.stallSections[i].stalls[j].fee = 0;
        }
      }
      
    }
  
  
}
  
  
  //     0     1      2     3       4     5      6     7    8     ... 60 
  // |  Time ||---  |Time | _ _ | _ _ | _ _ | _ _ | _ _ |
  
  //Old Price Calculator
 /* int enterGate()
  {
    
    int gateTicketNum = 0; 
    //first fine an empty stall 
    for(int i = 0; i < carStartTimeSlot.length; i++){
      if(carStartTimeSlot[i] == null){
        carStartTimeSlot[i] = new Date(currentDate.today, currentDate.hour, currentDate.minute, currentDate.am); 
        gateTicketNum = i; 
        break; 
      }
    }
    return gateTicketNum; 
  }
  
  
  Date getCarArrival(int ticketNum)
  {
    return carStartTimeSlot[ticketNum]; 
  }
  
  //Remove car from carsStartTimeSlot. 
  void exitGate(int ticketNum)
  { 
    carStartTimeSlot[ticketNum] = null; 
  }
  
  
  float getRate(Date arrivalDate){
    
    //First get Arrival time, and exit time
    //Date arrivalDate = getCarArrival(ticketNum); 
    
    //calculate total days parked
    int totalDays = 0; 
    if(arrivalDate.today > currentDate.today)
      totalDays = (currentDate.today + 7) - arrivalDate.today; 
    else
      totalDays = currentDate.today - arrivalDate.today;
    
    
    //calculate total 
    float arrival = (arrivalDate.hour + (arrivalDate.minute/60));
    float exit = (currentDate.hour + (currentDate.minute/60)); 
    if(arrivalDate.am == false)
      arrival += 12; 
    if(currentDate.am == false)
      exit += 12; 
    
    println("------------------------");
    println("Arrival Time: " + arrival);
    println("exit Time: " + exit);
    //calculate rate, conting half of on sunday
    //sunday full day, or just some time
    //arrive & leave the sameday
    float Totalcost; 
    if(totalDays == 0){
      println("Zero");
      Totalcost = (exit - arrival) * getHourlyRate(arrivalDate.today); 
    }
    
    // arrive or leave on a Sunday 
    else if(arrivalDate.today == 6 || currentDate.today == 6){
      println("Overnight");
        Totalcost = ((24 - arrival)*getHourlyRate(arrivalDate.today)) +((24*(totalDays-1))*getHourlyRate(0))+(exit *getHourlyRate(currentDate.today));
  
    }
    //arrive on a day with index more than day of departure 
    else if(arrivalDate.today > currentDate.today){
      println("Multupleday 1");
      Totalcost = ((24 - arrival)*getHourlyRate(arrivalDate.today))+ ((24*(totalDays-2))*getHourlyRate(0)) + 
              (24*getHourlyRate(6))+ (exit *getHourlyRate(currentDate.today));
    }else{
      println("Multupleday 2");
      println(totalDays);
      println("arrival rate: " + getHourlyRate(arrivalDate.today));
      println("exit rate: " + getHourlyRate(currentDate.today));
      Totalcost = ((24-arrival)*getHourlyRate(arrivalDate.today))+((24*(totalDays-1))*getHourlyRate(0))+(exit*getHourlyRate(currentDate.today));
    }

    println("Arrive: " + arrivalDate.toString()+"   Exit: " + currentDate.toString()); 
    println("Total Cost Parked: " + Totalcost);
    println("------------------------");
    return Totalcost; 
  }
  
 
    day: index day of the week: 
          monday = 0; 
          tuesday = 1;
          wednesday = 2; 
          ... and so on 
  
  float getHourlyRate(int day){
    
    if(day >= 0 && day <= 5){
      return 3; 
    }else{
      return 1.5; 
    }
 
  }
  */
  void drawGate()
  {
    sign();
    if(spaces > 0)
      openGate();
    else
      closeGate();
  }
  
  void openGate()
    {
      stroke(0);
      strokeWeight(7);
      line(574, 710, 615, 680);
      line(574, 200, 615, 170);
      
      noStroke();
      fill(#17FAED);
      ellipse(574, 710, 10, 10);
      ellipse(574, 200, 10, 10);
    }
    
   void closeGate()
    {
      stroke(0);
      strokeWeight(7);
      line(574, 710, 615, 680);
      line(574, 200, 627, 200);
      
      noStroke();
      fill(#17FAED);
      ellipse(574, 710, 10, 10);
      ellipse(574, 200, 10, 10);
   }
   
   void sign()
   {
     //Top Sign
     strokeWeight(3);
     stroke(0);
     fill(255);
     rect(490, 180, 80, 20);
     fill(#4ABDF5);
     rect(490, 200, 80, 20);
     
     fill(0);
     textSize(14);
     text("ENTRANCE",495, 195);
     
     textSize(13);
     text("SPACES: " + (spaces/2), 495, 215);

     //Bottom Sign
     strokeWeight(3);
     stroke(0);
     fill(255);
     rect(490, 690, 80, 20);
     fill(#4ABDF5);
     rect(490, 710, 80, 20);
     
     fill(0);
     textSize(14);
     text("EXIT",515, 705);
     
     textSize(12);
     text("FEE = ", 495, 725);
   }
}