public class Triangle {
  PShape triangle;
  
  public Triangle(float trianglePoint)
  {    
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    triangle.noFill();
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-50, trianglePoint-50);
    triangle.vertex(trianglePoint, trianglePoint-100);
    triangle.endShape(CLOSE); 
    
    triangle.setStroke(color(255));
    triangle.setStrokeWeight(4);

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
    
    void RandomColor() {
      // Locating and drawing the shape
      triangle.setStroke(color(random(0,255),random(0,255),random(0,255)));   
    }
    
     void RandomStroke() {
      // Locating and drawing the shape
      triangle.setStrokeWeight(random(3,7));   
    }
  
}
       
