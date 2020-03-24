public class Square {
  PShape square;
  int numShapes=10;
  int r=255; 
  int g=0; 
  int b=255;
  int alpha=100;
    
  public Square(float squarePoint)
  {    
    square=createShape(RECT,squarePoint,squarePoint, squarePoint+150, squarePoint+150);      
    square.setStroke(color(r,g,b,alpha));
    square.setStrokeWeight(2);  
    square.setFill(color(r,g,b,alpha));
  }
  
  public void display(float x, float y)
  {
      shape(square,x,y);
  }
  
 void RotateY(float amount) {
     square.rotateY(amount);
   
    }
    
    void RotateX(float amount) {
     square.rotateX(amount);   
    }
    
    void setColor(int r, int g, int b,int alpha) {
      square.setFill(color(r,g,b,alpha));   
      square.setStroke(color(r,g,b,alpha));
    }
    
     void RandomStroke() {
      square.setStrokeWeight(random(3,7));   
    }
    
     void scale(float scaleVal) {
      square.scale(scaleVal);
    }
    
    
    void changeOpacity(float amount)
    {
      alpha+=amount;
      if (alpha>=255) 
      {
         alpha=255; 
      }
      square.setStroke(color(r,g,b,alpha));  
      square.setFill(color(r,g,b,alpha));  
    }
    
 
};
