import KinectPV2.KJoint; //<>//
import KinectPV2.*;
import java.util.ArrayList;
int vert1, vert2;
Limbtracker limbtracker;
Limbtracker limbtracker2;
Limbtracker limbtracker3;
Boolean[] zoneSetter = new Boolean[3];
KinectPV2 kinect;
Jazz jazz;
float threshold = .5;
float zVal = 950;
float rotX = PI;
ArrayList < Square > squareArr;
ArrayList < Square2 > squareArr2;
ArrayList < Squigly > squiglyArr;
ArrayList < Squigly2 > squiglyArr2;
ArrayList < Triangle > triangleArr;
ArrayList < Triangle2 > triangleArr2;
ArrayList < Background_Lines > backgroundArr;
color col1 = color(255, 251, 157, 50);
color col3 = color(255, 127, 80, 50);
int col1R = 255;
int col1B = 251;
int col1G = 157;
int col3R = 213;
int col3B = 23;
int col3G = 157;
int col1R2 = 226;
int col1B2 = 38;
int col1G2 = 104;
int col3R2 = 255;
int col3B2 = 255;
int col3G2 = 105;
//int col3R=255;
//int col3B=127;
//int col3G=80;
Gradients gradient;
float quad1, quad2, quad3;
int zoneCounter = 0;
boolean offsetShapes;
float offsetAmountNeg = -200;
float offsetAmountPos = 200;
float maxOffset = 3;
float minOffset = 1;
PImage[] dancer = new PImage[60];
int a = int(512 * .5), b = int(683 * .5);


void setup()
{
    size(1920, 1080, P3D);
    colorMode(RGB);
    kinect = new KinectPV2(this);
    frameRate(60);
    //kinect.enableSkeletonColorMap(true);
    //kinect.enableColorImg(true);
    kinect.enableSkeleton3DMap(true);
    kinect.enableDepthMaskImg(true);
    //kinect.enableSkeletonDepthMap(true);

    smooth();
    dancer[0] = loadImage("dancer0.gif");
    dancer[0].resize(a, b);
    dancer[1] = loadImage("dancer0.gif");
    dancer[1].resize(a, b);
    dancer[2] = loadImage("dancer0.gif");
    dancer[2].resize(a, b);
    dancer[3] = loadImage("dancer1.gif");
    dancer[3].resize(a, b);
    dancer[4] = loadImage("dancer1.gif");
    dancer[4].resize(a, b);
    dancer[5] = loadImage("dancer1.gif");
    dancer[5].resize(a, b);
    dancer[6] = loadImage("dancer2.gif");
    dancer[6].resize(a, b);
    dancer[7] = loadImage("dancer2.gif");
    dancer[7].resize(a, b);
    dancer[8] = loadImage("dancer2.gif");
    dancer[8].resize(a, b);
    dancer[9] = loadImage("dancer3.gif");
    dancer[9].resize(a, b);
    dancer[10] = loadImage("dancer3.gif");
    dancer[10].resize(a, b);
    dancer[11] = loadImage("dancer3.gif");
    dancer[11].resize(a, b);
    dancer[12] = loadImage("dancer4.gif");
    dancer[12].resize(a, b);
    dancer[13] = loadImage("dancer4.gif");
    dancer[13].resize(a, b);
    dancer[14] = loadImage("dancer4.gif");
    dancer[14].resize(a, b);
    dancer[15] = loadImage("dancer5.gif");
    dancer[15].resize(a, b);
    dancer[16] = loadImage("dancer5.gif");
    dancer[16].resize(a, b);
    dancer[17] = loadImage("dancer5.gif");
    dancer[17].resize(a, b);
    dancer[18] = loadImage("dancer6.gif");
    dancer[18].resize(a, b);
    dancer[19] = loadImage("dancer6.gif");
    dancer[19].resize(a, b);
    dancer[20] = loadImage("dancer6.gif");
    dancer[20].resize(a, b);
    dancer[21] = loadImage("dancer7.gif");
    dancer[21].resize(a, b);
    dancer[22] = loadImage("dancer7.gif");
    dancer[22].resize(a, b);
    dancer[23] = loadImage("dancer7.gif");
    dancer[23].resize(a, b);
    dancer[24] = loadImage("dancer8.gif");
    dancer[24].resize(a, b);
    dancer[25] = loadImage("dancer8.gif");
    dancer[25].resize(a, b);
    dancer[26] = loadImage("dancer8.gif");
    dancer[26].resize(a, b);
    dancer[27] = loadImage("dancer9.gif");
    dancer[27].resize(a, b);
    dancer[28] = loadImage("dancer9.gif");
    dancer[28].resize(a, b);
    dancer[29] = loadImage("dancer9.gif");
    dancer[29].resize(a, b);
    dancer[30] = loadImage("dancer10.gif");
    dancer[30].resize(a, b);
    dancer[31] = loadImage("dancer10.gif");
    dancer[31].resize(a, b);
    dancer[32] = loadImage("dancer10.gif");
    dancer[32].resize(a, b);
    dancer[33] = loadImage("dancer11.gif");
    dancer[33].resize(a, b);
    dancer[34] = loadImage("dancer11.gif");
    dancer[34].resize(a, b);
    dancer[35] = loadImage("dancer11.gif");
    dancer[35].resize(a, b);
    dancer[36] = loadImage("dancer12.gif");
    dancer[36].resize(a, b);
    dancer[37] = loadImage("dancer12.gif");
    dancer[37].resize(a, b);
    dancer[38] = loadImage("dancer12.gif");
    dancer[38].resize(a, b);
    dancer[39] = loadImage("dancer13.gif");
    dancer[39].resize(a, b);
    dancer[40] = loadImage("dancer13.gif");
    dancer[40].resize(a, b);
    dancer[41] = loadImage("dancer13.gif");
    dancer[41].resize(a, b);
    dancer[42] = loadImage("dancer14.gif");
    dancer[42].resize(a, b);
    dancer[43] = loadImage("dancer14.gif");
    dancer[43].resize(a, b);
    dancer[44] = loadImage("dancer14.gif");
    dancer[44].resize(a, b);
    dancer[45] = loadImage("dancer15.gif");
    dancer[45].resize(a, b);
    dancer[46] = loadImage("dancer15.gif");
    dancer[46].resize(a, b);
    dancer[47] = loadImage("dancer15.gif");
    dancer[47].resize(a, b);
    dancer[48] = loadImage("dancer16.gif");
    dancer[48].resize(a, b);
    dancer[49] = loadImage("dancer16.gif");
    dancer[49].resize(a, b);
    dancer[50] = loadImage("dancer16.gif");
    dancer[50].resize(a, b);
    dancer[51] = loadImage("dancer17.gif");
    dancer[51].resize(a, b);
    dancer[52] = loadImage("dancer17.gif");
    dancer[52].resize(a, b);
    dancer[53] = loadImage("dancer17.gif");
    dancer[53].resize(a, b);
    dancer[54] = loadImage("dancer18.gif");
    dancer[54].resize(a, b);
    dancer[55] = loadImage("dancer18.gif");
    dancer[55].resize(a, b);
    dancer[56] = loadImage("dancer18.gif");
    dancer[56].resize(a, b);
    dancer[57] = loadImage("dancer19.gif");
    dancer[57].resize(a, b);
    dancer[58] = loadImage("dancer19.gif");
    dancer[58].resize(a, b);
    dancer[59] = loadImage("dancer19.gif");
    dancer[59].resize(a, b);

    kinect.init();

    vert1 = width / 3;
    vert2 = vert1 * 2;

    quad1 = width / 4;
    quad2 = quad1 * 2;
    quad3 = quad2 + quad1;

    limbtracker = new Limbtracker(25);
    limbtracker2 = new Limbtracker(25);
    limbtracker3 = new Limbtracker(25);

    gradient = new Gradients();

    //Jazz loops
    jazz = new Jazz();
    jazz.file1.loop();
    jazz.file2.loop();
    jazz.file3.loop();

    //Different way to fill and draw shapes from classes
    squareArr = new ArrayList < Square > ();
    squiglyArr = new ArrayList < Squigly > ();
    triangleArr = new ArrayList < Triangle > ();
    triangleArr2 = new ArrayList < Triangle2 > ();
    squiglyArr2 = new ArrayList < Squigly2 > ();
    squareArr2 = new ArrayList < Square2 > ();
    backgroundArr = new ArrayList < Background_Lines > ();

    squareArr.add(new Square(0, 200, 200));
    squareArr2.add(new Square2(0, 180, 180));
    squareArr.add(new Square(0, 200, 700));
    squareArr2.add(new Square2(0, 180, 680));
    squareArr.add(new Square(0, 1600, 150));
    squareArr2.add(new Square2(0, 1580, 130));
    squareArr.add(new Square(0, 1300, 550));
    squareArr2.add(new Square2(0, 1280, 530));

    //squareArr.add(new Square(0,600,450));
    //squareArr.add(new Square(0,1000,750));

    squiglyArr.add(new Squigly(0, 600, 400));
    squiglyArr2.add(new Squigly2(0, 580, 380));
    squiglyArr.add(new Squigly(0, 600, 1000));
    squiglyArr2.add(new Squigly2(0, 580, 980));
    squiglyArr.add(new Squigly(0, 1000, 400));
    squiglyArr2.add(new Squigly2(0, 980, 380));
    squiglyArr.add(new Squigly(0, 800, 700));
    squiglyArr2.add(new Squigly2(0, 780, 680));

    //squiglyArr.add(new Squigly(0,1500,800));
    //squiglyArr.add(new Squigly(0,300,700));

    triangleArr.add(new Triangle(0, 900, 300));
    triangleArr2.add(new Triangle2(0, 890, 290));
    triangleArr.add(new Triangle(0, 900, 800));
    triangleArr2.add(new Triangle2(0, 890, 790));
    triangleArr.add(new Triangle(0, 1400, 400));
    triangleArr2.add(new Triangle2(0, 1390, 390));
    triangleArr.add(new Triangle(0, 1300, 900));
    triangleArr2.add(new Triangle2(0, 1290, 890));

    backgroundArr.add(new Background_Lines(0, -15, 100, 300));
    backgroundArr.add(new Background_Lines(0, -15, 50, 50));
    backgroundArr.add(new Background_Lines(0, -15, 500, 50));
    backgroundArr.add(new Background_Lines(0, -15, 500, 300));
    backgroundArr.add(new Background_Lines(0, -15, 500, 600));
    backgroundArr.add(new Background_Lines(0, -15, 150, 500));
    backgroundArr.add(new Background_Lines(0, -15, 150, 500));
    backgroundArr.add(new Background_Lines(0, -15, 450, 800));
    backgroundArr.add(new Background_Lines(0, -15, 650, 740));
    backgroundArr.add(new Background_Lines(0, -15, 850, 800));
    backgroundArr.add(new Background_Lines(0, -15, 1000, 850));
    backgroundArr.add(new Background_Lines(0, -15, 1200, 1050));
    backgroundArr.add(new Background_Lines(0, -15, 150, 1000));
    backgroundArr.add(new Background_Lines(0, -15, 450, 1050));
    backgroundArr.add(new Background_Lines(0, -15, 650, 920));
    backgroundArr.add(new Background_Lines(0, -15, 850, 1050));
    backgroundArr.add(new Background_Lines(0, -15, 1300, 1000));
    backgroundArr.add(new Background_Lines(0, -15, 1500, 1070));
    backgroundArr.add(new Background_Lines(0, -15, 1700, 930));
    backgroundArr.add(new Background_Lines(0, -15, 1900, 1000));
    backgroundArr.add(new Background_Lines(0, -15, 1900, 840));
    backgroundArr.add(new Background_Lines(0, -15, 1850, 920));
    backgroundArr.add(new Background_Lines(0, -15, 1900, 600));
    backgroundArr.add(new Background_Lines(0, -15, 1800, 400));
    backgroundArr.add(new Background_Lines(0, -15, 1850, 220));

    backgroundArr.add(new Background_Lines(0, -15, 1600, 1030));
    backgroundArr.add(new Background_Lines(0, -15, 1600, 800));
    backgroundArr.add(new Background_Lines(0, -15, 1650, 970));
    backgroundArr.add(new Background_Lines(0, -15, 1600, 570));
    backgroundArr.add(new Background_Lines(0, -15, 1500, 430));

    backgroundArr.add(new Background_Lines(0, -15, 1180, 1030));
    backgroundArr.add(new Background_Lines(0, -15, 1280, 800));
    backgroundArr.add(new Background_Lines(0, -15, 1250, 970));
    backgroundArr.add(new Background_Lines(0, -15, 1210, 570));
    backgroundArr.add(new Background_Lines(0, -15, 1200, 430));
    backgroundArr.add(new Background_Lines(0, -15, 1290, 240));
    backgroundArr.add(new Background_Lines(0, -15, 1290, 40));

}

void draw()
{


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
    gradient.radial(width * 3, height * 3, col1, col3, 100);


    pushMatrix();
    pushStyle();
    stroke(0, 0, 255);
    translate(width / 2, height / 2, 0);
    //scale(zVal);
    //rotateX(rotX);
    SkullyBoi();
    popStyle();
    popMatrix();
    //for (Square2 squar2: squareArr2)
    //{
    //    squar2.display();
    //}

    //for (Triangle2 tri2: triangleArr2)
    //{
    //    tri2.display();
    //}
    //for (Squigly2 squig2: squiglyArr2)
    //{
    //    squig2.display();
    //}

    for (Square squar: squareArr)
    {
        squar.display();
    }

    for (Triangle tri: triangleArr)
    {
        tri.display();
    }

    for (Squigly squig: squiglyArr)
    {
        squig.display();
    }


    for (Background_Lines back: backgroundArr)
    {
        back.display();
    }

    if (zoneSetter[0] == false)
    {
        image(dancer[frameCount % 60], 300, height - 300);
    }

    if (zoneSetter[1] == false)
    {
        image(dancer[frameCount % 60], 900, height - 300);

    }

    if (zoneSetter[2] == false)
    {
        image(dancer[frameCount % 60], 1500, height - 300);

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

}

void SkullyBoi()
{
    setNonActive();
    ArrayList < KSkeleton > skeletonArray = kinect.getSkeleton3d();
    //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();  
    //individual JOINTS
    if (skeletonArray.size() == 0)
    {
        col1 = color(255, 251, 157, 50);
        col3 = color(255, 127, 80, 50);
        offsetShapes = false;
    }

    for (int i = 0; i < skeletonArray.size(); i++)
    {
        KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
        if (skeleton.isTracked())
        {
            KJoint[] joints = skeleton.getJoints();
            float xSetter = getJointX(joints, KinectPV2.JointType_SpineMid);
            //  println(xSetter);    

            if (skeletonArray.size() == 1)
            {
                col1 = color(col1R, col1G, col1B, 50);
                col3 = color(col3R, col3G, col3B, 50);
                offsetShapes = false;
            }
            else if (skeletonArray.size() == 2)
            {
                //println("here");
                col1 = color(col1R2, col1G2, col1B2, 75);
                col3 = color(col3R2, col3G2, col3B2, 75);
                offsetShapes = false;
            }
            else if (skeletonArray.size() == 3)
            {
                offsetShapes = true;
                float x = getSinScale(160, 40, 400);
                col3G = int(x);
                float y = getSinScale(300, 30, 400);
                col1R = int(y);
                // println(col1R);
                col3 = color(col3R2, col3G2, col3B2, 150);
                col1 = color(col1R2, col1G2, col1B2, 150);
                // println("yes");
            }
            
            //Checking what third the skeloten is in
            if (xSetter > .24 && zoneSetter[2] == false)
            {
                zoneSetter[2] = true;
                for (Triangle tri: triangleArr)
                {
                    tri.setColor(tri.r, tri.g, tri.b, tri.alpha);
                }
                println("Size in Triangles", skeletonArray.size());
                if (skeletonArray.size() == 3)
                {
                    for (Triangle2 tri2: triangleArr2)
                    {                     
                        tri2.display();
                        tri2.setBackgroundColor(tri2.r, tri2.g, tri2.b, tri2.alpha);
                    }
                }
                //drawTriangleBoi(joints);
                limbtracker.update2(joints);
                //filling second PVector with the first PVectors values
                limbtracker.fillFollowing(KinectPV2.JointType_Count);
                float[] comparison = limbtracker.distance(KinectPV2.JointType_Count);
                limbtracker.fillBuffer(comparison);

                if (limbtracker.limbActivated(KinectPV2.JointType_HandLeft))
                {
                    jazz.P1.play();
                    for (Triangle tri: triangleArr)
                    {
                        tri.changePosition(offsetAmountNeg, offsetAmountPos);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        println("Here1");
                        for (Triangle2 tri: triangleArr2)
                        {
                            tri.changePosition(offsetAmountNeg, offsetAmountPos);
                        }
                    }
                }
                if (limbtracker.limbFlailing(KinectPV2.JointType_HandRight))
                {
                    for (Triangle tri: triangleArr)
                    {
                        tri.changeScale(true, maxOffset, minOffset);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Triangle2 tri2: triangleArr2)
                        {
                            tri2.changeScale(true, maxOffset, minOffset);
                        }
                    }
                }
                else
                {
                    for (Triangle tri: triangleArr)
                    {
                        tri.changeScale(false, maxOffset, minOffset);
                    }

                    if (skeletonArray.size() == 3)
                    {
                        for (Triangle2 tri2: triangleArr2)
                        {
                            tri2.changeScale(false, maxOffset, minOffset);
                        }
                    }
                }

                if (limbtracker.limbActivated(KinectPV2.JointType_KneeRight))
                {
                    jazz.P2.play();
                    for (Triangle tri: triangleArr)
                    {
                        tri.changeRotation();
                    }

                    if (skeletonArray.size() == 3)
                    {
                        for (Triangle2 tri: triangleArr2)
                        {
                            tri.changeRotation();
                        }
                    }
                }

                if (limbtracker.limbActivated(KinectPV2.JointType_KneeLeft))
                {
                    jazz.P4.play();
                    for (Triangle tri: triangleArr)
                    {
                        tri.changeRotation();
                    }

                    if (skeletonArray.size() == 3)
                    {
                        for (Triangle2 tri: triangleArr2)
                        {
                            tri.changeRotation();
                        }
                    }
                }

                if (limbtracker.limbActivated(KinectPV2.JointType_SpineMid))
                {
                    jazz.P3.play();
                }


            }

            if (xSetter < .24 && xSetter > -.52 && zoneSetter[1] == false)
            {
                zoneSetter[1] = true;
                for (Squigly squig: squiglyArr)
                {
                    squig.setColor(squig.r, squig.g, squig.b, squig.alpha);
                }
                println("Size in Squiglys ", skeletonArray.size());
                if (skeletonArray.size() == 3)
                {
                    for (Squigly2 squig2: squiglyArr2)
                    {
                        squig2.display();
                        squig2.setBackgroundColor(squig2.r, squig2.g, squig2.b, squig2.alpha);
                    }
                }

                limbtracker2.update2(joints);
                limbtracker2.fillFollowing(KinectPV2.JointType_Count);
                //drawSquiglyBoi(joints);
                float[] comparison2 = limbtracker2.distance(KinectPV2.JointType_Count);
                limbtracker2.fillBuffer(comparison2);

                if (limbtracker2.limbActivated(KinectPV2.JointType_HandLeft))
                {
                    jazz.B1.play();
                    jazz.B1.amp(jazz.bampc);
                    jazz.B1.rate(jazz.p5Rate); //relating note by 5th
                    jazz.file1.amp(jazz.scamp);
                    jazz.file2.amp(jazz.scamp);
                    jazz.file3.amp(jazz.scamp);
                    //squigly.changeSizePositive(2);
                    for (Squigly squig: squiglyArr)
                    {
                        squig.changePosition(offsetAmountNeg, offsetAmountPos);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        println("Here2");
                        for (Squigly2 squig2: squiglyArr2)
                        {
                            squig2.changePosition(offsetAmountNeg, offsetAmountPos);
                        }
                    }
                }

                if (limbtracker2.limbFlailing(KinectPV2.JointType_HandRight))
                {
                    // squigly.RotateX(.01);
                    for (Squigly squig: squiglyArr)
                    {
                        squig.changeScale(true, maxOffset, minOffset);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Squigly2 squig2: squiglyArr2)
                        {
                            squig2.changeScale(true, maxOffset, minOffset);
                        }
                    }
                }
                else
                {
                    for (Squigly squig: squiglyArr)
                    {
                        squig.changeScale(false, maxOffset, minOffset);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Squigly2 squig2: squiglyArr2)
                        {
                            squig2.changeScale(false, maxOffset, minOffset);
                        }
                    }

                }

                if (limbtracker2.limbActivated(KinectPV2.JointType_KneeRight))
                {
                    jazz.B2.play();
                    jazz.B2.amp(jazz.bampc);
                    jazz.B2.rate(jazz.p5Rate); //relating note by 5th
                    jazz.file1.amp(jazz.scamp);
                    jazz.file2.amp(jazz.scamp);
                    jazz.file3.amp(jazz.scamp);

                    for (Squigly squig: squiglyArr)
                    {
                        squig.changeRotation();
                    }

                    if (skeletonArray.size() == 3)
                    {
                        for (Squigly2 squig: squiglyArr2)
                        {
                            squig.changeRotation();
                        }
                    }
                }

                if (limbtracker2.limbActivated(KinectPV2.JointType_KneeLeft))
                {
                    jazz.B3.play();
                    jazz.B3.amp(jazz.bampc);
                    jazz.B3.rate(jazz.p5Rate); //relating note by 5th
                    jazz.file1.amp(jazz.scamp);
                    jazz.file2.amp(jazz.scamp);
                    jazz.file3.amp(jazz.scamp);

                    for (Squigly squig: squiglyArr)
                    {
                        squig.changeRotation();
                    }

                    if (skeletonArray.size() == 3)
                    {
                        for (Squigly2 squig: squiglyArr2)
                        {
                            squig.changeRotation();
                        }
                    }
                }

                if (limbtracker2.limbActivated(KinectPV2.JointType_SpineMid))
                {
                    jazz.B4.play();
                    jazz.B4.amp(jazz.bampc);
                    jazz.B4.rate(jazz.p5Rate); //relating note by 5th
                    jazz.file1.amp(jazz.scamp);
                    jazz.file2.amp(jazz.scamp);
                    jazz.file3.amp(jazz.scamp);
                }
            }

            if (xSetter < -.52 && zoneSetter[0] == false)
            {
                //println(4);                  
                zoneSetter[0] = true;
                for (Square squar: squareArr)
                {
                    squar.setColor(squar.r, squar.g, squar.b, squar.alpha);
                }
                println("Size in Squares ", skeletonArray.size());

                if (skeletonArray.size() == 3)
                {
                    for (Square2 squar2: squareArr2)
                    {
                        squar2.display();
                        squar2.setBackgroundColor(squar2.r, squar2.g, squar2.b, squar2.alpha);
                    }
                }
                limbtracker3.update2(joints);
                limbtracker2.fillFollowing(KinectPV2.JointType_Count);
                float[] comparison3 = limbtracker3.distance(KinectPV2.JointType_Count);
                limbtracker3.fillBuffer(comparison3);

                if (limbtracker3.limbActivated(KinectPV2.JointType_HandLeft))
                {
                    jazz.D1.play();
                    for (Square squar: squareArr)
                    {
                        squar.changePosition(offsetAmountNeg, offsetAmountPos);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        println("Here3");
                        for (Square2 squar: squareArr2)
                        {
                            squar.changePosition(offsetAmountNeg, offsetAmountPos);
                        }
                    }
                }

                if (limbtracker3.limbFlailing(KinectPV2.JointType_HandRight))
                {
                    for (Square squar: squareArr)
                    {
                        squar.changeScale(true, maxOffset, minOffset);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Square2 squar: squareArr2)
                        {
                            squar.changeScale(true, maxOffset, minOffset);
                        }
                    }
                }
                else
                {
                    for (Square squar: squareArr)
                    {
                        squar.changeScale(false, maxOffset, minOffset);
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Square2 squar: squareArr2)
                        {
                            squar.changeScale(false, maxOffset, minOffset);
                        }
                    }
                }

                if (limbtracker3.limbActivated(KinectPV2.JointType_KneeLeft))
                {
                    jazz.D2.play();
                    for (Square squar: squareArr)
                    {
                        squar.changeRotation();
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Square2 squar: squareArr2)
                        {
                            squar.changeRotation();
                        }
                    }
                }

                if (limbtracker3.limbActivated(KinectPV2.JointType_KneeRight))
                {
                    jazz.D3.play();
                    for (Square squar: squareArr)
                    {
                        squar.changeRotation();
                    }
                    if (skeletonArray.size() == 3)
                    {
                        for (Square2 squar: squareArr2)
                        {
                            squar.changeRotation();
                        }
                    }
                }

                if (limbtracker3.limbActivated(KinectPV2.JointType_SpineMid))
                {
                    jazz.D4.play();
                    //square.RandomStroke();
                }
            }
        }
        // drawBody(joints);  
        //text(skeletonArray.size(), 100,100);
        //text(spot,150,150);
    }


}

void setNonActive()
{
    for (int j = 0; j < zoneSetter.length; j++)
    {
        zoneSetter[j] = false;
        // println(zoneSetter);
    }

    if (zoneSetter[2] == false)
    {
        for (Triangle tri: triangleArr)
        {
            tri.setColor(128, 128, 128, 150);
            tri.changeScale(false, maxOffset, minOffset);
        }
    }

    if (zoneSetter[1] == false)
    {
        for (Squigly squig: squiglyArr)
        {
            squig.setColor(128, 128, 128, 150);
            squig.changeScale(false, maxOffset, minOffset);
        }
    }

    if (zoneSetter[0] == false)
    {
        for (Square squar: squareArr)
        {
            squar.setColor(128, 128, 128, 150);
            squar.changeScale(false, maxOffset, minOffset);

        }
    }
}


float getSinScale(float high, float low, float period)
{
    float amplitude = high - low;
    float x = (amplitude - low) + (amplitude - high) * cos(TWO_PI * frameCount / period);
    x = abs(x);
    return x;
}

//DRAW BODY
void drawBody(KJoint[] joints)
{
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


void drawJoint(KJoint[] joints, int jointType)
{
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

void drawBone(KJoint[] joints, int jointType1, int jointType2)
{
    //strokeWeight(2.0f + joints[jointType1].getZ()*8);

    //float xMapped = map(joints[jointType1].getX(), -1.28, 1, 0, width);
    //float yMapped = map(joints[jointType1].getY(), -0.3, 0.07, 0, height);
    //float zMapped = map(joints[jointType1].getZ(), 1, 8, 0, height*2);
    pushStyle();
    strokeWeight(.01);
    popStyle();
    line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());

}

//Gets an X value of a joint.
float getJointX(KJoint[] joints, int jointType)
{
    return (joints[jointType].getX());
}
