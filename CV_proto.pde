import KinectPV2.KJoint;
import KinectPV2.*;
import java.util.ArrayList;
String[] spot= new String [8];     
int vert1, vert2;
Limbtracker limbtracker;
Limbtracker limbtracker2;
Limbtracker limbtracker3;
Boolean[] bool=new Boolean[3];
KinectPV2 kinect;
//ArrayList<Circle> circles = new ArrayList<Circle>();
Jazz jazz;
float a=0.0;
float s=0.0;
float threshold=.5;
float zVal = 950;
float rotX = PI;
int numShapes=0;
int numShapesHigh=10;
ArrayList <Square> squareArr;
ArrayList <Squigly> squiglyArr;
ArrayList <Triangle> triangleArr;
Square square;
Triangle triangle; 
Squigly squigly;
color col1=color(255,251,157);
//color col2=color(221,160,221);
color col2=color(0,0,255);
color col3=color(255,127,80);
Gradients gradient;
float quad1,quad2,quad3;

void setup() {
  size(1920, 1080, P3D);
  colorMode(RGB);
  kinect = new KinectPV2(this);

//  kinect.enableSkeletonColorMap(true);
//  kinect.enableColorImg(true);
  kinect.enableSkeleton3DMap(true);
  kinect.enableDepthMaskImg(true);
  //kinect.enableSkeletonDepthMap(true);

  kinect.init();
    
  vert1=width/3; 
  vert2=vert1*2;
  
  quad1=width/4;
  quad2=quad1*2;
  quad3=quad2+quad1;

  limbtracker= new Limbtracker(25);
  limbtracker2= new Limbtracker(25);
  limbtracker3= new Limbtracker(25);
  
  gradient=new Gradients();
 
  //Jazz loops
  jazz=new Jazz();
  //jazz.file1.loop();
  //jazz.file2.loop();
  //jazz.file3.loop();
  
  //Different way to fill and draw shapes from classes
  //squareArr=new ArrayList<Square>();
  //squiglyArr=new ArrayList<Squigly>();
  //triangleArr=new ArrayList<Triangle>();
  
  //  for (int i = 0; i < 4; i++) 
  //  {
  //  squareArr.add(new Square(0));
  //  squiglyArr.add(new Squigly(0));
  //  triangleArr.add(new Triangle(0));
  //}
   
    triangle=new Triangle(0); 
    squigly= new Squigly(0);
    square= new Square(0);
    
}

void draw() {
  
  //Image being grabbed from kinect
  //image(kinect.getColorImage(), 0, 0, width, height);
  //pushMatrix();
  //scale(3.8);
  //image(kinect.getDepthMaskImage(), 0, 0);
  //popMatrix();

  //lines in thirds for debugging
  //line(vert1,height,vert1,0);
  //line(vert2,height,vert2,0);

  //Thirds
  //gradient.linear(0,vert1,height*2, col1, col3); 
  //gradient.linear(vert1,vert2,height*2, col3, col1); 
  //gradient.linear(vert2,width*2,height*2, col1, col3);
  
  //Quads
  //gradient.linear(0,quad1,height*2, col1, col3); 
  //gradient.linear(quad1,quad2,height*2, col3, col1); 
  //gradient.linear(quad2,quad3,height*2, col1, col3); 
  //gradient.linear(quad3,width,height*2, col3, col1);

  //Single Quad
  //gradient.quad(width*2,height*2,col1,col3,col1,col1);
  
  //Radial gradient
  gradient.radial(width*3,height*3,col1,col3,100);

  pushMatrix();
  pushStyle();
  stroke(0,0,255);
  translate(width/2, height/2, 0);
  scale(zVal);
  rotateX(rotX);
  SkullyBoi();
  popStyle();
  popMatrix();

  //SkullyBoi();

  //for (Square squar : squareArr) 
  //{
  //    squar.display(200,200);    
  //    squar.display(200,700);         
  //    squar.display(1600,150);    
  //    squar.display(1300,550);    
  //} 
    square.display(200,200);    
    square.display(200,700);         
    square.display(1600,150);    
    square.display(1300,550);   
    
    squigly.display(600,400);
    squigly.display(600,1000);
    squigly.display(1000,400);
    squigly.display(800,700);

    triangle.display(900,300);
    triangle.display(900,800);
    triangle.display(1400,400);
    triangle.display(1300,300);   

  //fill(0, 0, 0);
  //text(frameRate, 50, 50);
}


void SkullyBoi()
{
   ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();   
   //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      float xSetter=getJointX(joints,KinectPV2.JointType_SpineMid);
       // println(xSetter);
        //println(1);
       
       for (int j=0; j<bool.length; j++)
       {
         bool[j]=false;
       }

        //Checking what third the skeloten is in
        if(xSetter>.24 && bool[2]==false)
        {                            
             bool[2]=true;          
             drawTriangleBoi(joints);
             limbtracker.update2(joints);
             //filling second PVector with the first PVectors values
             limbtracker.fillFollowing(KinectPV2.JointType_Count);       
             //Doing a comparison of the two
             float[] comparison=limbtracker.distance(KinectPV2.JointType_Count);
             limbtracker.fillBuffer(comparison);
             
              if (limbtracker.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                jazz.P1.play();
              }
              
              if(limbtracker.limbFlailing(KinectPV2.JointType_HandLeft))
              {
                triangle.RotateY(.01);            
              }               
                
              if (limbtracker.limbActivated(KinectPV2.JointType_HandRight)) 
              {            
                jazz.P2.play();   
                triangle.RotateX(.4);               
              }
              
              if (limbtracker.limbActivated(KinectPV2.JointType_FootRight)) 
              {            
                jazz.P3.play();
                triangle.RandomColor();
               
              }
                    
              if (limbtracker.limbActivated(KinectPV2.JointType_FootLeft)) 
              {            
                jazz.P4.play();
               }            
       }
                                  
       else if(xSetter<.24 && xSetter>-.52 && bool[1]==false)
        {          
             bool[1]=true;
          
             limbtracker2.update2(joints);
             limbtracker2.fillFollowing(KinectPV2.JointType_Count);
  
             //Doing a comparison of the two
             float[] comparison2=limbtracker2.distance(KinectPV2.JointType_Count);
             limbtracker2.fillBuffer(comparison2);
           
              if (limbtracker2.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                jazz.B1.play();
              }
              
              if(limbtracker2.limbFlailing(KinectPV2.JointType_HandLeft))
              {
                squigly.RotateY(.01);
              
              }               
                
             if (limbtracker2.limbActivated(KinectPV2.JointType_HandRight)) 
              {            
                jazz.B2.play();   
                squigly.RotateX(.4);              
              }
              
              if (limbtracker2.limbActivated(KinectPV2.JointType_FootRight)) 
              {            
                jazz.B3.play();
                squigly.RandomColor();
               
              }
                    
              if (limbtracker2.limbActivated(KinectPV2.JointType_FootLeft)) 
              {            
                jazz.B4.play();
                squigly.RandomStroke();
              }
                                        
        }
        
        else if(xSetter<-.52 && bool[0]==false)
        {       
           //spot[j]="Left";
           //println(4);                  
             bool[0]=true;
             drawSquareBoi(joints);
             limbtracker3.update2(joints);       
             ////Doing a comparison of the two
             float[] comparison3=limbtracker3.distance(KinectPV2.JointType_Count);
             limbtracker3.fillBuffer(comparison3);          
             
               if (limbtracker3.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                jazz.D1.play();
              }
              
              if(limbtracker3.limbFlailing(KinectPV2.JointType_HandLeft))
              {
                square.RotateY(.01);
              
              }               
                
              if (limbtracker3.limbActivated(KinectPV2.JointType_HandRight)) 
              {            
                jazz.D2.play();   
                square.RotateX(.4);
               
              }
              
              if (limbtracker3.limbActivated(KinectPV2.JointType_FootRight)) 
              {            
                jazz.D3.play();
                square.RandomColor();
               
              }
                    
              if (limbtracker3.limbActivated(KinectPV2.JointType_FootLeft)) 
              {            
                jazz.D4.play();
                square.RandomStroke();
              }                                               
          }
        }      
       //drawBody(joints);  
       //text(skeletonArray.size(), 100,100);
       //text(spot,150,150);
    }       
  
}

void drawSquiglyBoi(KJoint[] joints)
{
  
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints,  KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_HipRight,KinectPV2.JointType_KneeLeft);
  drawBone(joints,KinectPV2.JointType_KneeLeft,KinectPV2.JointType_FootRight );
  
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_ShoulderRight);
  drawBone(joints,  KinectPV2.JointType_ShoulderRight,KinectPV2.JointType_HipLeft);
  drawBone(joints, KinectPV2.JointType_HipLeft,KinectPV2.JointType_KneeRight);
  drawBone(joints,KinectPV2.JointType_KneeRight,KinectPV2.JointType_FootLeft);
  
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowLeft); 
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowRight); 
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  
}

void drawTriangleBoi(KJoint[] joints)
{
  //drawBone(joints, KinectPV2.JointType_Head,KinectPV2.JointType_FootRight );
  //drawBone(joints, KinectPV2.JointType_Head,KinectPV2.JointType_FootLeft );
  
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ShoulderRight);
  
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ShoulderRight);
  
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_ThumbRight);
  drawBone(joints, KinectPV2.JointType_ThumbRight, KinectPV2.JointType_HandTipRight);
  
  
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ShoulderLeft);
  
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_ThumbLeft);
  drawBone(joints, KinectPV2.JointType_ThumbLeft, KinectPV2.JointType_HandTipLeft);
  
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_HipLeft);
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_HipLeft);
  
  
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);
  drawBone(joints, KinectPV2.JointType_FootRight, KinectPV2.JointType_KneeRight);

  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);
  drawBone(joints, KinectPV2.JointType_FootLeft, KinectPV2.JointType_KneeLeft);
  
}

void drawSquareBoi(KJoint[] joints)
{
  drawBone(joints, KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_HipLeft);
  drawBone(joints, KinectPV2.JointType_ShoulderRight,KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_HipRight,KinectPV2.JointType_HipLeft );
  
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_SpineMid);

  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_SpineMid);

  drawBone(joints, KinectPV2.JointType_HipRight,KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_HipLeft,KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeRight,KinectPV2.JointType_KneeLeft);

  drawBone(joints, KinectPV2.JointType_KneeRight,KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_KneeLeft,KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft,KinectPV2.JointType_AnkleRight);

}

//DRAW BODY
void drawBody(KJoint[] joints) {
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

//draw joint
//void drawJoint(KJoint[] joints, int jointType) {
//  pushMatrix();
//  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
//  ellipse(0, 0, 25, 25);
//  popMatrix();
//}

////draw bone
//void drawBone(KJoint[] joints, int jointType1, int jointType2) {
//  pushMatrix();
//  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
//  ellipse(0, 0, 25, 25);
//  popMatrix();
//  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
//}


void drawJoint(KJoint[] joints, int jointType) {
  //strokeWeight(2.0f + joints[jointType].getZ()*8);
  pushStyle();
  strokeWeight(.05);   
  popStyle();
  //float xMapped = map(joints[jointType].getX(), -1.28, 1, 0, width);
  //float yMapped = map(joints[jointType].getY(), -0.3, 0.07, 0, height);
  //float zMapped = map(joints[jointType].getZ(), 1, 8, 0, height*2);
  //point(xMapped, yMapped, zMapped);
  //println(xMapped);
  point(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
}

void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  //strokeWeight(2.0f + joints[jointType1].getZ()*8);
  
  //float xMapped = map(joints[jointType1].getX(), -1.28, 1, 0, width);
  //float yMapped = map(joints[jointType1].getY(), -0.3, 0.07, 0, height);
  //float zMapped = map(joints[jointType1].getZ(), 1, 8, 0, height*2);
  pushStyle();
  strokeWeight(.01);  
  popStyle();
 
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(),joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  
  //point(joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  
 // line(xMapped,yMapped,zMapped,xMapped2,yMapped2, zMapped2);

}

//Gets an X value of a joint.
float getJointX(KJoint[] joints, int jointType)
{
    return (joints[jointType].getX());
}
