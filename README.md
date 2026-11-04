1. Project Overview
UFC Fight Explosion is a data visualisation project created for the IN1007 Java Programming module at City, University of London.

The project explores UFC main-card fights that took place throughout 2024. It uses fight data to investigate the outcomes of fights during the year and presents the information through a visualisation created in Processing.

The project was chosen because mixed martial arts is an interesting sport with different ways of winning, including knockouts, submissions and judges’ decisions.

2. What the Project Investigates
The project investigates UFC main-card fights from January to December 2024.

The main aim is to explore:

How many fights took place during each month.
How fights ended.
The differences between knockouts, submissions and decisions.
How fight outcomes can be represented visually.
Each recorded fight represents one observation in the dataset.

3. Dataset
The dataset contains 211 fight observations from UFC main-card events in 2024.

The spreadsheet contains information about the fights, including available details such as:

Event name.
Event date.
Weight class.
Fighter names.
Winner.
Fight finish details.
Other fight statistics available in the original source.
The dataset was organised into a CSV file so that it could be loaded into Processing.

4. Fight Outcome Statistics
The 211 recorded fights are divided into the following outcome categories:

Fight outcome

Number of fights

KO/TKO

69

Submission

29

Decision

113

Total

211

These figures allow the project to compare the different ways UFC fights ended during 2024.

5. Data Source and Collection
The original fight results were obtained from the following public dataset:

https://raw.githubusercontent.com/Greco1899/scrape_ufc_stats/refs/heads/main/ufc_fight_results.csv

The data was organised into a spreadsheet and filtered to include the selected 2024 main-card fights.

Information that was not available in the source was not invented.

6. Visualisation Design
The Processing sketch uses a dark background with a red title to create a visual style inspired by UFC.

The graph displays the months from January to December 2024.

Each circle represents a fight, with its position showing the relevant month and its position along the horizontal axis helping to show the number of fights.

The colours represent the fight outcomes:

Red: KO/TKO.
Blue: Submission.
Green: Decision.
The graph includes axes, labels, gridlines and a colour legend to help the viewer understand the information.

7. Programming and Java Concepts
The project was developed using Java through Processing.

The code uses methods to help organise the programme and carry out calculations.

Examples of programming tasks include:

Loading the CSV dataset.
Reading information from the rows.
Processing fight dates.
Identifying fight outcomes.
Counting the different result categories.
Calculating positions for the visualisation.
Displaying the results on the screen.
A Fight class is used to represent individual fight records. Each object can store information such as the event name, event date, weight class, winner, fighter names and finish details.

Using objects helps organise the information about each fight.

8. Creativity and SCAMPER
The visualisation uses the SCAMPER approach to explain the design decisions.

Substitute: A normal table of fight results is replaced with a visual graph.
Combine: Fight dates and fight outcomes are combined in one visualisation.
Adapt: UFC-inspired colours and styling are used to make the visualisation relevant to the topic.
Modify: The data is displayed using coloured circles, a dark background and a clear title.
Put to another use: Fight statistics are turned into a visual way of exploring patterns across the year.
Eliminate: Unnecessary information and visual clutter are reduced to make the graph easier to understand.
Reverse/Rearrange: The fight data is organised by month rather than simply being displayed as a list of results.
9. Challenges and Improvements
Some challenges involved organising the dataset, loading the CSV correctly and making sure the Processing code could read the information.

Another challenge was organising the fight information into categories so that the results could be displayed clearly.

Possible future improvements include:

Adding more detailed fight statistics.
Improving the layout and labels.
Allowing viewers to compare individual events.
Adding further visualisations of the fight data.
10. Tools Used
Java.
Processing.
CSV dataset.
Microsoft Excel.
GitHub.
11. Project Aim
The aim of UFC Fight Explosion is to demonstrate how programming and data visualisation can be used to explore real-world sports data.

The project uses 211 UFC fight observations to present information about fight outcomes throughout 2024 in a visual and understandable way.

12. Learning Outcomes
Through this project, I have developed experience with:

Working with datasets.
Reading CSV files in Processing.
Using Java methods.
Creating and using classes and objects.
Processing and organising data.
Designing a data visualisation.
Using GitHub to store and update project files.
