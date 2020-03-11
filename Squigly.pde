public class Squigly {
  PShape squigly;
  
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
    
    squigly.setStroke(color(255));
    squigly.setStrokeWeight(4);
       

};

void display(float x, float y) {
    // Locating and drawing the shape
    pushMatrix();
    shape(squigly,x,y);
    popMatrix();
  }


}
