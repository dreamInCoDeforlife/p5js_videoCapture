var capture;
var color1; 
var color2;
var color3;
var color4;
var color5;
function setup() {
  createCanvas(710, 400);
  capture = createCapture(VIDEO);
  capture.size(800, 500);
  //capture.hide();
  color1 = color(255,0,0);//red
  color2 = color(0,255,0);//green
  color3 = color(75,0,130);//purple
  color4 = color(255,165,0);//orange
  color5 = color(0,128,0);//pink
}

function draw() {
  background(255);
  image(capture, 0, 0, 320, 240);
  filter('INVERT');
}

