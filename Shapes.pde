public class Shapes {
  PShape square;
  PShape squigly;
  PShape triangle;
  int numShapes=10;
 
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
    triangle.noFill();
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-50, trianglePoint-50);
    triangle.vertex(squiglyPoint, squiglyPoint-100);
    triangle.endShape(CLOSE); 
       
    square.setStroke(color(255));
    squigly.setStroke(color(255));
    triangle.setStroke(color(255));
    
    square.setStrokeWeight(4);
    squigly.setStrokeWeight(4);
    triangle.setStrokeWeight(4);
    
    
  }
  
  public void drawShapes(float x, float y)
  {
    for (int i=0; i<numShapes; i++)
    {
      shape(square,x,y);
      shape(squigly,x,y);
      shape(triangle,x,y);   
    }
  }
  
  
  //public void drawShapes()
  //{
    
    
  
  
}
