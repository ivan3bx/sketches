// generated by chat.gpt, lightly tweaked to reduce number of dots and reduce rotation speed
// 2023/10/04

float angleY = 0;
float radius = 150;
float dotSize = 10;
float[] xPositions, yPositions, zPositions;
int totalDots = 300;

void setup() {
  size(800, 400, P3D);
  xPositions = new float[totalDots];
  yPositions = new float[totalDots];
  zPositions = new float[totalDots];
  
  float phi, theta;
  float spacing = TWO_PI / totalDots;
  
  for (int i = 0; i < totalDots; i++) {
    phi = acos(-1 + (2.0 * i) / totalDots);
    theta = sqrt(totalDots * PI) * phi;
    
    xPositions[i] = radius * sin(theta) * cos(phi);
    yPositions[i] = radius * sin(theta) * sin(phi);
    zPositions[i] = radius * cos(theta);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(angleY);
  
  for (int i = 0; i < totalDots; i++) {
    float x = xPositions[i];
    float y = yPositions[i];
    float z = zPositions[i];
    
    stroke(255);
    strokeWeight(dotSize);
    point(x, y, z);
  }
  
  angleY += 0.004;  // Rotate from left to right
  //saveFrame("frames/screen-####.png");
}
