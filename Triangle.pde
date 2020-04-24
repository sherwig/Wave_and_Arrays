public class Triangle extends Shape{

  int r=0; 
  int g=255; 
  int b=255;
  int alpha=100;
  
  public Triangle(float trianglePoint,float x, float y)
  {    
    super(0,255,255,255,x,y);
    shapeMode(CORNER);
    shape=createShape();
    shape.beginShape(TRIANGLES);
    
    shape.vertex(trianglePoint, trianglePoint);
    shape.vertex(trianglePoint-65, trianglePoint-65);
    shape.vertex(trianglePoint, trianglePoint-130);
    shape.endShape(CLOSE); 
    
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);
    shape.setFill(color(r,g,b,alpha));  
  };
  
}
       
