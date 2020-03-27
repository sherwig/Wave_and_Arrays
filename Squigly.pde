public class Squigly {
  PShape squigly;
  int r=255; 
  int g=165; 
  int b=0;
  int alpha=100;
  float squiglyOffset=50;
  float scaleValNegMaster=1;
  float scaleVal=1;
  float x,y;
  
  public Squigly(float squiglyPoint)
  {
    squigly = createShape();       
    squigly.beginShape(LINES);         

    squigly.vertex(squiglyPoint, squiglyPoint);
    squigly.vertex(squiglyPoint-squiglyOffset, squiglyPoint-squiglyOffset);
    
    squigly.vertex(squiglyPoint-squiglyOffset, squiglyPoint-squiglyOffset);
    squigly.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*2));
    
    squigly.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*2));
    squigly.vertex(squiglyPoint-squiglyOffset, squiglyPoint-(squiglyOffset*3));
    squigly.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*4));
    squigly.endShape(CLOSE);      
    
    squigly.setStroke(color(r,g,b,alpha));
    squigly.setStrokeWeight(4);
  

};

void display(float x, float y) {
    // Locating and drawing the shape
    pushMatrix();
    shape(squigly,x,y);
    popMatrix();
  }

   void RotateY(float amount) {
     squigly.rotateY(amount);
   
    }
    
    void RotateX(float amount) {
     squigly.rotateX(amount);   
    }
          
    void changeOpacity(float amount)
    {
      alpha+=amount;
      if (alpha>=255) 
      {
         alpha=255; 
      }
      squigly.setStroke(color(r,g,b,alpha));  
    }
    
    void setColor(int r, int g, int b, int alpha) {
      squigly.setStroke(color(r,g,b,alpha));   
    }
    
     void RandomStroke() {
      squigly.setStrokeWeight(random(3,7));   
    }
    
    //void scalePos(float scaleValPos) {
    //  squigly.scale(scaleValPos);
    //  scaleValPosMaster+=scaleValPos;
    //  println(scaleValPosMaster);      
    //  if (scaleValPosMaster>14) 
    //  {
    //     pushMatrix();
    //     squigly.scale(.5);  
    //     scaleValPosMaster=1;
    //     popMatrix();
    //  }
    //}
           
    //void scaleNeg(float scaleValNeg) {
    //  squigly.scale(scaleValNeg);
    //  scaleValNegMaster-=scaleValNeg;
    ////  println(scaleValNeg);     
    //  if (scaleValNegMaster<=-500) 
    //  {
    //    pushMatrix();
    //    squigly.scale(2);
    //    scaleValNegMaster=1;
    //    popMatrix();
    //  }
    //}
    
    //void scale(float scaleVal)
    //{
    //   if (scaleVal>1) 
    //   {
    //     squigly.scale(scaleVal);
    //     scaleValPosMaster+=scaleVal;
            
    //      if (scaleValPosMaster>14) 
    //      {
    //         pushMatrix();
    //         squigly.scale(.5);  
    //         scaleValPosMaster=1;
    //         popMatrix();
    //      }
    //   }
       
    //   else if(scaleVal<1 && scaleValPosMaster>1) 
    //   {
    //     squigly.scale(scaleVal);
    //     scaleValPosMaster-=scaleVal;
    //   }
    //   println(scaleValPosMaster);
      
    //}
    
        
    void scale()
    {
        float positive=1.1; 
        float negative=.9;
        
        float lerpValue=.5;
        
        
        scaleVal=lerp(negative,positive,.85);
        
        squigly.scale(scaleVal);
      //  println(scaleVal);
    }
    
    
          
    void changePosition(float x, float y)
    {      
      float targetPostionX=random(100,width-100); 
      float targetPostionY=random(100,height-100); 
      
      x=lerp(x,targetPostionX,.05);
      y=lerp(y,targetPostionY,.05);
      
      display(x,y);
      
    }
    
        
    //opacity, size, rotation, movement

}
