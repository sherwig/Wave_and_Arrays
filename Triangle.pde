public class Triangle extends Shape{

  public Triangle(float trianglePoint)
  {    
    super(0,255,255,100);
    shape=createShape();
    shape.beginShape(TRIANGLES);
    //triangle.noFill();
  
    shape.vertex(trianglePoint, trianglePoint);
    shape.vertex(trianglePoint-75, trianglePoint-75);
    shape.vertex(trianglePoint, trianglePoint-150);
    shape.endShape(CLOSE); 
    
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);
    shape.setFill(color(r,g,b,alpha));  
  };
  
}
       
