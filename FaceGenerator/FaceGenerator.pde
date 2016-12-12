// Martin Morales
// 12-11-16
// A face generator using Gaussian distribution
// Inspired by: https://github.com/shiffman/The-Nature-of-Code-Examples/blob/master/introduction/NOC_I_4_Gaussian/NOC_I_4_Gaussian.pde

PImage imgHair, imgEyes, imgMouth, imgNose;
int time;
float eyesY, mouthY, noseY;

// In this example, all of the images have the same std dev, and mean
float stdDev = 5;  // Standard deviation from the mean
float mean = -15;  // Average y-pos for all of the images

void setup() {
  size(640, 640);  // Setup java GUI
  time = millis();

  genHair();
  genEyes();
  genMouth();
  genNose();
}

void draw() {
  background(255);  // clears screen

  // Draw head shape
  fill(237, 200, 150);
  stroke(237, 200, 150);
  ellipse(width/2, 200, 300, 300);

  image(imgHair, 0, -50);  // hair can't really deviate in any cardinal direction

  // show images, the y directions will be generated
  image(imgEyes, 0, eyesY);
  image(imgMouth, 0, mouthY);
  image(imgNose, 0, noseY);


  if (millis() > time + 2000)  // Only change the images every 2 seconds
  {

    // Generate face parts
    genHair();
    genEyes();
    genMouth();
    genNose();

    time = millis();  // reset timer
  }
}

void genHair() {
  int choice = int(random(1, 4));    // low inclusive, high exclusive
  if (choice == 1)
    imgHair = loadImage("Resources/hair1.png");
  else if (choice == 2)
    imgHair = loadImage("Resources/hair2.png");
  else
    imgHair = loadImage("Resources/hair3.png");
}

void genEyes() {
  int choice = int(random(1, 4));    // low inclusive, high exclusive
  if (choice == 1)
    imgEyes = loadImage("Resources/eyes1.png");
  else if (choice == 2)
    imgEyes = loadImage("Resources/eyes2.png");
  else
    imgEyes = loadImage("Resources/eyes3.png");

  eyesY = genGaussian();
}

void genMouth() {
  int choice = int(random(1, 3));    // low inclusive, high exclusive
  if (choice == 1)
    imgMouth = loadImage("Resources/mouth1.png");
  else
    imgMouth = loadImage("Resources/mouth2.png");

  mouthY = genGaussian();
}

void genNose() {
  // only one nose at the moment
  imgNose = loadImage("Resources/nose1.png");

  noseY = genGaussian();
}

float genGaussian() {
  float val = randomGaussian();      // Get a gaussian random number w/ mean of 0 and std dev of 1.0
  val = (val * stdDev) + mean;      // Adjusts random Gaussian by the mean and stdDev
  return val;
}