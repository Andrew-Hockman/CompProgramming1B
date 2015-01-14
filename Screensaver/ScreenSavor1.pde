float xpos;
float ypos;
float strokeW;
float pointCount;

void setup() {
  background(random(255));
  size(960, 500);
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  if (frameCount == 400) {
    frameCount = 0;
    background(random(255));
  }
  strokeW = random(3, 10);
  pointCount = random(5, 20);
  stroke(random(15), random(100), random(200));
  if (xpos > width || xpos <0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  } else {
    if (random(100)>70) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (random(100)>65) {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    } else if (random(100)>55) {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    } else if (random(100)>45) {
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
    } else if (random(100)>35) {
      strokeWeight(strokeW);
      moveDl(xpos, ypos, pointCount);
    } else if (random(100)>25) {
      strokeWeight(strokeW);
      moveDr(xpos, ypos, pointCount);
    } else if (random(100)>15) {
      strokeWeight(strokeW);
      moveUl(xpos, ypos, pointCount);
    } else if (random(100)>5) {
      strokeWeight(strokeW);
      moveUr(xpos, ypos, pointCount);
    }
  }
}

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY + i;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY - i;
    }
  }

  void moveDl(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX - i;
      ypos = startY + i;
    }
  }

  void moveDr(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX + i;
      ypos = startY + i;
    }
  }

  void moveUr(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX + i;
      ypos = startY - i;
    }
  }

  void moveUl(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX - i;
      ypos = startY - i;
    }
  }


