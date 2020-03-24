public class Squigly {
  PShape squigly;
  int r=255; 
  int g=165; 
  int b=0;
  int alpha=100;
  float squiglyOffset=50;

  public Squigly(float squiglyPoint)
  {
    squigly = createShape();       
    squigly.beginShape(LINES);         
    //squigly.vertex(squiglyPoint, squiglyPoint);
    //squigly.vertex(squiglyPoint-50, squiglyPoint);

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
    
    void scale(float scaleVal) {
      squigly.scale(scaleVal);
    }
    
    //opacity, size, rotation, movement

}
