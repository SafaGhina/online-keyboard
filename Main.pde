Key singleKey;

// arrays for keys                
char[] keys = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
               'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
                 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L',
                      'Z', 'X', 'C', 'V', 'B', 'N', 'M', ' '
              };
                          
Object[] objKeys = new Object[keys.length];

// initialize backspace
Object backspaceKey;

void setup() {
  size(1070, 500);
  fill(#ffffff); // white bg for keyboard
  stroke(5);
  rect(80, 20, 900, 380, 15);
}

void draw() {
  // initial variables
  int keySpacing = 29;
  int keyWidth = 60;
  int keyHeight = 50;
  int initialX = keyWidth/2 + keyWidth + 10;
  int initialY = keyHeight/2 + 15;
  int rowSpacing = 70;
  
  int x = initialX;
  int y = initialY;
  
  int rowNum = 1; // count number of rows
  
  // draw keys
  for(int i = 0; i < keys.length; i++) {
    if (x + keyWidth > width - initialX) { // move to the next row
      x = initialX;
      y += rowSpacing;
      rowNum++;
      
      if (rowNum == 3) x = initialX + 40; // more spacing at start for third row
      if (rowNum == 4) x = initialX + 130; // more spacing at start for third row
    }
    
    if (keys[i] == ' ') {
      // draw spacebar
      x = initialX + 133;
      y += rowSpacing + 10;
      singleKey = new Key(x, y, keyWidth + 265, keyHeight, ' ', 32);
    } else {
      // draw other keys
      singleKey = new Key(x, y, keyWidth, keyHeight, ' ', 0); // default constructor values
      singleKey.setKeyDisplayText(keys[i]);
      singleKey.setKeyCodeValue(keys[i]);
    }
    
    // store keys in array of objects
    objKeys[i] = singleKey;
    singleKey.drawKey();
    x += keyWidth + keySpacing;
  }
  
  // backspace key
  x = initialX + 500;
  singleKey = new Key(x, y, keyWidth + 160, keyHeight, '<', 8);
  backspaceKey = singleKey;
  singleKey.drawKey();
}

// info for display text
int displayTextX = 120;
int displayTextY = 430;
int displayXLimit = displayTextX + 830;
int displayXIncrement = 20;

int displayX = displayTextX;
int displayY = displayTextY;

void mousePressed() {
  boolean keyFound = false;
  
  for (int i = 0; i < objKeys.length && !keyFound; i++) {
    Key currentKey = (Key) objKeys[i];
    char userChar = currentKey.getKeyDisplayText();
    
    if (currentKey.keyIsClicked()) {
      text(userChar, displayX, displayY);
      displayX += displayXIncrement;
      
      // create new line
      if (displayX >= displayXLimit) {
        displayX = displayTextX;
        displayY += 50;
      }
      
      keyFound = true;
    }
  }
  
  if (((Key) backspaceKey).keyIsClicked()) {
    displayX -= displayXIncrement; // go back one space
    
    // deletes up one row if on next line
    if (displayX < displayTextX) {
      displayX = displayXLimit - displayXIncrement;
      displayY -= 50;
    }
    
    // redraw "white space" in place
    fill(204, 204, 204); // bg color
    noStroke();
    rect(displayX - 10, displayY - 28, displayXIncrement + 2, 40);
  }
}
