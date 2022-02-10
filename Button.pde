class Button {
  int x, y, width, height;
  String text;
  Runnable action;
  boolean pre = false;

  Button(int x, int y, int width, int height, String text, Runnable action) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.text = text;
    this.action = action;
  }

  void print() {
  textSize(14);
    if (!mousePressed && pre) {
      if (mouseX > x && mouseX < x + width)
        if (mouseY > y && mouseY < y + height) {
          action.run();
        }
    }
    fill(255);
    rect(x, y, width, height);
    fill(0);
    text(text, x + 5, y + height/2+5);
    pre = mousePressed;
  }
}