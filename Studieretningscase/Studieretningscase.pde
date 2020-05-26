//Processing table class import 
Table table; 
PImage img;

//Variabler til interaktivitet 
float xo;
float yo;
float zoom = 1;
float angle = 0;
float scaleFactor = 1;

//Setup implementering af variabler og data 
void setup() {
  size(1400, 800);
  xo = width/2;
  yo = height/2;
  smooth();
  noStroke();

  table = loadTable("us2.csv", "header"); //Header ændre row 1 = 0

  println("Date: " + table.getString(0, 0));
  println("Cases: " + table.getInt(0, 1));
  println("Deaths: " + table.getInt(0, 2));
  textAlign(LEFT, CENTER);

  //table.getColomnCount()
  //table.getRowCoutn()
}

//Initialisering af variabler 
void draw() {
  background(25, 50, 75);//Pennsylvania state color 
  translate(xo, yo);
  scale(zoom);
  rotate(angle);
  fill(0);



  //Måle linje, det er dårligt lavet, ende linjer er ikke symmetriske 
  fill(0);
  text("342m",-350, -80);
  rect(-410, -70, 150, 1);
  rect(-260, -75, 1, 15);
  rect(-410, -75, 1, 15); 

  //Comcast Technology Center 
  fill(255);
  rect(-400, -45, 130, 5);
  rect(-400, -50, 100, 20);
  rect(-400, -50, 80, 30);


  fill(255);
  rect(-575, -300, 1000, 151);
  fill(0);
  text("Welcome. This is a an interactive visualized chart on the numbers of Corona virus cases in the US, and if...", -450, -275);
  text("the 1 316 444 people that have been registered stood on top of each others shoulders, they could form a", -450, -255);
  text("1 390.59959 miles tower would emerge from the surface of the earth. In this program this tower is compared", -450, -235);
  text("with the tallest building in Pennsylvania the Comcast Technology Center", -450, -215);
  text("which spand 342m or 0.212508948 miles 0.212508948 miles", -450, -195);
  text("Move arround in order to view the scales of these numbers! Follow the instructions to the right of this description ->", -450, -165);

  img = loadImage("covid-19.png");
  image(img, -575, -300, width/12, height/7);
  fill(0);
  text("Corona Virus", -555, -180);
  text("Data Visualizer.", -555, -165);

  noFill();
  rect(-400, -300, 200, 250);

  img = loadImage("MusTutorial.jpeg");
  image(img, 400, -300, width/7, height/5.3);

  img = loadImage("ArrowKeysTutorial.png");
  image(img, 250, -275, width/12, height/8);
  fill(0);
  text("IN", 303, -285);
  text("OUT", 295, -170);
  text("ROTATE", 205, -200);
  text("ROTATE", 370, -200);



  //Hvis der bliver tilføjet flere rows tilpasser kode sig dynamisk
  for (int c=0; c < table.getRowCount(); c++) {

    //List "Date"
    fill(255);
    text(table.getString(c, 0), -600, 25+ c*50);

    //List "Cases"
    fill(255);
    text(table.getString(c, 1) + " Cases", -500, 25+ c*50);

    //Visualisering af cases i søjle diagram 
    fill(255, 0, 0);
    rect(-400, (25+ c*50), sqrt(table.getFloat(c, 1))*2, 10);
  }
}

//Zoom med taster funktion 
void keyPressed() {    

  if (key == CODED) {
    if (keyCode == UP) {
      zoom += .05;
    } else if (keyCode == DOWN) {
      zoom -= .05;
    } else if (keyCode == RIGHT) {
      angle += .05*PI;
    } else if (keyCode == LEFT) {
      angle -= .05*PI;
    }
  }
  if (key == ' ') {
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
    scaleFactor = 1;
  }
}

//scroll med mussehjul funktion 
void mouseWheel(MouseEvent event) { //Bruger test, Josef 17 år: langsom scroll funktion virker ikke i starten af scroll = zoom in er i begge scroll retninger 
  float e = event.getCount();
  if (e < zoom) {
    zoom += .05;
  }
  if (e > zoom) {
    zoom -= .05;
  }
  println("Mus scroll: " + e);
}

//træk rundt i program funktion 
void mouseDragged() {
  xo = xo + (mouseX - pmouseX);
  yo = yo + (mouseY - pmouseY);
  println("Window position: " + xo + yo);
}
