class Interface {

  void drawInterface(float xloc, float yloc, int sizeX, int sizeY, int num) {
    iL.beginDraw();
    float grayvalues = 255/num;
    float steps = sizeY/num;
    iL.noStroke();
    for (int i = 0; i < num; i++) {
      iL.fill(i*grayvalues);
      iL.ellipse(xloc, yloc, sizeX - i*steps, sizeY - i*steps);
    }
    iL.endDraw();
    image(iL, 0, 0);
  }
  void rescale() {
    iL.background(0);        // Interface nur 1 mal laden. ;)
    iL.fill(255);
    iL.text("scale " + scale, 10, 10);
    iL.text("scaleOffset " + scaleOffset, 10, 30);
    tone = scal.scales.get(scale).length;
    if (noiseMap) randomSounds(0.003);
    if (interFace) drawInterface(width*0.5, height*0.5, floor(width), floor(height), tone);
    iL.loadPixels();
  }
  void randomSounds(float increment) {
    iL.beginDraw();
    iL.loadPixels();
    float xoff = 0.0; 
    noiseDetail(2, 0.6);
    for (int x = 0; x < width; x++) {
      xoff += increment;  
      float yoff = 0.0;   
      for (int y = 0; y < height; y++) {
        yoff += increment; 
        float bright = noise(xoff, yoff) * 290;
        pixels[x+y*width] = color(bright);
      }
    }  
    iL.updatePixels();
    iL.filter(POSTERIZE, tone+1);
    iL.endDraw();
    image(iL, 0, 0);
  }
}

