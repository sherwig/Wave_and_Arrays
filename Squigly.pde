public class Squigly extends Shape {
  float squiglyOffset=50;
  int r=30; 
  int g=247; 
  int b=37;
  int alpha=100;
   
  public Squigly(float squiglyPoint,float x, float y)
  {
    super(30,247,37,255,x,y);
    shapeMode(CORNER);
    strokeJoin(ROUND);
    shape = createShape();       
    shape.beginShape(LINES);         

    shape.vertex(squiglyPoint, squiglyPoint);
    shape.vertex(squiglyPoint-squiglyOffset, squiglyPoint-squiglyOffset);
    
    shape.vertex(squiglyPoint-squiglyOffset, squiglyPoint-squiglyOffset);
    shape.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*2));
    
    shape.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*2));
    shape.vertex(squiglyPoint-squiglyOffset, squiglyPoint-(squiglyOffset*3));
    shape.vertex(squiglyPoint, squiglyPoint-(squiglyOffset*4));
    shape.endShape(CLOSE);      
    
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(4);
  

};
                         
    //opacity, size, rotation, movement
}
