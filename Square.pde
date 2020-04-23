public class Square extends Shape{
  int r=255; 
  int g=0; 
  int b=255;
  int alpha=100;
    
  public Square(float squarePoint, float x, float y )
  {    
    super(255,0,255,255,x,y);
    shapeMode(CORNER);
    shape=createShape(RECT,squarePoint,squarePoint, squarePoint+100, squarePoint+100);      
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);  
    shape.setFill(color(r,g,b,alpha));
  }
 
};
