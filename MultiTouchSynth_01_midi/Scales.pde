class Scales {

  HashMap<Integer, int[]> scales = new HashMap<Integer, int[]>();
  ArrayList<Float> freqs = new ArrayList<Float>();

  int biyu[] = {0, 3, 7, 10, 12, 15, 19, 22, 24, 27, 31, 34, 36, 39, 43, 46, 48};   
  int major[] = {0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24, 26, 28, 29, 31, 33, 35, 36};
  int minor[] = {0, 2, 3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24, 26, 27, 29, 31, 32, 34, 36};
  int blues[] = {0, 3, 5, 6, 7, 10, 12, 15, 17, 18, 19, 22, 24, 27, 29, 30, 31, 34, 36};
  
  int chadGadyo[] = {0, 2, 3, 5, 7, 12, 14, 15, 17, 19, 24, 26, 27, 29, 31, 36};
  int jazzMinor[] = {0, 2, 3, 5, 7, 9, 11, 12, 14, 15, 17, 19, 21, 23, 24, 26, 27, 29, 31, 33, 35, 36};
  int bluesDiminished[] = {0, 1, 3, 4, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 21, 22, 24};
  int hiraJoshi[] = {0, 2, 3, 7, 8, 12, 14, 15, 19, 20, 24, 26, 27, 31, 32, 36};
  int kokinJoshi[] = {0, 1, 5, 7, 10, 12, 13, 17, 19, 22, 24, 25, 29, 31, 34, 36};
  int sakuraPenta[] = {0, 1, 5, 7, 8, 12, 13, 17, 19, 20, 24, 25, 29, 31, 32, 36};
  int hawaii[] = {0, 2, 3, 7, 9, 11, 12, 14, 15, 19, 21, 23, 24, 26, 27, 31, 33, 35, 36};
  int majorGipsy[] = {0, 1, 4, 5, 7, 8, 11, 12, 13, 16, 17, 19, 23, 24, 25, 28, 29, 31, 32, 35, 36};
  int minorGipsy[] = {0, 2, 3, 6, 7, 8, 11, 12, 14, 15, 18, 19, 23, 24, 26, 27, 30, 31, 32, 35, 36};

//  void calcScale(float pitch) {
//    for (double i = -4; i <= 4; i++) {
//      double a = pitch * Math.pow(2, i);
//      for (double j = -9; j <= 2; j++) { 
//        double b = a * Math.pow(2, j/12);
//        freqs.add((float)b);
//      }
//    }
//    Collections.sort(freqs);
//  }

  void addScales() {
    scales.put(0, biyu);
    scales.put(1, blues);
    scales.put(2, bluesDiminished);
    scales.put(3, hawaii);
    scales.put(4, jazzMinor); 
    scales.put(5, chadGadyo);    
    scales.put(6, sakuraPenta);
    scales.put(7, kokinJoshi);
    scales.put(8, hiraJoshi);
    scales.put(9, minorGipsy); 
    scales.put(10, majorGipsy);
    scales.put(11, minor);
    scales.put(12, major);

//    for (int i = 0; i < scales.size()-1; i++) {
//      println(scales.get(i));
//    }
  }
}

