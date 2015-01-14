void setup() {
  size(500,500);
  stroke(0);
}

void draw() {
  background(0,50,250,100);
  fill(255,255,255);
  rect(width,height/4,width,height/4);
  fill(255,0,0);
  triangle(250,62,500,62,375,10);
  fill(0,255,255);
  rect(300,147,50,80);
  fill(0);
  ellipse(315,145,5,5);
  fill(255,255,0);
  ellipse(25,25,50,50);
  fill(50,255,50);
  rect(250,400,500,425);
  //zoog
  ellipseMode(CENTER);
  rectMode(CENTER);
  //body
  fill(255,255,50,255);
  rect(mouseX,mouseY+30,20,100);
  //head
  fill(255,150,75);
  ellipse(mouseX,mouseY,60,60);
  //eyes
  fill(255,50,155,255);
  ellipse(mouseX-19,mouseY,8,16);
  ellipse(mouseX+19,mouseY,8,16);
  //legs
  fill(0,255);
  line(mouseX-10,mouseY+80,mouseX-20,mouseY+160);
  line(mouseX+10,mouseY+80,mouseX+20,mouseY+160);
  //arms
  line(mouseX-10,mouseY+30,mouseX-30,mouseY+90);
  line(mouseX+10,mouseY+30,mouseX+30,mouseY+90);
}

