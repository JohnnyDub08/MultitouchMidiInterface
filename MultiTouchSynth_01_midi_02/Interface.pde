class Interface {

  void drawInterface(float xloc, float yloc, int sizeX, int sizeY, int num) {
    float grayvalues = 255/num;
    float steps = sizeY/num;
    noStroke();
    for (int i = 0; i < num; i++) {
      fill(i*grayvalues);
      ellipse(xloc, yloc, sizeX - i*steps, sizeY - i*steps);
    }
  }
  void rescale() {
    background(0);        // Interface nur 1 mal laden. ;)
    fill(255);
    text("scale " + scale, 10, 10);
    text("scaleOffset " + scaleOffset, 10, 30);
    tone = scal.scales.get(scale).length;
    if (noiseMap) randomSounds(0.003);
    if (interFace) drawInterface(width*0.5, height*0.5, floor(width), floor(height), tone);
    loadPixels();
  }
  void randomSounds(float increment) {
    loadPixels();
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
    updatePixels();
    filter(POSTERIZE, tone+1);
  }
}

