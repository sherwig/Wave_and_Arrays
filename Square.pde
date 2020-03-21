public class Square {
  PShape square;
  int numShapes=10;
  int r=255; 
  int g=0; 
  int b=255;
  
  public Square(float squarePoint)
  {    
    square=createShape(RECT,squarePoint,squarePoint, squarePoint+150, squarePoint+150);      
    square.setStroke(color(r,g,b));
    square.setStrokeWeight(4);  
    square.setFill(color(r,g,b));
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
    
    void changeOpacity(float amount)
    {
         square.setFill(color(r,g,b,amount));       
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
