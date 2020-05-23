class Button {  //with the aid of: http://learningprocessing.com/exercises/chp09/exercise-09-08-array-buttons

float x;
float y;
float w;
float h;
float col;
Brush brush33;
boolean on;
Button(float tempX, float tempY, float tempW, float tempH, float buttonColor) {
x = tempX;
y = tempY;
w = tempW;
h = tempH;
col= buttonColor;

on=false;

}

 void click(int mx, int my) {

    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
      brush33.Start_func(255, 0, 0);
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
