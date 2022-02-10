import java.awt.*;
import java.awt.event.*;
import java.awt.datatransfer.*;
import javax.swing.*;
import java.io.*;

ArrayList<Button> buttons = new ArrayList();
boolean big, small, special, numbers;
int lenght = 32;
String password = "";

void setup() {
  size(600, 200);
  buttons.add(new Button(50, 50, 150, 20, "Passwort Generieren", new GeneratePassword()));
  buttons.add(new Button(50, 100, 150, 20, "Passwort Kopieren", new CopyPassword()));
  big = true;
  small = true;
  special = true;
  numbers = true;
  buttons.add(new Button(400, 50, 150, 20, "Länge + 1", new Add1toLenght()));
  buttons.add(new Button(400, 100, 150, 20, "Länge - 1", new Subtract1toLenght()));
}

void draw() {
  background(150);
  for (Button button : buttons) {
    button.print();
  }
  color(0);
  textSize(16);
  text("Länge: " + lenght, 50, 150);
  text("Passwort: " + password, 150, 150);
  textSize(20);
  text("Passwor Generator", 210, 30);
}

class Subtract1toLenght  implements Runnable {
  void run() {
    lenght--;
  }
}

class Add1toLenght  implements Runnable {
  void run() {
    lenght++;
  }
}

class CopyPassword implements Runnable {
  void run() {  
    StringSelection data = new StringSelection(password);
    Toolkit.getDefaultToolkit().getSystemClipboard().setContents(data, data);
  }
}

class GeneratePassword implements Runnable {
  void run() {
    String letters = "";
    if (big) letters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (small) letters += "abcdefghijklmnopqrstuvwxyz";
    if (special) letters += "!\"§$%&/()=?+#-.,";
    if (numbers) letters += "1234567890";
    char[] chars = letters.toCharArray();
    password = "";
    for (int i = 0; i < lenght; i++) {
      password += chars[(int)random(chars.length)];
    }
  }
}