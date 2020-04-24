public class Square2 extends Shape{
  int r=0; 
  int g=0; 
  int b=0;
  int alpha=255;
    
  public Square2(float squarePoint, float x, float y )
  {              
    super(255,0,255,100,x,y);
    shapeMode(CORNER);
    shape=createShape(RECT,squarePoint,squarePoint, squarePoint+100, squarePoint+100);    
    shape.setFill(255);
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);  
    //setCenterPosition();
  }
  
}
