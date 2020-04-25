public class Square2 extends Shape{
  int r=0; 
  int g=0; 
  int b=0;
  int alpha=150;
    
  public Square2(float squarePoint, float x, float y )
  {              
    super(255,0,255,255,x,y);
    shapeMode(CORNER);
    strokeJoin(ROUND);
    shape = createShape();       
    shape.beginShape(LINES);  
    shape.vertex(squarePoint, squarePoint);
    shape.vertex(squarePoint+100, squarePoint);
    
    shape.vertex(squarePoint+100, squarePoint);
    shape.vertex(squarePoint+100, squarePoint+100);

    shape.vertex(squarePoint, squarePoint+100);
    shape.vertex(squarePoint+100, squarePoint+100);
    
    shape.vertex(squarePoint, squarePoint+100);
    shape.vertex(squarePoint, squarePoint);

   // shape.vertex(squarePoint+100, squarePoint+100);

    shape.endShape(CLOSE);
  }
  
}
