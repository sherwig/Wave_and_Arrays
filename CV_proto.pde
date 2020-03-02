import KinectPV2.KJoint;
import KinectPV2.*;
float rightHandX=0;
float[] temp=new float[8];
String[] spot= new String [8];
float vert1, vert2;
Limbtracker limbtracker;
Limbtracker limbtracker2; 
Limbtracker limbtracker3;
float[][] positions=new float[3][25];
float[][] positions2=new float[3][25];
float[][] positions3=new float[3][25];
//FloatList[][] inventory= new FloatList[3][25];
KinectPV2 kinect;
ArrayList<Circle> circles = new ArrayList<Circle>();
float mx;
float my;
float speed = 0.05;
PShape square;
float topLeft=0;
float bottomLeft=300;
float topRight=0;
float bottomRight=300;
float a=0.0;
float s=0.0;
boolean flag1=true;
boolean flag2=true;
boolean flag3=true;


void setup() {
  size(1920, 1080, P3D);
  colorMode(HSB);
  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.enableSkeleton3DMap(true);

  kinect.init();
  
  square = createShape(RECT,topLeft,topRight, bottomLeft, bottomRight);
  square.setStroke(255);
  square.setFill(0);
    
  limbtracker= new Limbtracker(25);
  // positions = new PVector[7];
   //for( int i=0; i != 7; i++) 
   // {
   //   positions[i]=new PVector(0,0,0);  
   // }
}

void draw() {
  background(0);
  vert1=width/3; 
  vert2=vert1*2; 
  //fill(0,0,255);
  line(vert1,height,vert1,0);
  line(vert2,height,vert2,0);
  
  noFill();
  shape(square, 800, 400);

  //image(kinect.getColorImage(), 0, 0, width, height);
  //pushMatrix();
  //scale(7);
  //image(img,0,0);
  //popMatrix();
  
  //Lessgo
  SkullyBoi();


  circles.add(new Circle(mx, my));

  for (int i=0; i<circles.size(); i++) 
  {
    Circle c = circles.get(i);
    c.display();
    c.update();
    
    if (c.isDone()) circles.remove(c);
  }

  //fill(0, 0, 0);
  //text(frameRate, 50, 50);
}


void SkullyBoi()
{
   ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
  //println(skeletonArray.size());
  
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {

      KJoint[] joints = skeleton.getJoints();
             
       //gets an x value of the whole skeloten
       temp[i]=getJointX(joints,KinectPV2.JointType_SpineMid);
       // println(temp);
        println(1);
       
       //Getting three float arrays of all positions of the skelotens
       //float[i][0] xPos=getSkeletonX(joints);
       //float[i][1] yPos=getSkeletonY(joints);
       //float[i][2] zPos=getSkeletonZ(joints);
  
       //for(int k=0; k<KinectPV2.JointType_Count; k++)
       //{
       //  positions[i].set(xPos[k],yPos[k],zPos[k]); 
       //}
       //float [] xPos2=positions.x.array();
   
    // println(comparison);
     
      for (int j=0; j<temp.length; j++)
      {       
        //Checking what third the skeloten is in
        if(temp[j]>vert2)
        {
           spot[j]="right";
           println(2);
           float[] xPos=getSkeletonX(joints);
           float[] yPos=getSkeletonY(joints);
           float[] zPos=getSkeletonZ(joints);
           positions=limbtracker.getPositions(xPos,yPos,zPos);
           
           limbtracker.update(positions);
       
           //filling second PVector with the first PVectors values
           limbtracker.fillFollowing(KinectPV2.JointType_Count);
       
           //Doing a comparison of the two
           float[] comparison=limbtracker.distance(KinectPV2.JointType_Count);
           limbtracker.fillBuffer(comparison[KinectPV2.JointType_HandLeft]);
           float right1=limbtracker.bufferVariance();
           
           if (right1>400 && flag2==true) 
           {
             flag2=false;
            // square.scale(.95);
             square.rotateY(0.1);  
             square.rotateX(0.1);  
           }          
            else if(right1<=400)
            {
              flag2=true;
            }          
        }
         else if(temp[j]<vert2 && temp[j]>vert1)
        {
           spot[j]="middle";    
           println(3);
           //Filling the limbtracker PVector with all the points
           float[] xPos=getSkeletonX(joints);
           float[] yPos=getSkeletonY(joints);
           float[] zPos=getSkeletonZ(joints);
           println(xPos.length);
           println("here");
      
           positions2=limbtracker2.getPositions(xPos,yPos,zPos);
           println(positions2);
           limbtracker2.update(positions2);
       
           //Doing a comparison of the two
           float[] comparison2=limbtracker2.distance(KinectPV2.JointType_Count);
           limbtracker2.fillBuffer(comparison2[KinectPV2.JointType_HandLeft]);
           float center1=limbtracker2.bufferVariance();
            
           // mx+=(joints[KinectPV2.JointType_HandRight].getX()-mx)*speed;
           // my+=(joints[KinectPV2.JointType_HandRight].getY()-my)*speed;
           // circles.add(new Circle(mx, my));     
            
           //leftHandX+=(joints[KinectPV2.JointType_HandLeft].getX()-leftHandX)*speed;
           //leftHandY+=(joints[KinectPV2.JointType_HandLeft].getY()-leftHandY)*speed;
           //leftHandZ+=(joints[KinectPV2.JointType_HandLeft].getZ()-leftHandZ)*speed;
           
           //println(joints[KinectPV2.JointType_HandLeft]);
           
           //filling buffer with what we found from the comparison from earlier. One problem I am having is
           //I know longer can just call the joint type, but rather have to figure out which joint is where 
           //in the comparison array. 
           // bufferCenter.update(comparison[KinectPV2.JointType_HandLeft]);
          
           
           //float center1=bufferCenter.variance();
           
           //bufferLeftHandCenter.update(leftHandX);
                               
           //float varianceRightHand=bufferRightHandCenter.variance();
           
           //println(center1);            
           fill(255); 
           textSize(32);
           text(center1,50,50);
           text(str(flag1),50,100);
           //float stroke=1;

            if (center1>400 && flag1==true) 
            {
              a=a+.3;       
              s=cos(a)*2;
             //println(s);
              square.scale(s);
             
              flag1=false;
            }
            
     
            else if(center1<=400)
            {
          
              flag1=true;
            }
                                        
        }
        
        else if(temp[j]<vert1)
        {       
            spot[j]="Left"; 
     
           float[] xPos=getSkeletonX(joints);
           float[] yPos=getSkeletonY(joints);
           float[] zPos=getSkeletonZ(joints);
           positions3=limbtracker3.getPositions(xPos,yPos,zPos);
           
           limbtracker3.update(positions3);
       
           //Doing a comparison of the two
           float[] comparison3=limbtracker3.distance(KinectPV2.JointType_Count);
           limbtracker3.fillBuffer(comparison3[KinectPV2.JointType_HandLeft]);
           float left1=limbtracker3.bufferVariance();
           
           if (left1>400 && flag3==true) 
           {
             flag3=false;
             square.setFill(color(random(0,127),random(127,255),random(127,255)));
           }          
            else if(left1<=400)
            {
              flag3=true;
            }      
        }
        
    }
      
      drawBody(joints);     
       //text(skeletonArray.size(), 100,100);
       //text(spot,150,150);

    }
    
  }
  
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
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

//Gets an X value of a joint.
float getJointX(KJoint[] joints, int jointType)
{
     return (joints[jointType].getX());
}

float[] getSkeletonX(KJoint[] joints3D) {
    int joints_number = 25;
    float[] x_values = new float[joints_number];
// For every joints, get the x value, store it in an array 
     for(int i = 0; i < joints_number; i++) {
        x_values[i] = joints3D[i].getX();
      }
      return x_values;
  }
  
  float[] getSkeletonY(KJoint[] joints3D) {
    int joints_number = 25;
    float[] y_values = new float[joints_number];
// For every joints, get the y value, store it in an array 
     for(int i = 0; i < joints_number; i++) {
        y_values[i] = joints3D[i].getZ();
      }
      return y_values;
  }

 float[] getSkeletonZ(KJoint[] joints3D) {
    int joints_number = 25;
    float[] z_values = new float[joints_number];
// For every joints, get the z value, store it in an array 
     for(int i = 0; i < joints_number; i++) {
        z_values[i] = joints3D[i].getZ();
      }
      return z_values;
  }

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}

/*
Different hand state
 KinectPV2.HandState_Open
 KinectPV2.HandState_Closed
 KinectPV2.HandState_Lasso
 KinectPV2.HandState_NotTracked
 */
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}


class Circle {
  float x, y;
  float d;
  float hue;
  
  Circle(float _x, float _y) {
    x = _x;
    y = _y;
    d = 100;
    hue = 120;
  }

  void display () {
    //fill(hue, 255, 255);
    rectMode(CENTER);
    noFill();
    stroke(hue, 255, 255);
    rect(x-(hue/100), y-(hue/100), d-(hue/100), d-(hue/100));
  }

  void update() {
    float diam=0;
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
    for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) 
    {
      KJoint[] joints = skeleton.getJoints();
     
      temp[i]=getJointX(joints,i);
      
      for (int j=0; j<temp.length;j++)
      {
        if(temp[j]>vert2)
        {
  
          diam = map(joints[KinectPV2.JointType_HandRight].getX(), vert1, width, 1, 10);
         // println(diam);
          
        }
          else if(temp[j]<vert1)
        {

         // println(diam);
          
        }
      }
      
    }
    }
     hue += 1;
     d -= diam;
  
  }
  
  boolean isDone() {
  if (hue == 255) return true;
  else return false;
  }
}
