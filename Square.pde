public class Square extends Shape{

    
  public Square(float squarePoint, float x, float y )
  {    
    super(255,0,255,100,x,y);
    shape=createShape(RECT,squarePoint,squarePoint, squarePoint+150, squarePoint+150);      
    shape.setStroke(color(r,g,b,alpha));
    shape.setStrokeWeight(2);  
    shape.setFill(color(r,g,b,alpha));
  }
 
};
