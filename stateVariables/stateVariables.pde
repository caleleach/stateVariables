//global variables
int state;
PImage[] ship = new PImage[23];
int shipCounter;
int shipX,shipY;
PImage[] medal = new PImage[5];
int medalCounter;
int points;
PImage eagle;
float debris;

void setup() {
 state = 1;
 size(800,800); 
 shipCounter = 0;
 shipX = width/2;
 shipY = height - 40;
 medalCounter = 0;
 points = 0;
 
 //animates ship
 for (int i=0; i < ship.length; i++) {
   ship[i] = loadImage( i + ".png");
 }
 //medal animation
 for (int m=0; m < medal.length; m++){
    medal[m] = loadImage( "m" + m  + ".png");
 }
}

void draw() {
  menu();
  game();
  endScreen();
}

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
    shipMove();
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
  if (keyPressed == true){
    //move up
    if (key == 'w'|| key == 'W'){
      shipY = shipY - 5;
    }
    //move down
    else if (key == 's' || key == 'S'){
      shipY = shipY + 5; 
    }
    //move left
    else if (key == 'a' || key == 'A'){
      shipX = shipX - 5; 
    }
    else if (key == 'd' || key == 'D'){
      shipX = shipX + 5; 
    }
  }
}
//asteroids/objects
void debris(){
  
}

//keeps track of points
void numberOfPoints(){
  
}


//------------------------------------------------------------------------------------
//shows the final screen
void endScreen(){
  if (state == 3){
    background(163,163,163);
    score();
  }
}
//shows your score
void score(){
  imageMode(CENTER);
  image(medal[medalCounter], width/2, height/2);
  
  //finds the medal you got
  if (frameCount % 10 == 0) {
    medalCounter++;
    medalCounter = medalCounter % medal.length;
    
    //1st
    if (medalCounter == 0 && points >= 20){
      medalCounter = medalCounter + 0;
    }
    //2nd
    else if (medalCounter == 0 && points < 20 && points >= 15) {
      medalCounter = medalCounter + 1;
    }
    //3rd
    else if (medalCounter == 0 && points < 15 && points >= 10) {
      medalCounter = medalCounter + 2;
    }
    //4th
    else if (medalCounter == 0 && points < 10 && points >= 5) {
      medalCounter = medalCounter + 3;
    }
    //5th
    else if (medalCounter == 0 && points < 5){
      medalCounter = medalCounter + 4;
    }
  }
}