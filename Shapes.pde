public class Shapes {

  
  PShape square;
  PShape squigly;
  PShape triangle;
  
  
  public Shapes(float squarePoint,float squiglyPoint, float trianglePoint)
  {
    square=createShape(RECT,squarePoint,squarePoint, squarePoint+200, squarePoint+200);
        
    squigly = createShape();       
    squigly.beginShape();         
    squigly.vertex(squiglyPoint, squiglyPoint);
    squigly.vertex(squiglyPoint-50, squiglyPoint-50);
    squigly.vertex(squiglyPoint, squiglyPoint-100);
    squigly.vertex(squiglyPoint-50, squiglyPoint-150);
    squigly.vertex(squiglyPoint, squiglyPoint-200);
    squigly.endShape(CLOSE);       
        
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-50, trianglePoint-50);
    triangle.vertex(squiglyPoint, squiglyPoint-100);
    triangle.endShape(CLOSE);    
  }
  
  public void drawShapes()
  {
    shape(square,400,800);
    shape(squigly,600,200);
    shape(triangle,200,600);
    
  }
  
}
