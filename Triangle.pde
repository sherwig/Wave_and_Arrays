public class Triangle {
  PShape triangle;
  int r=0; 
  int g=255; 
  int b=255;
  
  public Triangle(float trianglePoint)
  {    
    triangle=createShape();
    triangle.beginShape(TRIANGLES);
    //triangle.noFill();
  
    triangle.vertex(trianglePoint, trianglePoint);
    triangle.vertex(trianglePoint-75, trianglePoint-75);
    triangle.vertex(trianglePoint, trianglePoint-150);
    triangle.endShape(CLOSE); 
    
    triangle.setStroke(color(r,g,b));
    triangle.setStrokeWeight(4);
   triangle.setFill(color(r,g,b));
    
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
   
    void changeOpacity(float amount)
    {
         triangle.setStroke(color(r,g,b,amount));       
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
       
