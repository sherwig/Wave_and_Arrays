/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 HD Face tracking.
 Vertex Face positions are mapped to the Color Frame or to the Infrared Frame
 */
import KinectPV2.*;

import peasy.*;

// IMPORT THE SPOUT LIBRARY
import spout.*;

Spout spout;
  
float xoff = 0.0;

PeasyCam cam;

KinectPV2 kinect;

void setup() {
  size(1920, 1080,P3D);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
 //cam = new PeasyCam(this, 0, 0, 0, 50);
  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(0);
  //cam.setMaximumDistance(500);
  kinect = new KinectPV2(this);

  //enable HD Face detection
  kinect.enableHDFaceDetection(true);
  kinect.enableColorImg(true); //to draw the color image
  kinect.init();
}

void draw() {
  background(0);

  // Draw the color Image
 // image(kinect.getColorImage(), 0, 0);

  //Obtain the Vertex Face Points
  // 1347 Vertex Points for each user.
  ArrayList<HDFaceData> hdFaceData = kinect.getHDFaceVertex();

  for (int j = 0; j < hdFaceData.size(); j++) {
    //obtain a the HDFace object with all the vertex data
    HDFaceData HDfaceData = (HDFaceData)hdFaceData.get(j);

    if (HDfaceData.isTracked()) {

      //draw the vertex points
      stroke(0, 0, 255);
      beginShape(LINES);
      noFill();
      //fill(0,0,255);
      for (int i = 0; i < KinectPV2.HDFaceVertexCount-2; i++) {
        float x = HDfaceData.getX(i);
        float y = HDfaceData.getY(i);
      //   println(KinectPV2.HDFaceVertexCount);
        float x2 = HDfaceData.getX(i+1);
        float y2 = HDfaceData.getY(i+1);
        float x3 = HDfaceData.getX(i+2);
        float y3 = HDfaceData.getY(i+2);
        
        xoff = xoff + .005;
        x2 = (noise(xoff) * HDfaceData.getX(i));
      //  y = noise(xoff)*HDfaceData.getY(i);

        //y2 = noise(xoff)*HDfaceData.getY(i);
        
        vertex(x, y);
        vertex(x2, y2);
        vertex(x3, y3);
        vertex(x, y2);
        vertex(x2, y);
        vertex(x2, y3);
       
      }
      endShape();


    }
      //textSize(32);
      //text(j, 100, 300); 
      //fill(255, 255, 255);
  }
          spout.sendTexture();

}
