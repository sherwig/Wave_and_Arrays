import KinectPV2.KJoint;
import KinectPV2.*;
import java.util.ArrayList;
float rightHandX=0;
String[] spot= new String [8];
float[] temp=new float[7];      
float vert1, vert2;
Limbtracker limbtracker;
Limbtracker limbtracker2; 
Limbtracker limbtracker3;
Shapes shapes;
Boolean[] bool=new Boolean[3];
//FloatList[][] inventory= new FloatList[3][25];
KinectPV2 kinect;
//ArrayList<Circle> circles = new ArrayList<Circle>();
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
<<<<<<< HEAD
<<<<<<< HEAD
boolean flag1=true;
boolean flag2=true;
boolean flag3=true;

=======
>>>>>>> parent of bb7ded6... more updates
=======
float threshold=.5;
float zVal = 950;
float rotX = PI;
>>>>>>> 4f1b1016a07014b8439086b252f0fd6dddf69def

void setup() {
  size(1920, 1080, P3D);
  colorMode(RGB);
  kinect = new KinectPV2(this);

//  kinect.enableSkeletonColorMap(true);
//  kinect.enableColorImg(true);
  kinect.enableSkeleton3DMap(true);
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);

  kinect.init();
  
  square = createShape(RECT,topLeft,topRight, bottomLeft, bottomRight);
  square.setStroke(255);
    
  vert1=width/3; 
  vert2=vert1*2;

  limbtracker= new Limbtracker(25);
  limbtracker2= new Limbtracker(25);
  limbtracker3= new Limbtracker(25);
  shapes= new Shapes(0,0,0);
  
}

void draw() {
  background(0);

 // shape(square, 800, 400);
 
  //square.setFill(color(0,0,255));  
  //image(kinect.getColorImage(), 0, 0, width, height);
  //pushMatrix();
  //scale(3.8);
  //image(kinect.getDepthMaskImage(), 0, 0);
  //popMatrix();

  shapes.drawShapes();
  shapes.square.setFill(color(0,0,255));
  
  //translate the scene to the center 
  //  line(vert1,height,vert1,0);
  //line(vert2,height,vert2,0);
 
  pushMatrix();
  stroke(0,0,255);
  translate(width/2, height/2, 0);
  scale(zVal);
  rotateX(rotX);
  SkullyBoi();
  popMatrix();

  //SkullyBoi();


  //fill(0, 0, 0);
  //text(frameRate, 50, 50);
}


void SkullyBoi()
{
   ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();   
   //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();
  //println(skeletonArray.size());
  
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
<<<<<<< HEAD

      KJoint[] joints = skeleton.getJoints();
       
       //println(joints);
      temp[i]=getJointX(joints,i);
       // println(temp);
       
       //gets an x value of the whole skeloten
       temp[i]=getJointX(joints,12);
       // println(temp);
        println(1);
       
       //Getting three float arrays of all positions of the skelotens
<<<<<<< HEAD
       //float[i][0] xPos=getSkeletonX(joints);
       //float[i][1] yPos=getSkeletonY(joints);
       //float[i][2] zPos=getSkeletonZ(joints);
  
       //for(int k=0; k<KinectPV2.JointType_Count; k++)
       //{
       //  positions[i].set(xPos[k],yPos[k],zPos[k]); 
       //}
       //float [] xPos2=positions.x.array();
=======
       float[] xPos=getSkeletonX(joints);
       float[] yPos=getSkeletonY(joints);
       float[] zPos=getSkeletonZ(joints);
       
       //Filling the limbtracker PVector with all the points
       limbtracker.update(xPos,yPos,zPos);
       //filling second PVector with the first PVectors values
       limbtracker.fillFollowing(25);
       
       //Doing a comparison of the two
       float[] comparison=limbtracker.distance(25);
>>>>>>> parent of bb7ded6... more updates
   
     println(comparison);
      for (int j=0; j<temp.length; j++)
      {       
=======
    
     // println("Skully", skeletonArray.size());
      KJoint[] joints = skeleton.getJoints();       
       float xSetter=getJointX(joints,KinectPV2.JointType_SpineMid);
       // println(xSetter);
        //println(1);
       
       for (int j=0; j<bool.length; j++)
       {
         bool[j]=false;
       }
        
>>>>>>> 4f1b1016a07014b8439086b252f0fd6dddf69def
        //Checking what third the skeloten is in
        if(xSetter>.24)
        {       
           //spot[j]="right";
           println(2);
           
           bool[2]=true;
           if(bool[2]=true)
           {
             drawTriangleBoi(joints);
             limbtracker.update2(joints);
            // println(xPos);
             //filling second PVector with the first PVectors values
             limbtracker.fillFollowing(KinectPV2.JointType_Count);
         
             //Doing a comparison of the two
             float[] comparison=limbtracker.distance(KinectPV2.JointType_Count);
             limbtracker.fillBuffer(comparison[KinectPV2.JointType_HandLeft]);
             float right1=limbtracker.bufferVariance();
            
             if (right1>threshold && limbtracker.flag==true) 
             {
               limbtracker.flag=false;
              // shapes.triangle.rotateY(0.1);  
               shapes.triangle.rotateX(0.3);  
             }          
              else if(right1<=threshold)
              {
                limbtracker.flag=true;
              }          
        }
       }
        else if(xSetter<.24 && xSetter>-.52)
        {
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
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
           
           println(joints[KinectPV2.JointType_HandLeft]);
           bufferCenter.update(comparison[7]);
>>>>>>> parent of bb7ded6... more updates
           
           //filling buffer with what we found from the comparison from earlier. One problem I am having is
           //I know longer can just call the joint type, but rather have to figure out which joint is where 
           //in the comparison array. 
<<<<<<< HEAD
           // bufferCenter.update(comparison[KinectPV2.JointType_HandLeft]);
          
           
           //float center1=bufferCenter.variance();
           
           //bufferLeftHandCenter.update(leftHandX);
                               
           //float varianceRightHand=bufferRightHandCenter.variance();
           
           //println(center1);            
=======
           bufferCenter.update(comparison[1]);
           
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
           
           //finding the variance of the comparison. I am not sure if I still need to do this as 
           //the limbtracker comparison function I think does this for me. 
           float center1=bufferCenter.variance();
            //println(center1);

>>>>>>> parent of bb7ded6... more updates
           fill(255); 
           textSize(32);
           text(center1,50,50);
           //float stroke=1;
           
           //make a flag 
            if ( varianceRightHand>400) 
            {
<<<<<<< HEAD
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
                                        
=======
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
            // println(s);
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
             //square.scale(.95);
             //square.rotateZ(0.1);  
           }
           
           //if ( varianceLeftHand3>400) 
           //{
           //  println("Here");
           // // square.scale(.95);
           //  square.rotateZ(0.1);  
           //}    
           // println(sum);
            
>>>>>>> parent of bb7ded6... more updates
        }
         else if(temp[j]<vert1)
=======
           //spot[j]="middle";    
           println(3);           
          
           bool[1]=true;
           if(bool[1]=true)
           {
             drawSquiglyBoi(joints);          
             limbtracker2.update2(joints);
             limbtracker2.fillFollowing(KinectPV2.JointType_Count);
  
             //Doing a comparison of the two
             float[] comparison2=limbtracker2.distance(KinectPV2.JointType_Count);
             limbtracker2.fillBuffer(comparison2[KinectPV2.JointType_HandLeft]);
             float center1=limbtracker2.bufferVariance();
             //println(center1);
    
      
             //println(center1);            
             fill(255); 
             textSize(32);
             text(center1,50,50);
             //float stroke=1;
  
              if (center1>threshold && limbtracker2.flag==true) 
              {
                a=a+.3;       
                s=cos(a)*2;
               //println(s);
                square.scale(s);   
                shapes.squigly.scale(s);
                limbtracker2.flag=false;
              }
                  
              else if(center1<=threshold)
              {          
                limbtracker2.flag=true;
              }
           }                             
        }
        
        else if(xSetter<-.52)
>>>>>>> 4f1b1016a07014b8439086b252f0fd6dddf69def
        {       
           //spot[j]="Left";

           println(4);                  
           bool[0]=true;
           if(bool[0]=true)
           {
             drawSquareBoi(joints);
             limbtracker3.update2(joints);       
             ////Doing a comparison of the two
             float[] comparison3=limbtracker3.distance(KinectPV2.JointType_Count);
             limbtracker3.fillBuffer(comparison3[KinectPV2.JointType_HandRight]);
             float left1=limbtracker3.bufferVariance();
             println(left1);
             
             if (left1>.2 && limbtracker3.flag==true) 
             {
               limbtracker3.flag=false;
               shapes.square.setFill(color(random(0,127),random(127,255),random(127,255)));
             }          
              
              else if(left1<=threshold)
              {
                limbtracker3.flag=true;
              }   
          }
        }

      
          //drawBody(joints);  

       //text(skeletonArray.size(), 100,100);
       //text(spot,150,150);
    }       
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
  strokeWeight(.05);   
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
  //float xMapped2 = map(joints[jointType2].getX(), -1.28, 1, 0, width);
  //float yMapped2 = map(joints[jointType2].getY(), -0.3, 0.07, 0, height);
  //float zMapped2 = map(joints[jointType2].getZ(), 1, 8, 0, height*2);
 
  strokeWeight(.02);
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(),joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  
  //point(joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  
 // line(xMapped,yMapped,zMapped,xMapped2,yMapped2, zMapped2);

}

//Gets an X value of a joint.
float getJointX(KJoint[] joints, int jointType)
{
    return (joints[jointType].getX());
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
