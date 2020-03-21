public class Squigly {
  PShape squigly;
  int r=255; 
  int g=165; 
  int b=0;
  
  public Squigly(float squiglyPoint)
  {
    float squiglyOffset=50;
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
    
    squigly.setStroke(color(r,g,b));
    squigly.setStrokeWeight(4);
  

};

void display(float x, float y) {
    // Locating and drawing the shape
    pushMatrix();
    shape(squigly,x,y);
    popMatrix();
  }

   void RotateY(float amount) {
      // Locating and drawing the shape
     squigly.rotateY(amount);
   
    }
    
    void RotateX(float amount) {
      // Locating and drawing the shape
     squigly.rotateX(amount);   
    }
          
    void changeOpacity(float amount)
    {
         squigly.setStroke(color(r,g,b,amount));       
    }
    
    void RandomColor() {
      // Locating and drawing the shape
      squigly.setStroke(color(random(0,255),random(0,255),random(0,255)));   
    }
    
     void RandomStroke() {
      // Locating and drawing the shape
      squigly.setStrokeWeight(random(3,7));   
    }
    
    //opacity size rotation, movement

}
