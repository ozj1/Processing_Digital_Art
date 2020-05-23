

class Brush {
  float mx;
  float my;

  float x;
  float y;
  float Default=4; //stroke size of the circles
  float sd; //variance
  float opacity=100;
  float speed; //mouse speed
  import java.util.Random; //Gaussian Random from Java
  Random generator;
  Brush(float tempS) {
    sd = tempS;
    generator = new Random();
  }

  void Start_func(int col1, int col2, int col3) {  //I made a copy of void start as a function to use it for my other voids such as void changeColor
    if (mousePressed) {
      float x = (float) generator.nextGaussian();
        
      //sd = 15;
      speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
      if (speed>50) {
        sd=sd*0.5;  //making variance smaller by mouse speed
      }
      float mean =mouseX;
      x = (x*sd)+ mean; //somehow I can say mapping sd in the right position (from Shiffman videos) 
      float y = (float) generator.nextGaussian();
      float mean2 =mouseY;
      y = (y*sd)+ mean2; //same thing for Y
     
      if (keyPressed==false) {  //this is for the default color of the brush(Rainbow)
        for (int i = 0; i < 500; i++) {
          float r1 = random(255);
          float r2 = random(255);
          float r3 = random(255);
          stroke(r1, r2, r3, opacity);
        }
      }
      if (keyPressed==true ) { //for void colorChange use
        stroke(col1, col2, col3, opacity);
      }

      strokeWeight(Default);
      noFill();
       x = constrain(x, 200, 1200);

        y = constrain(y, 0, 760);
      circle(x, y, 8); //main component of the brush
    }
    if (speed>50) { //for returning to default 
      sd=sd/0.5;
    }
  }
  void Start() { //main void start
   
    if (mousePressed) {
      float x = (float) generator.nextGaussian();
      //sd = 15;
      speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);//got it from here https://forum.processing.org/one/topic/using-the-mouse-speed.html
      if (speed>50) {
        sd=sd*0.5;
      }
      float mean =mouseX;
      x = (x*sd)+ mean;
      float y = (float) generator.nextGaussian();
      float mean2 =mouseY;
      y = (y*sd)+ mean2;
      if (keyPressed==false || (keyPressed==true && key != 'r' && key != 'g' && key != 'b' && key != 'k' && key != 'w' && key != 'p' && key != 'o' && key != 'y')) {

        for (int i = 0; i < 500; i++) {
          float r1 = random(255);
          float r2 = random(255);
          float r3 = random(255);
          stroke(r1, r2, r3, opacity);
        }
      }


      strokeWeight(Default);
      noFill();
       x = constrain(x, 200, 1200);
        y = constrain(y, 0, 760);
      circle(x, y, 8);
    }

    if (speed>50) {
      sd=sd/0.5;
    }
  }
  void Size() { //Size change of the brush
   
    if (keyPressed==true) {
      if (keyCode == UP) {
        sd=sd+0.9;
      }

      if (keyCode == DOWN) {
        sd=sd-0.9;
        if (sd<0) {
          sd=0;
        }
      }
    }
  }

  void BrushColor() { //color change of the brush
    //if (mousePressed) {
    if ((keyPressed == true) && (key == 'r')) { 
      Start_func(255, 0, 0);
    }
    if ((keyPressed == true) && (key == 'g')) {   
      Start_func(0, 255, 0);
    }
    if ((keyPressed == true) && (key == 'b')) {   
      Start_func(0, 0, 255);
    }
    if ((keyPressed == true) && (key == 'y')) {   
      Start_func(255, 255, 0);
    }
    if ((keyPressed == true) && (key == 'k')) {   
      Start_func(0, 0, 0);
    }
    if ((keyPressed == true) && (key == 'o')) {   
      Start_func(255, 69, 0);
    }
    if ((keyPressed == true) && (key == 'p')) {   
      Start_func(255, 192, 203);
    }
    if ((keyPressed == true) && (key == 'w')) {   
      Start_func(255, 255, 255);
    }
    //}
  }
  void TryAgain() { //for clearing canvas 
    if (keyPressed==true) {
      if (key == DELETE) {
        setup();
      }
      Start();
    }
  }
}
