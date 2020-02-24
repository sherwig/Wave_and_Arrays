
import KinectPV2.KJoint;
import KinectPV2.*;
float rightHandX=0;
float[] temp=new float[8];
String[] spot= new String [8];
float vert1, vert2;
FloatBuffer bufferRightHandCenter= new FloatBuffer(30);
FloatBuffer bufferLeftHandCenter= new FloatBuffer(30);
FloatBuffer bufferLeftHandCenter2= new FloatBuffer(30);
FloatBuffer bufferLeftHandCenter3= new FloatBuffer(30);
FloatBuffer bufferCenterHead= new FloatBuffer(30);
FloatBuffer bufferCenterHead2= new FloatBuffer(30);
KinectPV2 kinect;
ArrayList<Circle> circles = new ArrayList<Circle>();
float mx;
float my;
float leftHandX;
float leftHandY;
float leftHandZ;
float centerHeadX;
float centerHeadY;
float speed = 0.05;
PShape square;
float topLeft=0;
float bottomLeft=300;
float topRight=0;
float bottomRight=300;
float a=0.0;
float s=0.0;

void setup() {
  size(1920, 1080, P3D);
  colorMode(HSB);
  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init();
  
  
  square = createShape(RECT,topLeft,topRight, bottomLeft, bottomRight);
  square.setStroke(255);
  square.setFill(0);

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
     
      temp[i]=getJointX(joints,i);
       // println(temp);
       
      for (int j=0; j<temp.length; j++)
      {
        if(temp[j]>vert2)
        {
          spot[j]="right";
        }
         else if(temp[j]<vert2 && temp[j]>vert1)
        {
            spot[j]="middle";
            mx+=(joints[KinectPV2.JointType_HandRight].getX()-mx)*speed;
            my+=(joints[KinectPV2.JointType_HandRight].getY()-my)*speed;
            circles.add(new Circle(mx, my));     
            bufferRightHandCenter.update(mx);
            
           leftHandX+=(joints[KinectPV2.JointType_HandLeft].getX()-leftHandX)*speed;
           leftHandY+=(joints[KinectPV2.JointType_HandLeft].getY()-leftHandY)*speed;
           leftHandZ+=(joints[KinectPV2.JointType_HandLeft].getZ()-leftHandZ)*speed;
           leftHandZ+=(joints[KinectPV2.JointType_HandLeft].getZ()-leftHandZ)*speed;
           centerHeadX+=(joints[KinectPV2.JointType_Head].getX()-centerHeadX)*speed;
           centerHeadY+=(joints[KinectPV2.JointType_Head].getY()-centerHeadY)*speed;
           bufferLeftHandCenter.update(leftHandX);
           bufferLeftHandCenter2.update(leftHandY);
           bufferLeftHandCenter3.update(leftHandZ);
           bufferCenterHead.update(centerHeadX);
           bufferCenterHead2.update(centerHeadY);
           //float sum=bufferRightHandCenter.average();
           
           float varianceRightHand=bufferRightHandCenter.variance();
           float varianceLeftHand=bufferLeftHandCenter.variance();
           float varianceLeftHand2=bufferLeftHandCenter2.variance();
           float varianceLeftHand3=bufferLeftHandCenter3.variance();
           float varianceHead=bufferCenterHead.variance();
           float varianceHead2=bufferCenterHead2.variance();

           fill(255); 
           textSize(32);
           text( varianceHead,50,50);
           //float stroke=1;
            if ( varianceRightHand>400) 
            {
              square.setStroke(color(random(0,127),random(127,255),random(127,255)));
            }
            
           if ( varianceLeftHand>400) 
           {
             
            // square.scale(.95);
             square.rotateY(0.1);  
           }
           if ( varianceLeftHand2>400) 
           {
             
            // square.scale(.95);
             a=a+.3;       
             s=cos(a)*2;
             println(s);
             square.scale(s);
             
             square.rotateX(0.1);  
           }
            if ( varianceHead>200) 
           {                        
             square.setFill(color(random(0,127),random(127,255),random(127,255)));           
           }
           
           if ( varianceHead2>400) 
           {   
             //a=a+.004;       
             //s=cos(a)*2;
             //println(s);
             //square.scale(s);
             
            // square.scale(.95);
             //square.rotateZ(0.1);  
           }
           
           //if ( varianceLeftHand3>400) 
           //{
           //  println("Here");
           // // square.scale(.95);
           //  square.rotateZ(0.1);  
           //}
 

           
           // println(sum);
            
        }
         else if(temp[j]<vert1)
        {       
            spot[j]="Left";      
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

float getJointX(KJoint[] joints, int jointType)
{
     return (joints[jointType].getX());
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
