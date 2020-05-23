class Button {  //with the aid of: http://learningprocessing.com/exercises/chp09/exercise-09-08-array-buttons
float x;
float y;
float w;
float h;
float col;
//Brush33 brush33;
//void setup() {
//brush33 = new Brush33(5);
//}
boolean on;
 import java.util.Random; //Gaussian Random from Java
  Random generator;
Button(float tempX, float tempY, float tempW, float tempH, float buttonColor) {
x = tempX;
y = tempY;
w = tempW;
h = tempH;
col= buttonColor;

on=false;
generator = new Random();
}
//class Brush33 {
  
  float xx;
  float yy;

  float Default=4; //stroke size of the circles
  float sd=5; //variance
  float opacity=100;
  float speed; //mouse speed
 
  

  void Start_func2(int col1, int col2, int col3) {  //I made a copy of void start as a function to use it for my other voids such as void changeColor
    if (mousePressed) {
       xx = (float) generator.nextGaussian();
        
      //sd = 15;
      speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
      if (speed>50) {
        sd=sd*0.5;  //making variance smaller by mouse speed
      }
      float mean =mouseX;
      xx = (xx*sd)+ mean; //somehow I can say mapping sd in the right position (from Shiffman videos) 
       yy = (float) generator.nextGaussian();
      float mean2 =mouseY;
      yy = (yy*sd)+ mean2; //same thing for Y
     
      
      stroke(col1, col2, col3, opacity);
      

      strokeWeight(Default);
      noFill();
       xx = constrain(xx, 200, 1200);

        yy = constrain(yy, 0, 760);
      circle(xx, yy, 8); //main component of the brush
    }
    if (speed>50) { //for returning to default 
      sd=sd/0.5;
    }
  }
  
//}


 void click(int mx, int my) {

    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
      //Start_func2(255, 0, 0);
    }
  }

  void display() {
   ellipseMode(CORNER);
    stroke(0);
 
    if (on) {
      fill(175);
    } else {
      fill(col);

    }
    ellipse(x,y,w,h);
  }


}
