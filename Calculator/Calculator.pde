//instantiating each of the classification of buttons
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[11];
CalcButton[] spButtons = new CalcButton[1];

String displayValue = "0";
String valueToCompute = ""; //string value left of operator 
String valueToCompute2 = ""; //string value right of operator 
float valueToComputeI = 0; //float value left of operator
float valueToComputeI2 = 0; //float value right of operator
float result = 0;
char opValue;
boolean firstNum;
// for (πr²) valueToCompute2 = r

void setup() {
  size(235, 400);
  background(255);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  fill(122);
  rect(1, 1, 230, 395);
  // Populate number buttons
  numButtons[0] = new CalcButton(65, 275).asNumber(0, 45, 45);
  numButtons[1] = new CalcButton(10, 220).asNumber(1, 45, 45);
  numButtons[2] = new CalcButton(65, 220).asNumber(2, 45, 45);
  numButtons[3] = new CalcButton(120, 220).asNumber(3, 45, 45);
  numButtons[4] = new CalcButton(10, 165).asNumber(4, 45, 45);
  numButtons[5] = new CalcButton(65, 165).asNumber(5, 45, 45);
  numButtons[6] = new CalcButton(120, 165).asNumber(6, 45, 45);
  numButtons[7] = new CalcButton(10, 110).asNumber(7, 45, 45);
  numButtons[8] = new CalcButton(65, 110).asNumber(8, 45, 45);
  numButtons[9] = new CalcButton(120, 110).asNumber(9, 45, 45);
  // populate operators
  opButtons[0] = new CalcButton(175, 110).asOperator("+", 45, 45);
  opButtons[1] = new CalcButton(175, 165).asOperator("-", 45, 45);
  opButtons[2] = new CalcButton(175, 220).asOperator("*", 45, 45);
  opButtons[3] = new CalcButton(175, 275).asOperator("/", 45, 45);
  opButtons[4] = new CalcButton(175, 55).asOperator("C", 45, 45);
  opButtons[5] = new CalcButton(120, 275).asOperator("±", 45, 45);
  opButtons[6] = new CalcButton(120, 330).asOperator("=", 100, 45);
  opButtons[7] = new CalcButton(10, 55).asOperator("a²", 45, 45);
  opButtons[8] = new CalcButton(65, 55).asOperator("a³", 45, 45);
  opButtons[9] = new CalcButton(120, 55).asOperator("√", 45, 45);
  opButtons[10] = new CalcButton(10, 330).asOperator("πr²", 100, 45);
  //populate special buttons
  spButtons[0] = new CalcButton(10, 275).asSpecial(".", 45, 45);
  //set the initial value of first num to true
  firstNum = true;
}

void draw() {
  //DRAW NUMBER BUTTONS
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  updateDisplay();
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.overBox) {
      if (firstNum) {
        //println(i + "" + inumButton.numButtonValue);
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "=") {
        //perform calculation
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "/") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "*") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "±") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "a²") {
        if (result != 0) {
          opValue = '²';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "a²";
        } else { 
          opValue = '²';
          firstNum = false;
          displayValue = "a²";
        }
      } else if (iOpButton.opButtonValue == "a³") {
        if (result != 0) {
          opValue = '³';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "a³";
        } else { 
          opValue = '³';
          firstNum = false;
          displayValue = "a³";
        }
      } else if (iOpButton.opButtonValue == "√") {
        if (result != 0) {
          opValue = '√';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "√";
        } else {
          opValue = '√';
          firstNum = false;
          displayValue = "√";
        }
      } else if (iOpButton.opButtonValue == "πr²") {
        if (result != 0) {
          opValue = 'π';
          valueToCompute = "";
          firstNum = false;
          displayValue = "πr²";
        } else {
          opValue = 'π';
          firstNum = false;
          displayValue = "πr²";
        }
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.click();
    if (ispButton.overBox) {
      if (ispButton.spButtonValue == ".") {
        //
        if (ispButton.overBox && firstNum == true) {
          valueToCompute += ispButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (ispButton.overBox && firstNum == false) {
          valueToCompute2 += ispButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}


void performCalculation() {
  //set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  //perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == '=') {
    if (firstNum) {
      displayValue = str(result);
    }
  } else if (opValue == '²') {
    if (firstNum) {
      result = sq(valueToComputeI);
      displayValue = str(result);
    }
  } else if (opValue == '³') {
    if (firstNum) {
      result = valueToComputeI * valueToComputeI * valueToComputeI;
      displayValue = str(result);
    }
  } else if (opValue == '√') {
    if (firstNum) {
      result = sqrt(valueToComputeI);
      displayValue = str(result);
    }
  } else if (opValue == 'π') {
    if (firstNum) {
      result = sq(float(valueToCompute2)) * 3.1415926535897932;
      displayValue = str(result);
    }
  }

  //let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void updateDisplay() {
  fill(200, 200, 150);
  rect(10, 10, 210, 35, 7);
  fill(0);
  textSize(25);
  text(displayValue, 20, 37);
}

class CalcButton {
  //variables
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int boxSize = 45;
  int buttonW = 45;
  int buttonH = 45;
  boolean overBox = false;


  //number buttons
  CalcButton(float tempXpos, float tempYpos) {
    //numButtonValue = tempNumButtonValue;
    xpos = tempXpos;
    ypos = tempYpos;
    //println(numButtonValue);
  }

  //number buttons
  CalcButton asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  //operator buttons
  CalcButton asOperator(String tempOpButtonValue, int tempW, int tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  //special buttons
  CalcButton asSpecial(String buttonValue, int tempW, int tempH) {
    isSpecial = true;
    spButtonValue = buttonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  //draw buttons
  void display() {
    //rounded edge buttons
    if (isNumber) {
      fill(155);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(122, 44, 22);
      textSize(24);
      text(int(numButtonValue), xpos+15, ypos+30);
    } else if (isSpecial) {
      fill(177,0,177);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, boxSize, boxSize, 10);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+30);
    } else if (isOperator) {
      fill(177,0,177);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+15, ypos+30);
    }
  }

  //mouse actions
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+boxSize && mouseY > ypos && mouseY < ypos+boxSize;
  }
}


