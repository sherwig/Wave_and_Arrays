public class Limbtracker {
  
  protected int size;
  protected PVector[] limbtracker1, limbtracker2;
  
  
  public Limbtracker( int size ) {
    initBuffer( size );
  };
  
  protected void initBuffer( int size ) {
    this.size = size;
    limbtracker1 = new PVector[size];
    limbtracker2 = new PVector[size];
    for( int i=0; i < size; i++) 
    {
      limbtracker1[i].set(0,0,0);
      limbtracker2[i].set(0,0,0);
    }
  };
  
   public Limbtracker update( float[] xPos,float[] yPos,float[] zPos )
   {
    for( int i=0; i < size; i++) 
    {
      limbtracker1[i].set(xPos[i],yPos[i],zPos[i]);        
    }
     return this;
   };
   
   public Limbtracker fillFollowing(int size)
   {
     for(int i=0; i<size; i++) 
     {
      limbtracker2[i]=limbtracker1[i].copy();
     }
     return this;
   };
  
  public float[] distance(int size)
  {
    float[] comparison= new float[size];  
    for(int i=0; i<size;i++)
    {
      comparison[i]=limbtracker1[i].dist(limbtracker2[i]);
      
    }
    return comparison; 
  };
  
  
}
  
  
  
