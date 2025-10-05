public class Key {
  // variables
  private int x;
  private int y;
  private int w = 60;
  private int h = 50;
  private char keyDisplayText;
  private byte keyCodeValue; // only values up to 2 digits

  // methods
  boolean keyIsClicked() {
    if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h) {
      return true;
    }
    return false;
  }

  void drawKey() {
    // key info
    fill(#ffffff); // white
    stroke(10);
    rect(this.x, this.y, this.w, this.h, 10);

    // text info
    fill(#808080); // gray
    textAlign(CENTER, CENTER);
    textSize(30);
    text(this.keyDisplayText, this.x + this.w / 2, this.y + this.h / 2);
  }

  // constructors
  Key(int x, int y, int w, int h, char keyDisplayText, int keyCodeValue) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.keyDisplayText = keyDisplayText;
    this.keyCodeValue = (byte) keyCodeValue;
  }

  // accessors (getters)
  char getKeyDisplayText() {
    return this.keyDisplayText;
  }
  int getKeyCodeValue() {
    return (byte) this.keyCodeValue;
  }

  // mutators (setters)
  void setKeyDisplayText(char newKeyDisplayText) {
    this.keyDisplayText = newKeyDisplayText;
  }
  void setKeyCodeValue(int newKeyCodeValue) {
    this.keyCodeValue = (byte) newKeyCodeValue;
  }
}
