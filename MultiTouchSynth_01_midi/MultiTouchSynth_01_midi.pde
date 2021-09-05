import java.io.File;
import java.util.Collections;
import java.util.Arrays; 
import vialab.SMT.*;
import themidibus.*; 

Scales scal = new Scales();
Interface inter = new Interface();
Midi midi = new Midi();
MidiBus myBus; 
PGraphics iL;
ArrayList<Midi> midis = new ArrayList<Midi>();
int tone;
int sound = 0;
int scale = 6;
int scaleOffset = 48;
int scaleOffsetCOPY = scaleOffset;
int oscStyle = 2;
float interval = 1;
float detune = 0;
boolean noiseMap, trigger;
int count = 0; // Fingeranzahl
boolean interFace = true;
float middleX, middleY;
int averageWidth, averageHeight;

void setup() {
  size(displayWidth, displayHeight, SMT.RENDERER);
  background(0);
  iL = createGraphics(displayWidth, displayHeight);

  //Midi
  MidiBus.list();
  myBus = new MidiBus(this, -1, "Saffire 6USB2.0"); // Create a new MidiBus 
  for (int i = 0; i < 10; i++) {
    midis.add(new Midi());
  }

  // Multitouch
  SMT.init( this, TouchSource.AUTOMATIC);
  SMT.setTouchDraw(TouchDraw.NONE);
  SMT.setTrailEnabled(false);

  scal.addScales();
  tone = scal.scales.get(scale).length-1;

  middleX = width*0.5;
  middleY = height*0.5;
  averageWidth = floor(width);
  averageHeight = floor(height);

  inter.drawInterface(middleX, middleY, averageWidth, averageHeight, tone);
  iL.loadPixels();
}

void draw() {
  count = fingerDown();
  osciLogic();
}

public int fingerDown() {
  int count = SMT.getTouchCount();
  return count;
}

void osciLogic() {
  for (vialab.SMT.Touch touch : SMT.getTouches () ) {
    Touch t = touch;
    for (int i = 0; i < midis.size (); i++) {
      if (t.isDown && t.cursorID == i) {
        midis.get(i).triggerNote(t);
      }
    }
  }
  if (count == 0) {
    midis.get(0).stopNote();
    midis.get(1).stopNote();
    midis.get(2).stopNote();
    midis.get(3).stopNote();
    midis.get(4).stopNote();
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 1) {
    midis.get(1).stopNote();
    midis.get(2).stopNote();
    midis.get(3).stopNote();
    midis.get(4).stopNote();
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 2) {
    midis.get(2).stopNote();
    midis.get(3).stopNote();
    midis.get(4).stopNote();
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 3) {
    midis.get(3).stopNote();
    midis.get(4).stopNote();
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 4) {
    midis.get(4).stopNote();
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 5) {
    midis.get(5).stopNote();
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 6) {
    midis.get(6).stopNote();
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 7) {
    midis.get(7).stopNote();
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 8) {
    midis.get(8).stopNote();
    midis.get(9).stopNote();
  }
  if (count == 9) {
    midis.get(9).stopNote();
  }
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    //restartSound("vibra/");
  } else if (key == 'r' || key == 'R') {
    //restartSound("rhodes/");
  } else if (key == 'y' || key == 'Y') {
    interval = 1.5;
  } else if (key == 'x' || key == 'X') {
    interval = 1.3333333;
  } else if (key == 'c' || key == 'C') {
    interval = 1.6666666;
  } else if (key == 'v' || key == 'V') {
    interval = 0.5;
  } else if (key == 'b' || key == 'B') {
    interval = 2;
  } else if (key == 'n' || key == 'N') {
    interval = 1;
    detune = 0;
  } else if (key == 'm' || key == 'M') {
    //    oscStyle++;
    //    if (oscStyle > 3) oscStyle = 0;
    //    oscillators.get(0).setOsc(oscStyle);
  } else if (key == 'k' || key == 'K') {
    //    sound++;
    //    if (sound > 2) sound = 0;
  } else if (key == 'a' || key == 'A') {
    interFace = true;
    noiseMap = false;
    noiseSeed((int)random(10000));
    inter.rescale();
  } else if (key == 's' || key == 'S') {
    interFace = false;
    noiseMap = true;
    inter.rescale();
  } else if (key == 'q' || key == 'Q') {
    myBus.sendControllerChange(4, 0, 1);
  } else if (key == 'w' || key == 'W') {
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      scale++;
      if (scale > scal.scales.size()-1) { 
        scale = 0;
      }
      inter.rescale();
    } else if (keyCode == LEFT) {
      scale--;
      if (scale < 0) { 
        scale = scal.scales.size()-1;
      }
      inter.rescale();
    } else if (keyCode == DOWN) {
      scaleOffset--;
      if (scaleOffset < 12) {
        scaleOffset = 56;
      } 
      inter.rescale();
    } else if (keyCode == UP) {
      scaleOffset++;
      if (scaleOffset > 56) {
        scaleOffset = 12;
      } 
      inter.rescale();
    } else {
    }
  }
}

void wait(int millis) {
  try {
    Thread.sleep(millis);
  }
  catch(InterruptedException ex)
  {
    Thread.currentThread().interrupt();
  }
}

boolean sketchFullScreen() {
  return true;
}

