public class Shape
{
  PShape shape; 
  int r=128; 
  int g=128; 
  int b=128;
  int alpha=100;
  PVector offset;
  PVector currentPosition;
  PVector basePosition;
  float currentScale=1; 
  float rotation=0;
  float offsetRotation=0;
  PVector v;
 
  public Shape(int r, int g, int b, int alpha, float x, float y)
  {
      this.r=r; 
      this.g=g;
      this.b=b;
      this.alpha=alpha;
      offset=new PVector();
      basePosition=new PVector(x,y);
      currentPosition=new PVector(x,y);   
  };
  
   public void display()
    {
      pushMatrix(); 
      rotation=lerp(rotation,offsetRotation,.05);  
      currentPosition.lerp(basePosition.x+offset.x,basePosition.y+offset.y,0,.05);
      translate(currentPosition.x,currentPosition.y);
      rotate(rotation);
      shape(shape,0, 0,shape.width*currentScale,shape.height*currentScale);  
      popMatrix();
    };
    
    void changeRotation() 
    {
      if(random(0,1)>.5) 
      {       
        offsetRotation=random(-PI,PI);
      }
      else 
      {
        offsetRotation=0;
      }          
    };
    
    void setColor(int r, int g, int b,int alpha)
    {      
       shape.setStroke(color(r,g,b,alpha));
       shape.setFill(color(r,g,b,alpha));
    };
    
     void RandomStroke() 
     {
      shape.setStrokeWeight(random(3,7));   
     };
    
     void changeScale(boolean flailing) 
     {
       if(flailing) 
       {
         currentScale=lerp(currentScale,2,.08);
         
       }
       else 
       {
         currentScale=lerp(currentScale,1,.03);
       } 
       
     };
    
       
    void changeOpacity(float amount)
    {
      alpha+=amount;
      if (alpha>=255) 
      {
         alpha=255; 
      }
      shape.setStroke(color(r,g,b,alpha));  
      shape.setFill(color(r,g,b,alpha));  
    };
    
   void changePosition()
    {         
      if(random(0,1)>.5) 
      {       
        offset.set(random(-100,100),random(-100,100));
      }
      else 
      {
        offset.set(0,0);
      }            
    };
    
     void setCenterPosition()
  {
    float sumX=0; 
    float sumY=0;
    
    for (int i = 0; i < shape.getVertexCount(); i++)
    {
      v= shape.getVertex(i);
      sumX+=v.x; 
      sumY+=v.y;  
    }
    float centerX=0;
    float centerY=0;
    centerX=sumX/shape.getVertexCount();
    centerY=sumY/shape.getVertexCount();
   
   for (int i = 0; i < shape.getVertexCount(); i++)
    {
      v=shape.getVertex(i);
      shape.setVertex(i, v.x-centerX, v.y -centerY);     
    }
  };
    
}
