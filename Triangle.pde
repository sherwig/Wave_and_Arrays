public class Triangle {
  PShape triangle;
  int r=0; 
  int g=255; 
  int b=255;
  int alpha=100;

  public Triangle(float trianglePoint)
  {    
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    //triangle.noFill();
  
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-75, trianglePoint-75);
    triangle.vertex(trianglePoint, trianglePoint-150);
    triangle.endShape(CLOSE); 
    
    triangle.setStroke(color(r,g,b,alpha));
    triangle.setStrokeWeight(2);
    triangle.setFill(color(r,g,b,alpha));
    
  };
  
  void display(float x, float y) {
      // Locating and drawing the shape
      pushMatrix();
      shape(triangle,x,y);
      popMatrix();
    }
    
 void RotateY(float amount) {
      // Locating and drawing the shape
     triangle.rotateY(amount);
   
    }
    
    void RotateX(float amount) {
      // Locating and drawing the shape
     triangle.rotateX(amount);   
    }
    
    void setColor(int r, int g, int b, int alpha) {
      triangle.setFill(color(r,g,b,alpha));   
      triangle.setStroke(color(r,g,b,alpha)); 
    }
    
     void RandomStroke() {
      // Locating and drawing the shape
      triangle.setStrokeWeight(random(3,7));   
    }
    
    void scale(float scaleVal) {
      triangle.scale(scaleVal);
    }
    
   void changeOpacity(float amount)
    {
      alpha+=amount;
      if (alpha>=255) 
      {
         alpha=255; 
      }
      triangle.setFill(color(r,g,b,alpha)); 
      triangle.setStroke(color(r,g,b,alpha));
    }
    
  
}
       
