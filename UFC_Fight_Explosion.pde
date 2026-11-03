Table fights;
Fight[] fightObjects;

int fightCount = 0;
boolean dataLoaded = false;

int totalFights = 0;
int totalKnockouts = 0;
int totalSubmissions = 0;
int totalDecisions = 0;

int totalRedStrikes = 0;
int totalBlueStrikes = 0;

int invalidRows = 0;

void setup() {
  size(1000, 700);

  fights = loadTable("UFC_2024_Main_Card_Fights_CSV.csv", "header");

  if (fights != null) {
    fightCount = fights.getRowCount();
    dataLoaded = true;

    fightObjects = new Fight[fightCount];

    for (int i = 0; i < fightCount; i++) {
      TableRow row = fights.getRow(i);

      fightObjects[i] = new Fight(
        row.getString("event_name"),
        row.getString("weight_class"),
        row.getString("header_winner_name"),
        row.getString("header_fighter_a_name"),
        row.getString("header_fighter_b_name"),
        row.getString("header_finish_details_detailed")
      );

      String finish = row.getString("header_finish_details_detailed");

      totalFights++;

      if (finish != null) {
        if (finish.equalsIgnoreCase("KO")) {
          totalKnockouts++;
        } 
        else if (finish.equalsIgnoreCase("Submission")) {
          totalSubmissions++;
        } 
        else if (finish.equalsIgnoreCase("Decision") ||
finish.equalsIgnoreCase("Technical Decision")) {
          totalDecisions++;
        }
      }
    }
println("UFC dataset loaded successfully!");
println("Number of fights: " + fightCount);
println("Knockouts: " + totalKnockouts);
println("Submissions: " + totalSubmissions);
println("Decisions: " + totalDecisions);
  } 
  else {
    println("Error: CSV file could not be loaded.");
  }
}

// Calculate combined significant strikes
int getTotalStrikes(int redStrikes, int blueStrikes) {
  return redStrikes + blueStrikes;
}

void draw() {
  background(12, 12, 20);

  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("UFC FIGHT EXPLOSION", width / 2, 80);

  textSize(20);
  text("TOTAL FIGHTS: " + fightCount, width / 2, 130);
  text("UFC 2024 DATASET", width / 2, 160);

  noStroke();
  fill(255, 40, 60);
  ellipse(width / 2 - 180, height / 2, 150, 150);

  fill(40, 120, 255);
  ellipse(width / 2 + 180, height / 2, 150, 150);

  fill(255);
  textSize(18);
  text("RED CORNER", width / 2 - 180, height / 2 + 110);
  text("BLUE CORNER", width / 2 + 180, height / 2 + 110);
}


class Fight {
  String eventName;
  String weightClass;
  String winnerName;
  String fighterA;
  String fighterB;
  String finishDetails;

  Fight(String eventName, String weightClass,
        String winnerName, String fighterA,
        String fighterB, String finishDetails) {

    this.eventName = eventName;
    this.weightClass = weightClass;
    this.winnerName = winnerName;
    this.fighterA = fighterA;
    this.fighterB = fighterB;
    this.finishDetails = finishDetails;
  }
}
