//Hi, Here is the updated version of the RAINBOW BRUSH with new features such as its RAINBOW TOOLBAR.
//my brush is a rainbow, composed of tiny circles that can get bigger or smaller in number with UP and DOWN arrowkeys.
//You can also move your mouse faster to make the brush smaller. You can change the color of my brush by pressing(&& holding) the first letter of these colos: red, green, blue,pink, orange, white, yellow. For black press "k".
//If you got tired of your drawing, press DELETE and start over again.
Brush brush;
Button button;
Slider slider;
//////////DeleteButton deleteButton;
///////Brush.Button ab;

Button[] buttons = new Button[8];
///boolean button = false;
int x = 100;
int y = 750;
int w = 40;
int h = 20;
int col;
int counter=0;
boolean buttonclicked=false;
void setup() {
 //////// ab = new Brush.Button();
  size(1200, 800);
  background(240);
  fill(255);
  rect(0, 0, 200, 800);
  strokeWeight(1);
  stroke(0);
  line (200,770,1200,770);
  stroke(0);
  line(190,0,190,800);
  fill(251);
  rect(0,370,190,450);
  // fill(0,70);
  // noStroke();
  // rect( 500, 740 , 400 ,30 );
  //img1 = loadImage("seedTop.jpg");
  brush = new Brush(5); //number of circles
  //button = new Button(5, 5, 10, 10);
for (int i = 0; i < buttons.length; i++) {
 
  buttons[i] = new Button(80,i*50+400 , 40, 20,col);

}
  slider = new Slider(500, 760, 400, 30, 1);
/////////  deleteButton = new DeleteButton;
button = new Button(50,150,100,100,100);
}
void draw() {
  //float speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
  // println(speed,"  "); //this is how I understood the speed of the mouse, for making 'sd' twice bigger.
if(buttonclicked==false){
  brush.Start() ;
  brush.Size(); //UP && DOWN arrow keys.
  brush.BrushColor(); //by pressing the first letter of aforementioned colors
  brush.TryAgain(); //by pressing DELETE
}
else 
{
  for (int i = 0; i < buttons.length; i++) {

    if (buttons[0].on) { 
      buttons[i].Start_func2(255, 0, 0);
    }
    if (buttons[1].on) {   
      buttons[i].Start_func2(0, 255, 0);
    }
    if (buttons[2].on) {   
      buttons[i].Start_func2(0, 0, 255);
    }
    if (buttons[3].on) {   
      buttons[i].Start_func2(255, 255, 0);
    }
    if (buttons[4].on) {   
      buttons[i].Start_func2(0, 0, 0);
    }
    if (buttons[5].on) {   
      buttons[i].Start_func2(255, 69, 0);
    }
    if (buttons[6].on) {   
      buttons[i].Start_func2(255, 192, 203);
    }
    if (buttons[7].on) {   
      buttons[i].Start_func2(255, 255, 255);
    }
    }
}
  slider.Display();
  slider.Update();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    button.display();
    
  }
  
  
 /// if (button) {
    //background(255);
 ///   stroke(0);
 /// } else {
    //background(0);
 ///   stroke(255);
  ///}
  ///fill(175);
 /// ellipse(x, y, w, h);
 /// if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
  ///  button = !button;
   /// start();
  }



void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {

      buttons[i].click(mouseX,mouseY);
      if (buttons[i].on==false){
      counter++;
      }

  }
   
  if(counter==buttons.length)
      {
      buttonclicked=false;
      }
      else
      {
        buttonclicked=true;
      }
      
   button.click(mouseX,mouseY);
}
