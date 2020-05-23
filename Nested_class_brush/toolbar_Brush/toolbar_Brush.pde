//Hi, Here is the updated version of the RAINBOW BRUSH with new features such as its RAINBOW TOOLBAR.
//my brush is a rainbow, composed of tiny circles that can get bigger or smaller in number with UP and DOWN arrowkeys.
//You can also move your mouse faster to make the brush smaller. You can change the color of my brush by pressing(&& holding) the first letter of these colos: red, green, blue,pink, orange, white, yellow. For black press "k".
//If you got tired of your drawing, press DELETE and start over again.
Brush brush;
//Button button;
Slider slider;
//////////DeleteButton deleteButton;
///////Brush.Button ab;

Button[] buttons = new Button[9];
///boolean button = false;
int x = 100;
int y = 750;
int w = 40;
int h = 20;
int col;
int counter=0;
float width=1200;
float height=800;
float circleBrushSize=4;
boolean buttonclicked=false;
//float scale=1.5;//https://www.youtube.com/watch?v=SU4WRLKZ-Js
void setup() {
 //////// ab = new Brush.Button();
  strokeWeight(1);
  size(1200, 800);
  background(240);
  fill(255);
  rect(0, 0, 200, 800);
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
  slider = new Slider(500, 760, 400, 30, 1);
  
  //print(circleBrushSize,"  ");
  brush = new Brush(5,circleBrushSize); //number of circles
  //button = new Button(5, 5, 10, 10);
  /////////  deleteButton = new DeleteButton;
buttons[0] = new Button(50,150,100,100,100);
for (int i = 1; i < buttons.length; i++) {
 
  buttons[i] = new Button(80,i*50+400 , 40, 20,col);

}
  

}


void draw() {
  strokeWeight(4);
  slider.Display();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    
  }
  
  brush = new Brush(15,circleBrushSize);

if (mouseX > 200 && mouseX < width && mouseY < 730) {
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
      setup();
      
      brush.Start();
      //buttons[i].Start_func2(255, 255, 255);
    }
    if (buttons[1].on) { 
      buttons[i].Start_func2(255, 0, 0);
      
    }
    if (buttons[2].on) {  
      buttons[i].Start_func2(0, 255, 0);
    }
    if (buttons[3].on) {   
      buttons[i].Start_func2(0, 0, 255);
    }
    if (buttons[4].on) {   
      buttons[i].Start_func2(255, 255, 0);
    }
    if (buttons[5].on) {   
      buttons[i].Start_func2(0, 0, 0);
    }
    if (buttons[6].on) {   
      buttons[i].Start_func2(255, 69, 0);
    }
    if (buttons[7].on) {   
      buttons[i].Start_func2(255, 192, 203);
    }
    if (buttons[8].on) {   
      buttons[i].Start_func2(255, 255, 255);
    }
    
    }
}
}
  
  slider.Update();
  circleBrushSize=slider.Update();
  
  circleBrushSize = map(circleBrushSize, 500, 870, 5, 50);
  print(circleBrushSize,"  ");
  //print(Default,"  ");

  
}




void mousePressed() {
  counter=0;
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
      
}
