void setup() 
{size(1000,700);}

Table fights;

int totalFights = 0;
int totalKnockouts = 0;
int totalSubmissions = 0;
int totalDecisions = 0;

int totalRedStrikes = 0;
int totalBlueStrikes = 0;

int invalidRows = 0;

// Calculate the combined significant strikes
int getTotalStrikes(int redStrikes, int blueStrikes) 
  {return redStrikes + blueStrikes;}

void draw() 
   {background(12, 12, 20);

//Draw the title
fill(255);
textAlign(CENTER);
textSize(32);
text("UFC FIGHT EXPLOSION", width / 2, 80);

//Red corner
noStroke();
fill(255, 40, 60);
ellipse(width / 2 - 180, height / 2, 150, 150);

//Blue corner
fill(40, 120, 255);
ellipse(width / 2 + 180, height / 2, 150, 150);

//Corner labels
fill(255);
textSize(18);
text("RED CORNER", width / 2 - 180, height / 2 + 110);
text("BLUE CORNER", width / 2 + 180, height / 2 + 110);}
