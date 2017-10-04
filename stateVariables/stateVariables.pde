int state;
PImage[] ship = new PImage[23];
int shipCounter;
int shipX,shipY;
PImage[] medal = new PImage[5];
int medalCounter;

void setup() {
 state = 1;
 size(800,800); 
 shipCounter = 0;
 shipX = width/2;
 shipY = height - 40;
 medalCounter = 0;
 
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
    background(255);
    button();
    isButtonPressed();
  }
  
}

//button
void button() {
  //what color the button should be and if the mouse is on the button
  if (mouseX <= 600 && mouseX >= 200 && mouseY <= 500 && mouseY >= 300){
    fill(255,0,0);
    rectMode(CENTER);
    rect(width/2,height/2, 400,200);
  }
  else{
    fill(0);
    rectMode(CENTER);
    rect(width/2,height/2, 400,200);
  }
  //Start game text
  fill(255);
  textMode(CENTER);
  textSize(40);
  text("Start Game", width/2 - 100,height/2);
}
//checks if the main menu button has been pressed
void isButtonPressed() {
  if (state == 1){
    if (mousePressed && mouseX <= 600 && mouseX >= 200 && mouseY <= 500 && mouseY >= 300){
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
//------------------------------------------------------------------------------------
//shows the final screen
void endScreen(){
  if (state == 3){
    background(163,163,163);
    score();
  }
}

void score(){
  imageMode(CENTER);
  image(medal[medalCounter], width/2, height/2);
  
  if (frameCount % 10 == 0) {
    medalCounter++;
    medalCounter = medalCounter % medal.length;
  }
}