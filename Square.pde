public class Square {
  PShape square;
  int numShapes=10;
  
  public Square(float squarePoint)
  {    
    square=createShape(RECT,squarePoint,squarePoint, squarePoint+200, squarePoint+200);      
    square.setStroke(color(255));
    square.setStrokeWeight(4);   
  }
  
  public void display(float x, float y)
  {
      shape(square,x,y);
  }
 
};
