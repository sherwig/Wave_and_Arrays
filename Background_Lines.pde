public class Background_Lines extends Shape
{
  int r=0; 
  int g=0; 
  int b=0;
  int alpha=50;
   
   public Background_Lines(float point,float point2, float x, float y ) 
   {
     // super(0,0,0,255,x,y);
      super(30,247,37,100,x,y);

      //shapeMode(CENTER);
      shape = createShape();       
      shape.beginShape(LINES);      
      shape.vertex(point,point);
      shape.vertex(point-40,point-40); 
      
      
      shape.vertex(point2,point);      
      shape.vertex(point2-40,point-40);

      shape.endShape(CLOSE); 
      
     // noFill();
     // shape = createShape(ELLIPSE, point+30, point+30,10,10);            
     shape.setStroke(color(r,g,b,alpha));
     shape.setStrokeWeight(3);  
     shape.setFill(color(r,g,b,alpha));
   
   };
 
}
