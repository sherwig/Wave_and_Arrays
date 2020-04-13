import KinectPV2.KJoint;
import KinectPV2.*;
import java.util.ArrayList;
int vert1, vert2;
Limbtracker limbtracker;
Limbtracker limbtracker2;
Limbtracker limbtracker3;
Boolean[] zoneSetter=new Boolean[3];
KinectPV2 kinect;
Jazz jazz;
float threshold=.5;
float zVal = 950;
float rotX = PI;
ArrayList <Square> squareArr;
ArrayList <Square2> squareArr2;
ArrayList <Squigly> squiglyArr;
ArrayList <Squigly2> squiglyArr2;
ArrayList <Triangle> triangleArr;
ArrayList <Triangle2> triangleArr2;
color col1=color(255,251,157,3);
//color col2=color(221,160,221);
color col2=color(0,0,255);
color col3=color(255,127,80,3);
int col3R=255;
int col3B=251;
int col3G=157;
int col1R=213;
int col1B=23;
int col1G=157;
Gradients gradient;
float quad1,quad2,quad3;
int zoneCounter=0;
boolean offsetShapes=false;
float offsetAmountNeg=-100;
float offsetAmountPos=100;
float maxOffset=2;
float minOffset=1;

void setup() {
    size(1920, 1080, P3D);
    colorMode(RGB);
    kinect = new KinectPV2(this);
  
    //kinect.enableSkeletonColorMap(true);
    //kinect.enableColorImg(true);
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
    jazz.file1.loop();
    jazz.file2.loop();
    jazz.file3.loop();
  
    //Different way to fill and draw shapes from classes
    squareArr=new ArrayList<Square>();
    squiglyArr=new ArrayList<Squigly>();
    triangleArr=new ArrayList<Triangle>();
    triangleArr2=new ArrayList<Triangle2>();
    squiglyArr2=new ArrayList<Squigly2>();
    squareArr2=new ArrayList<Square2>();

      
squareArr.add(new Square(0,200,200));
    squareArr2.add(new Square2(20,200,200));
    squareArr.add(new Square(0,200,700));
    squareArr2.add(new Square2(20,200,700));
    squareArr.add(new Square(0,1600,150));
    squareArr2.add(new Square2(20,1600,150));
    squareArr.add(new Square(0,1300,550));
    squareArr2.add(new Square2(20,1300,550));

    //squareArr.add(new Square(0,600,450));
    //squareArr.add(new Square(0,1000,750));
           
    squiglyArr.add(new Squigly(0,600,400));
    squiglyArr2.add(new Squigly2(20,600,400));
    squiglyArr.add(new Squigly(0,600,1000));
    squiglyArr2.add(new Squigly2(20,600,1000));
    squiglyArr.add(new Squigly(0,1000,400));    
    squiglyArr2.add(new Squigly2(20,1000,400));
    squiglyArr.add(new Squigly(0,800,700));
    squiglyArr2.add(new Squigly2(20,800,700));

    //squiglyArr.add(new Squigly(0,1500,800));
    //squiglyArr.add(new Squigly(0,300,700));
             
    triangleArr.add(new Triangle(0,900,300));
    triangleArr2.add(new Triangle2(10,900,300));
    triangleArr.add(new Triangle(0,900,800));
    triangleArr2.add(new Triangle2(10,900,800));
    triangleArr.add(new Triangle(0,1400,400));
    triangleArr2.add(new Triangle2(10,1400,400));
    triangleArr.add(new Triangle(0,1300,900)); 
    triangleArr2.add(new Triangle2(10,1300,900));
    
    
    
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

  for (Square squar : squareArr) 
  {
     squar.display();
  } 
  
  for (Triangle tri : triangleArr) 
  {
     tri.display();
  }     
  
  for (Squigly squig : squiglyArr) 
  {
     squig.display();
  } 
  
  jazz.file1.amp(0.1);
  jazz.file3.amp(0.1);
  jazz.file2.amp(0.2);
  //initialize volume levels Bass
  jazz.B1.amp(jazz.bamp);
  jazz.B2.amp(jazz.bamp);
  jazz.B3.amp(jazz.bamp);
  jazz.B4.amp(jazz.bamp);
  jazz.B5.amp(jazz.bamp);
    //fill(0, 0, 0);
    //text(frameRate, 50, 50);
}

void SkullyBoi()
{
   setNonActive();  
   ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();   
   //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();  
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      float xSetter=getJointX(joints,KinectPV2.JointType_SpineMid);
       // println(xSetter);    
       col3=color(255,127,80,100);
       col1=color(255,251,157,100);
       //println(zoneSetter);       
                 
        //Checking what third the skeloten is in
        if(xSetter>.24 && zoneSetter[2]==false)
        {                            
             zoneSetter[2]=true;    
             for (Triangle tri : triangleArr) 
             {
                tri.setColor(tri.r,tri.g,tri.b,tri.alpha);
             }                  
             //drawTriangleBoi(joints);
             limbtracker.update2(joints);
             //filling second PVector with the first PVectors values
             limbtracker.fillFollowing(KinectPV2.JointType_Count);       
             float[] comparison=limbtracker.distance(KinectPV2.JointType_Count);
             limbtracker.fillBuffer(comparison);
             
              if (limbtracker.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                 jazz.P1.play();
                 for (Triangle tri : triangleArr) 
                 {
                    tri.changePosition(offsetAmountNeg,offsetAmountPos);
                 } 
                 if(offsetShapes) 
                 {
                   for (Triangle2 tri : triangleArr2) 
                   {
                     tri.changePosition(offsetAmountNeg,offsetAmountPos);
                   }          
              }
              
              if(limbtracker.limbFlailing(KinectPV2.JointType_HandLeft))
              {
                for (Triangle tri : triangleArr) 
                {
                 tri.changeScale(true,maxOffset,minOffset);
                }   
                if(offsetShapes) 
                {
                   for (Triangle2 tri : triangleArr2) 
                   {
                     tri.changeScale(true,maxOffset,minOffset);
                   }          
                }
              } 
              
              else
              {
                for (Triangle tri : triangleArr) 
                {
                  tri.changeScale(false,maxOffset,minOffset);
                }
                
                if(offsetShapes) 
                {
                   for (Triangle2 tri : triangleArr2) 
                   {
                     tri.changeScale(false,maxOffset,minOffset);
                   }          
                }
              }
                
              if (limbtracker.limbActivated(KinectPV2.JointType_HandRight)) 
              {            
                jazz.P2.play();  
                for (Triangle tri : triangleArr) 
                {
                  tri.changeRotation();
                }
               
               if(offsetShapes) 
               {
                 for (Triangle2 tri : triangleArr2) 
                 {
                   tri.changeRotation();
                 } 
               }
                              
              }
              
              if (limbtracker.limbActivated(KinectPV2.JointType_KneeRight)) 
              {      
                //for (Triangle tri : triangleArr) 
                //{
                //  tri.changeOpacity(5);
                //}
                  jazz.P3.play();
             
              }
                    
              if (limbtracker.limbActivated(KinectPV2.JointType_KneeLeft)) 
              {            
                jazz.P4.play();
               }            
         }
       
       else if(xSetter<.24 && xSetter>-.52 && zoneSetter[1]==false)
        {          
             zoneSetter[1]=true;
             for (Squigly squig : squiglyArr) 
             {
               squig.setColor(squig.r,squig.g,squig.b,squig.alpha); 
             }           
         
             limbtracker2.update2(joints);
             limbtracker2.fillFollowing(KinectPV2.JointType_Count);
             //drawSquiglyBoi(joints);
             float[] comparison2=limbtracker2.distance(KinectPV2.JointType_Count);
             limbtracker2.fillBuffer(comparison2);
             
              if (limbtracker2.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                 jazz.B1.play();
                 jazz.B1.amp(jazz.bampc);
                 jazz.B1.rate(jazz.p5Rate);//relating note by 5th
                 jazz.file1.amp(jazz.scamp);
                 jazz.file2.amp(jazz.scamp);
                 jazz.file3.amp(jazz.scamp);  
                //squigly.changeSizePositive(2);
               for (Squigly squig : squiglyArr) 
                 {
                   squig.changePosition(offsetAmountNeg,offsetAmountPos);
                 } 
                 if(offsetShapes) 
                 {
                   for (Squigly2 squig : squiglyArr2) 
                   {
                     squig.changePosition(offsetAmountNeg,offsetAmountPos);
                   }          
                 }                          
              }
                           
              if(limbtracker2.limbFlailing(KinectPV2.JointType_HandLeft))
              {
               // squigly.RotateX(.01);
              for (Squigly squig : squiglyArr) 
               {
                 squig.changeScale(true,maxOffset,minOffset);
               } 
                 if(offsetShapes) 
                 {
                   for (Squigly2 squig : squiglyArr2) 
                   {
                     squig.changeScale(true,maxOffset,minOffset);
                   }          
                 }       
              } 
              
              else
              {
               for (Squigly squig : squiglyArr) 
               {
                 squig.changeScale(false,maxOffset,minOffset);
               } 
                 if(offsetShapes) 
                 {
                   for (Squigly2 squig : squiglyArr2) 
                   {
                     squig.changeScale(false,maxOffset,minOffset);
                   }          
                 }
               
              }
                
             if (limbtracker2.limbActivated(KinectPV2.JointType_KneeRight)) 
              {            
                  jazz.B2.play();
                  jazz.B2.amp(jazz.bampc);
                  jazz.B2.rate(jazz.p5Rate);//relating note by 5th
                  jazz.file1.amp(jazz.scamp);
                  jazz.file2.amp(jazz.scamp);
                  jazz.file3.amp(jazz.scamp);                 
                
                for (Squigly squig : squiglyArr) 
                {
                   squig.changeRotation(); 
                }      
                
                if(offsetShapes) 
                 {
                   for (Squigly2 squig : squiglyArr2) 
                   {
                     squig.changeRotation();
                   }          
                 }
              }
              
              if (limbtracker2.limbActivated(KinectPV2.JointType_KneeLeft)) 
              {            
                jazz.B3.play();
                jazz.B3.amp(jazz.bampc);
                jazz.B3.rate(jazz.p5Rate);//relating note by 5th
                jazz.file1.amp(jazz.scamp);
                jazz.file2.amp(jazz.scamp);
                jazz.file3.amp(jazz.scamp);                 
                //for (Squigly squig : squiglyArr) 
                //{
                //   squig.changeOpacity(5); 
                //}   
                //squigly.RandomColor();               
              }
                    
              if (limbtracker2.limbActivated(KinectPV2.JointType_FootLeft)) 
              {            
                jazz.B4.play();
                jazz.B4.amp(jazz.bampc);
                jazz.B4.rate(jazz.p5Rate);//relating note by 5th
                jazz.file1.amp(jazz.scamp);
                jazz.file2.amp(jazz.scamp);
                jazz.file3.amp(jazz.scamp);                
              }                                       
        }
        
        else if(xSetter<-.52 && zoneSetter[0]==false)
        {       
             //println(4);                  
             zoneSetter[0]=true;
             for (Square squar : squareArr) 
             {
               squar.setColor(squar.r,squar.g,squar.b,squar.alpha);
             }             
             //drawSquareBoi(joints);
             limbtracker3.update2(joints);                    
             float[] comparison3=limbtracker3.distance(KinectPV2.JointType_Count);
             limbtracker3.fillBuffer(comparison3);          
             
              if (limbtracker3.limbActivated(KinectPV2.JointType_HandLeft)) 
              {              
                 jazz.D1.play();
                 for (Square squar : squareArr) 
                 {
                   squar.changePosition(offsetAmountNeg,offsetAmountPos);
                 }  
                  if(offsetShapes) 
                   {
                     for (Square2 squar : squareArr2) 
                     {
                       squar.changePosition(offsetAmountNeg,offsetAmountPos);
                     }          
                   }
              }
              
              if(limbtracker3.limbFlailing(KinectPV2.JointType_HandLeft))
              {
                  for (Square squar : squareArr) 
                   {
                     squar.changeScale(true,maxOffset,minOffset);
                   } 
                    if(offsetShapes) 
                     {
                       for (Square2 squar : squareArr2) 
                       {
                         squar.changeScale(true,maxOffset,minOffset);
                       }          
                     }
              }      
              
              else 
              {
                for (Square squar : squareArr) 
                   {
                     squar.changeScale(false,maxOffset,minOffset);
                   } 
                    if(offsetShapes) 
                     {
                       for (Square2 squar : squareArr2) 
                       {
                         squar.changeScale(false,maxOffset,minOffset);
                       }          
                     }
              }
                
              if (limbtracker3.limbActivated(KinectPV2.JointType_HandRight)) 
              {            
                jazz.D2.play();
                for (Square squar : squareArr) 
                 {
                   squar.changeRotation();
                 }                
              }
              
              if (limbtracker3.limbActivated(KinectPV2.JointType_KneeRight)) 
              {            
                jazz.D3.play();
                for (Square squar : squareArr) 
                 {
                   squar.changeRotation();
                 } 
                   if(offsetShapes) 
                   {
                     for (Square2 squar : squareArr2) 
                     {
                       squar.changeRotation();
                     }          
                   }
              }
                    
              if (limbtracker3.limbActivated(KinectPV2.JointType_KneeLeft)) 
              {            
                jazz.D4.play();
                //square.RandomStroke();
              }                                               
          }
        }      
       //drawBody(joints);  
       //text(skeletonArray.size(), 100,100);
       //text(spot,150,150);
    }       
  
  }
}

void setNonActive()
{
  for (int j=0; j<zoneSetter.length; j++)
       {
         zoneSetter[j]=false;
       }       
         if (zoneSetter[2]==false)
         {     
          for (Triangle tri : triangleArr) 
          {
             tri.setColor(128,128,128,150);
          }            
         }         
        
         if (zoneSetter[1]==false)
         {           
          for (Squigly squig : squiglyArr) 
          {
             squig.setColor(128,128,128,150); 
          }       
         }  
           
         if (zoneSetter[0]==false)
         {
          for (Square squar : squareArr) 
          {
           squar.setColor(128,128,128,150);
          }           
         }           
          for (int i=0; i<zoneSetter.length; i++) 
         {
           if(zoneSetter[i]==true)
           {
             //col3=color(255,127,80,100);
             //col1=color(sliderValue,251,157,100);
             col3=color(col3R,col3G,col3B,50);
             col1=color(col1R,col1G,col1B,50);
             zoneCounter++;
             //println( zoneCounter);
             
           }
           else 
           {
             zoneCounter=0;
             col1=color(255,251,157,3);
             col3=color(255,127,80,3);
             offsetShapes=false;
           }
         }
         
         if(zoneCounter>=2 && zoneCounter<3)
         {
           println("here");
           col3=color(col3R,col3G,col3B,100);
           col1=color(col1R,col1G,col1B,100);
         }
         
         else if(zoneCounter>=3)
         {
           offsetShapes=true;
           float x= getSinScale(160,40,600);
           col3G=int(x);
           float y= getSinScale(300,30,600);
           col1R=int(y);
           //println(col1R);
           col3=color(col3R,col3G,col3B,125);
           col1=color(col1R,col1G,col1B,125);
           
            //println("here");
            for (Triangle2 tri : triangleArr2) 
            {
               tri.display();
            }    
            
            for (Squigly2 squig : squiglyArr2) 
            {
               squig.display();
            }    
            
            for (Square2 squar : squareArr2) 
            {
               squar.display();
            }   
         }
  
}


float getSinScale(float high, float low, float period)
{
     float amplitude=high-low;
     float x = (amplitude-low)+(amplitude-high) * cos(TWO_PI * frameCount / period);
     x=abs(x);
     return x;
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
    
}

//Gets an X value of a joint.
float getJointX(KJoint[] joints, int jointType)
{
    return (joints[jointType].getX());
}
