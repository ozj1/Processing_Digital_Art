class Slider {  //ref: https://processing.org/examples/scrollbar.html  //with some changes of mine






  int swidth, sheight;    
  float xpos, ypos;       
  float spos, newspos;    
  float sposMin, sposMax; 
  int loose;              
  boolean over;          
  boolean locked;
  float ratio;


  Slider(float xp, float yp, int sw, int sh, int l) {
    stroke(0);
    strokeWeight(4);
    line(700, 770, 700, 780);
    fill(0);
    textSize(18);
    text("10", 690, 795);
    fill(0);
    textSize(16);
    text("1", 500, 795);
    fill(0);
    textSize(16);
    text("100", 870, 795);

    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }
  void Display() {



    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {

    return spos * ratio;
  }



  void Update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }
}
