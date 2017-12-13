import processing.video.*;
Capture video;

color color1; 
color color2;
color color3;
color color4;
color color5;
color [] array;
float threshold = 13;
int lol  = 0;
ArrayList colors = new ArrayList();
String previous = "";
void setup() {
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, cameras[3]);
  video.start();
  size(800, 500);
  color1 = color(255,0,0);//red
  color2 = color(0,255,0);//green
  color3 = color(75,0,130);//purple
  color4 = color(255,165,0);//orange
  color5 = color(0,128,0);//pink

}
void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);

  //threshold = map(mouseX, 0, width, 0, 100);

  float avgX = 0;
  float avgY = 0;
  
  float avgX1 = 0;
  float avgY1 = 0;
  
  float avgX2 = 0;
  float avgY2 = 0;
  
  float avgX3 = 0;
  float avgY3 = 0;
  
  float avgX4 = 0;
  float avgY4 = 0;

  int count = 0;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  color [] array = {color1,color2,color3,color4,color5};
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(color1);
      float g2 = green(color1);
      float b2 = blue(color1);
      float r3 = red(array[1]);
      float g3 = green(array[1]);
      float b3 = blue(array[1]);
      float r4 = red(array[2]);
      float g4 = green(array[2]);
      float b4 = blue(array[2]);
      float r5 = red(array[3]);
      float g5 = green(array[3]);
      float b5 = blue(array[3]);
      float r6 = red(array[4]);
      float g6 = green(array[4]);
      float b6 = blue(array[4]);
      

      float d = distSq(r1, g1, b1, r2, g2, b2);
      float d1 = distSq(r1, g1, b1, r3, g3, b3);
      float d2 = distSq(r1, g1, b1, r4, g4, b4);
      float d3 = distSq(r1, g1, b1, r5, g5, b5);
      float d4 = distSq(r1, g1, b1, r6, g6, b6);
      if (d < threshold*threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
      if (d1 < threshold*threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        avgX1 += x;
        avgY1 += y;
        count1++;
      }
      if (d2 < threshold*threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        avgX2 += x;
        avgY2 += y;
        count2++;
      }
      if (d3 < threshold*threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        avgX3 += x;
        avgY3 += y;
        count3++;
      }
      if (d4 < threshold*threshold) {
        stroke(255);
        strokeWeight(1);
        point(x, y);
        avgX4 += x;
        avgY4 += y;
        count4++;
      }
    
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if(x == (video.width-1)){
      if (count > 0) {
        avgX = avgX / count;
        avgY = avgY / count;
        // Draw a circle at the tracked pixel
        fill(255);
        //print("red ");
        colors.add(1);
      }
      if (count1 > 0) {
        avgX1 = avgX1 / count1;
        avgY1 = avgY1 / count1;
        // Draw a circle at the tracked pixel
        fill(255);
        //print("green ");
        colors.add(2);
      }
      if (count2 > 0) {
        avgX2 = avgX2 / count2;
        avgY2 = avgY2 / count2;
        // Draw a circle at the tracked pixel
        fill(255);
        //print("purple ");
        colors.add(3);
      }
      if (count3 > 0) {
        avgX3 = avgX3 / count3;
        avgY3 = avgY3 / count3;
        // Draw a circle at the tracked pixel
        fill(255);
        strokeWeight(4.0);
       // print("orange ");
        colors.add(4);
      }
      if (count4 > 0) {
        avgX4 = avgX4 / count4;
        avgY4 = avgY4 / count4;
        // Draw a circle at the tracked pixel
        fill(255);
       // print("pink ");
        colors.add(5);
      }
      if (colors.isEmpty() == false && previous.equals(colors.toString()) == false){
        previous = (String)colors.toString();
        String a = previous.replace("[","");
        a = a.replace("]","");
        a = a.replace(", ","");
        println(a);
        
      }
      colors.clear();
    }
  }
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}
void keyPressed() {
  if (key == 'a') {
    threshold ++;
  } else if (key == 'z') {
   threshold --;
  }
  println(threshold); 
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  if (lol == 0) {
   color1 = video.pixels[loc];
   lol += 1;
  }else if (lol == 1){
   color2 = video.pixels[loc];
   lol += 1;
  }else if (lol == 2){
    color3 = video.pixels[loc];
    lol += 1;
  }else if (lol == 3){
    color4 = video.pixels[loc];
    lol += 1;
  }else if (lol == 4){
    color5 = video.pixels[loc];
    lol += 1;
  }
  print(lol);
}
