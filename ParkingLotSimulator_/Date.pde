class Date 
{
 final String [] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
 int today;
 int hour;
 int minute;
 boolean am;
 
 
 //constructor 
 Date (int d, int h, int m, boolean beforeNoon) 
 {
   today = d%7;
   hour = h%12;
   minute = m%60;
   am = beforeNoon;
 }
 
 //constructor 
Date (Date d) 
 {
   today = d.today;
   hour = d.hour;
   minute = d.minute;
   am = d.am;
 }

 void addHour() 
 {
   if (hour == 11 && am == true) 
   {
     am = false;
     twelveHourElasped = twelveHourElasped + 1;
   } 
   else if (hour == 11 && am == false) 
   {
     am = true;
     today = today + 1;
     twelveHourElasped = twelveHourElasped + 1;
   } 
   if(hour<=11)
   {
     hour = hour + 1;
   }
   else
     hour = 1;
 }

 void addMinute() 
 {
   if (minute == 59) 
   {
     minute = 0;
     addHour();
   } else 
     ++minute;

 }

 String toString() 
 {
   String date = days[today%7];
   if (hour < 10)
     date += " 0" + hour;
   else
     date += " " + hour;

   if (minute < 10)
     date += ":0" + minute;
   else
     date += ":" + minute;
   if (am)
     date += "AM";
   else
     date += "PM";
     
   return date;
   
 }

 boolean equal(Date date) 
 {
   if ((today == date.today) && (hour == date.hour) && (minute == date.minute) && (am == date.am)) 
   {
     return true;
   } else
     return false;
 }
 
 
void updateCurrentDay()
{
  today = (today + 1)%7; 
}

}