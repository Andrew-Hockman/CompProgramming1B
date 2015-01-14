void setup() {
  size(900,400);
  background(100);
}

void draw() {
  background(255,155,0);
  textSize(40);
  fill(255);
  stroke(#C0FF00);
  text("Computer History", width/5, 50);
  line(100, 200, 900, 200);
  top("ENIAC-1946", 120, 150, "test", true);
  top("The Integrated Circuit-1958", 220, 150, "test", true);
  top("TV Typewriter-1973", 400, 150, "test", true);
  top("Cray-1-1976", 540, 150, "test", true);
  top("EDSAC-1949", 150, 250, "test", false);
  top("ANITA-1961", 250, 250, "test", false);
  top("3rd Generation Computers-1965", 340, 250, "test", false);
  top("Apple II-1977", 580, 250, "test", false);
  println("X=" + mouseX);
  println("Y=" + mouseY);
  text("Andrew Hockman", 760,380);
}

void top(String eventName, int xpos, int ypos, String details, boolean top) {
  if (top) {
    line(xpos, ypos, xpos+50, ypos+50);
    textSize(15);
    fill(255);
    text(eventName, xpos-45, ypos-5);
    
    if (mouseX > xpos-45 && mouseX < xpos+100 && 
    mouseY > ypos-20 && mouseY < ypos+10) {
      fill(255);
      text(details, xpos-80, ypos+20);
    }
  }
  else { //if (!top) {}
  line(xpos, ypos, xpos+50, ypos-50);
  textSize(15);
  fill(0,255);
  text(details, xpos-80, ypos +20);
  }
}

//void bottom(String eventName, int xpos, int ypos) {
  //line(xpos, ypos, xpos+50, ypos-50);
  //text(eventName, xpos-35, ypos+15);
//}



