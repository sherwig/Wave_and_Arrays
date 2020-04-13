public class Triangle2 extends Shape{
  int r=0; 
  int g=0; 
  int b=0;
  int alpha=255;
  
  public Triangle2(float trianglePoint,float x, float y)
  {    
    super(0,255,255,100,x,y);
    shapeMode(CORNER);
    shape=createShape();
    shape.beginShape(TRIANGLES);
    shape.noFill();
  
    shape.vertex(trianglePoint, trianglePoint);
    shape.vertex(trianglePoint-75, trianglePoint-75);
    shape.vertex(trianglePoint, trianglePoint-150);
    shape.endShape(CLOSE); 
        
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);
    setCenterPosition();
    //shape.setFill(color(r,g,b,alpha));  
  }; 
}
       
