import processing.sound.*;
SoundFile file1,file2,file3,P1,P2,P3,P4,P5,D1,D2,D3,D4,D5,B1,B2,B3,B4,B5;

int red, green, blue;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the data folder of the sketch and play it back in a loop
  file1 = new SoundFile(this, "jass Piano.wav");
  file2 = new SoundFile(this, "jass Bass.wav");
  file3 = new SoundFile(this, "jass Drums.wav");
  P1 = new SoundFile(this, "Piano C.wav");
  P2 = new SoundFile(this, "Piano Eb.wav");
  P3 = new SoundFile(this, "Piano F.wav");
  P4 = new SoundFile(this, "Piano G.wav");
  P5 = new SoundFile(this, "Piano Bb.wav");
  B1 = new SoundFile(this, "Bass C.wav");
  B2 = new SoundFile(this, "Bass Eb.wav");
  B3 = new SoundFile(this, "Bass F.wav");
  B4 = new SoundFile(this, "Bass G.wav");
  B5 = new SoundFile(this, "Bass Bb.wav");
  D1 = new SoundFile(this, "Drums snare.wav");
  D2 = new SoundFile(this, "Drums crash.wav");
  D3 = new SoundFile(this, "Drums tomL.wav");
  D4 = new SoundFile(this, "Drums tomH.wav");
  D5 = new SoundFile(this, "Drums tomM.wav");
  file1.loop();
  file2.loop();
  file3.loop();
}      

void draw() {
   background(red, green, blue);
}

void keyPressed() {
  // Set a random background color each time you hit then number keys
  red=int(random(255));
  green=int(random(255));
  blue=int(random(255));

  switch(key) {
  case '1':
    P1.play();
    break;
  case '2':
    P2.play();
    break;
  case '3':
    P3.play();
    break;
  case '4':
    P4.play();
    break;
  case '5':
    P5.play();
    break;
  case '6':
    B1.play();
    break;
  case '7':
    B2.play();
    break;
  case '8':
    B3.play();
    break;
  case '9':
    B4.play();
    break;
  case '0':
    B5.play();
    break;
  case 'q':
    D1.play();
    break;
  case 'w':
    D2.play();
    break;
  case 'e':
    D3.play();
    break;
  case 'r':
    D4.play();
    break;
  case 't':
    D5.play();
    break;
  }
}
