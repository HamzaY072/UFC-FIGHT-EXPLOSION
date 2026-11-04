Table matches;
Fight[] fightObjects;

int fightCount = 0;
int totalKnockouts = 0;
int totalSubmissions = 0;
int totalDecisions = 0;

void setup() {
size(1200, 900);
smooth();

matches = loadTable("UFC_2024_Main_Card_Fights_CSV.csv", "header");

if (matches == null) {
println("Could not load the UFC CSV file.");
println("Put UFC_2024_Main_Card_Fights_CSV.csv inside the data folder.");
exit();
return;
}

fightCount = matches.getRowCount();
fightObjects = new Fight[fightCount];

for (int i = 0; i < fightCount; i++) {
TableRow row = matches.getRow(i);
String eventDate = row.getString("event_date");
String finishDetails = row.getString("header_finish_details_detailed");
fightObjects[i] = new Fight(eventDate, finishDetails);

String finish = finishDetails == null ? "" : finishDetails.toLowerCase();

if (finish.contains("ko") || finish.contains("tko")) {
totalKnockouts++;
} else if (finish.contains("submission")) {
totalSubmissions++;
} else if (finish.contains("decision")) {
totalDecisions++;
}
}

println("UFC dataset loaded successfully.");
println("Number of fights: " + fightCount);
println("Knockouts: " + totalKnockouts);
println("Submissions: " + totalSubmissions);
println("Decisions: " + totalDecisions);
}

void draw() {
background(0);

fill(230, 50, 50);
textAlign(CENTER);
textSize(32);
text("UFC FIGHT EXPLOSION", width / 2, 55);

fill(255);
textSize(17);
text("UFC 2024 MAIN CARD FIGHT STATISTICS", width / 2, 85);

noStroke();
fill(85, 85, 92);
rect(70, 110, 1060, 105, 12);

fill(230, 90, 80);
textSize(19);
textAlign(CENTER);
text("TOTAL FIGHTS: " + fightCount, 180, 165);
text("KNOCKOUTS: " + totalKnockouts, 430, 165);
text("SUBMISSIONS: " + totalSubmissions, 690, 165);
text("DECISIONS: " + totalDecisions, 950, 165);

fill(255);
textSize(23);
text("UFC FIGHT OUTCOMES BY MONTH", width / 2, 270);

float graphLeft = 175;
float graphRight = 1080;
float graphTop = 310;
float graphBottom = 760;

fill(0);
rect(graphLeft, graphTop, graphRight - graphLeft,
graphBottom - graphTop);

stroke(190);
strokeWeight(2);
line(graphLeft, graphTop, graphLeft, graphBottom);
line(graphLeft, graphBottom, graphRight, graphBottom);

String[] months = {
"JANUARY", "FEBRUARY", "MARCH", "APRIL",
"MAY", "JUNE", "JULY", "AUGUST",
"SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"
};

textSize(12);
textAlign(RIGHT);

for (int m = 0; m < 12; m++) {
float y = graphBottom -
(m * (graphBottom - graphTop) / 11.0);

stroke(90, 90, 100);
strokeWeight(1);
line(graphLeft, y, graphRight, y);

fill(255);
text(months[m], graphLeft - 12, y + 4);
}

textAlign(CENTER);
textSize(12);

for (int n = 0; n <= 25; n += 5) {
float x = graphLeft + (n / 25.0) *
(graphRight - graphLeft);

stroke(150);
line(x, graphBottom - 3, x, graphBottom + 3);

fill(255);
text(n, x, graphBottom + 20);
}

for (int i = 0; i < fightCount; i++) {
Fight f = fightObjects[i];

if (f == null || f.eventDate == null ||
f.finishDetails == null) {
continue;
}

int month = getMonthNumber(f.eventDate);

if (month < 1 || month > 12) {
continue;
}

// Find the fight's position within its month
int positionInMonth = 0;

for (int j = 0; j < i; j++) {
if (fightObjects[j] != null &&
getMonthNumber(fightObjects[j].eventDate) == month) {
positionInMonth++;
}
}

float x = graphLeft +
(positionInMonth + 1) *
(graphRight - graphLeft) / 25.0;

float y = graphBottom -
(month - 1) * (graphBottom - graphTop) / 11.0;

String finish = f.finishDetails.toLowerCase();

if (finish.contains("ko") || finish.contains("tko")) {
fill(230, 50, 50); // Red: KO/TKO
} else if (finish.contains("submission")) {
fill(45, 130, 230); // Blue: Submission
} else if (finish.contains("decision")) {
fill(50, 200, 90); // Green: Decision
} else {
continue;
}

noStroke();
ellipse(x, y, 11, 11);
}

fill(255);
textAlign(CENTER);
textSize(15);
text("NUMBER OF FIGHTS WITHIN EACH MONTH",
(graphLeft + graphRight) / 2, 805);

textSize(16);
fill(255);
text("LEGEND", width / 2, 840);

fill(230, 50, 50);
ellipse(390, 870, 13, 13);
fill(255);
textAlign(LEFT);
text("KO / TKO", 405, 875);

fill(45, 130, 230);
ellipse(560, 870, 13, 13);
fill(255);
text("SUBMISSION", 575, 875);

fill(50, 200, 90);
ellipse(780, 870, 13, 13);
fill(255);
text("DECISION", 795, 875);
}

int getMonthNumber(String date) {
try {
java.text.SimpleDateFormat format =
new java.text.SimpleDateFormat("MMMM dd, yyyy",
java.util.Locale.ENGLISH);

format.setLenient(false);

java.util.Date parsedDate = format.parse(date);

java.util.Calendar calendar =
java.util.Calendar.getInstance();

calendar.setTime(parsedDate);

return calendar.get(java.util.Calendar.MONTH) + 1;
}
catch (Exception e) {
println("Could not read event date: " + date);
return -1;
}
}

// Fight class
class Fight {
String eventDate;
String finishDetails;

Fight(String eventDate, String finishDetails) {
this.eventDate = eventDate;
this.finishDetails = finishDetails;
}
}
