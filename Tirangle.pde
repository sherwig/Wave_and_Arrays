public class Triangle {
  PShape triangle;
  
  public Triangle(float trianglePoint)
  {    
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    triangle.noFill();
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-50, trianglePoint-50);
    triangle.vertex(trianglePoint, trianglePoint-100);
    triangle.endShape(CLOSE); 
    
    triangle.setStroke(color(255));
    triangle.setStrokeWeight(4);

  };
  
  void display(float x, float y) {
      // Locating and drawing the shape
      pushMatrix();
      shape(triangle,x,y);
      popMatrix();
    }
  
}
       
