//global variables
int state;
//ship stuff
PImage[] ship = new PImage[23];
int shipCounter;
float shipX,shipY;
float dx,dy;
boolean movingUp,movingDown,movingRight,movingLeft;
//medal
int points;
PImage medal;
//button for main menu
PImage eagle;
//debris
boolean debrisOnScreen;
int debrisX,debrisY;
int debrisDX,debrisDY;
int debrisSize;
int debrisCounter;

void setup() {
 state = 1;
 
 size(800,800); 
 
 shipCounter = 0;
 shipX = width/2;
 shipY = height - 40;
 dx = 5;
 dy = 5;
 movingUp = false;
 movingDown = false;
 movingRight = false;
 movingLeft = false;
 
 points = 0;
 
 debrisOnScreen = false;
 debrisDX = 5;
 debrisDY = 5;
 debrisCounter = 0;
 
 
 //animates ship
 for (int i=0; i < ship.length; i++) {
   ship[i] = loadImage( i + ".png");
 }
}

void draw() {
  menu();
  game();
  endScreen();
}
//-------------------------------------------------------------------------------------------------------------
//main menu
void menu() {
  if (state == 1){
    background(0);
    button();
    isButtonPressed();
  }
}

//button
void button() {
  //what color the button should be and if the mouse is on the button
  if (mouseX <= 470 && mouseX >= 330 && mouseY <= 444 && mouseY >= 388) {
    eagle = loadImage("eagle_1.png");
    imageMode(CENTER);
    image(eagle, width/2, height/2, eagle.width*2, eagle.height*2);
  }
  else {
    eagle = loadImage("eagle_0.png");
    imageMode(CENTER);
    image(eagle, width/2, height/2, eagle.width*2, eagle.height*2);
  }
}//button X is 70 button Y is 28
//checks if the main menu button has been pressed
void isButtonPressed() {
  if (state == 1){
    if (mousePressed && mouseX <= 470 && mouseX >= 330 && mouseY <= 444 && mouseY >= 388){//set it up so that you can change the size and the button will still work
      state = 2;
    }
  }
}

//-----------------------------------------------------------------------------------------------------
//start of the game
void game(){
  if (state == 2){
    background(0);
    ship();
    hitBox();
    shipMove();
    debris();
    if (debrisCounter == 20) {
      state = 3; 
    }
  }
}
//shows ship
void ship(){
  imageMode(CENTER);
  image(ship[shipCounter], shipX, shipY);
  
  if (frameCount % 5 == 0) {
    shipCounter++;
    shipCounter = shipCounter % ship.length;
    if (shipCounter == 0){
      shipCounter = shipCounter + 14;
    }
  }
}
//ship movement
void shipMove(){
  if (movingUp) {
    shipY -= dy;
  }
  if (movingDown) {
    shipY += dy; 
  }
  if (movingRight) {
    shipX += dx;
  }
  if (movingLeft) {
    shipX -= dx; 
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    movingUp = true; 
  }
  if (key == 's' || key == 'S') {
    movingDown = true; 
  }
  if (key == 'a' || key == 'A') {
    movingLeft = true; 
  }
  if (key == 'd' || key == 'D') {
    movingRight = true; 
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    movingUp = false; 
  }
  if (key == 's' || key == 'S') {
    movingDown = false; 
  }
  if (key == 'a' || key == 'A') {
    movingLeft = false; 
  }
  if (key == 'd' || key == 'D') {
    movingRight = false; 
  }
}

//asteroids/objects
void debris(){
 //spawns debris
 if (debrisOnScreen == false) {
   debrisSize = int(random(20,120));
   debrisDY = int(random(5,10));
   debrisX = int(random(width));
   debrisY = 0;
   debrisOnScreen = true;
 }
 //spawn debris
  if (debrisOnScreen == true){
    fill(163);
    ellipseMode(CENTER);
    ellipse(debrisX,debrisY,debrisSize,debrisSize);
    debrisY += debrisDY;
    collision();
    if (debrisY >= 800) {
      debrisOnScreen = false;
      debrisCounter += 1;
      points += 1;
    }
  }
}
//the ship's hit box
void hitBox(){
  noStroke();
  noFill();
  rectMode(CENTER);
  rect(shipX,shipY,70,68);
}

//detects if the ship hits and asteroid
void collision() {
  if (debrisX + debrisSize/4 >= shipX - 32 && debrisX - debrisSize/4 <= shipX + 32 && debrisY + debrisSize/4 >= shipY - 35 && debrisY - debrisSize/4 <= shipY + 35){
    state = 3;
  }
}

//------------------------------------------------------------------------------------
//shows the final screen
void endScreen(){
  if (state == 3){
    background(0);
    score();
  }
}
//shows your score
void score(){
  //finds the medal you got
    //1st
  if (points >= 20) {
    medal = loadImage("m0.png");
  }
    //2nd
  else if (points < 20 && points >= 15) {
    medal = loadImage("m1.png");
  }
    //3rd
  else if (points < 15 && points >= 10) {
    medal = loadImage("m2.png");
  }
    //4th
  else if (points < 10 && points >= 5) {
    medal = loadImage("m3.png");
  }
    //5th
  else if (points < 5) {
    medal = loadImage("m4.png");
  }
  imageMode(CENTER);
  image(medal, width/2, height/2, medal.width*2, medal.height*2);
}