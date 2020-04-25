public class Squigly2 extends Shape {
  float squiglyOffset=50;
  int r=0; 
  int g=0; 
  int b=0;
  int alpha=150;
   
  public Squigly2(float squiglyPoint,float x, float y)
  {
    super(30,247,37,100,x,y);
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
    //setCenterPosition();
  

};
                         
    //opacity, size, rotation, movement
}
