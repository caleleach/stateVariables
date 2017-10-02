int state;


void setup() {
 state = 1;
 size(800,800); 
 
}

void draw() {
  menu();
  game();
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
    background(255);
    
  }
}
//imports the ship sprite(s)
void ship(){
  
}