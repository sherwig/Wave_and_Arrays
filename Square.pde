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
  
 void RotateY(float amount) {
      // Locating and drawing the shape
     square.rotateY(amount);
   
    }
    
    void RotateX(float amount) {
      // Locating and drawing the shape
     square.rotateX(amount);   
    }
    
    void RandomColor() {
      // Locating and drawing the shape
      square.setFill(color(random(0,255),random(0,255),random(0,255)));   
    }
    
     void RandomStroke() {
      // Locating and drawing the shape
      square.setStrokeWeight(random(3,7));   
    }
 
};
