public class Shapes {
  PShape square;
  PShape squigly;
  PShape triangle;
 
  public Shapes(float squarePoint,float squiglyPoint, float trianglePoint)
  {
    float squiglyOffset=50;
    square=createShape(RECT,squarePoint,squarePoint, squarePoint+200, squarePoint+200);
        
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
        
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-50, trianglePoint-50);
    triangle.vertex(squiglyPoint, squiglyPoint-100);
    triangle.endShape(CLOSE); 
    
    squigly.noFill();
    square.setStroke(color(255));
    squigly.setStroke(color(255));
    triangle.setStroke(color(255));
  }
  
  public void drawShapes()
  {
    shape(square,400,800);
    shape(squigly,600,200);
    shape(triangle,200,600);
    
  }
  
}
