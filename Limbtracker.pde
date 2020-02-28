public class Limbtracker {
  
  protected int size;
  protected PVector[] limbtracker1, limbtracker2;
  protected int sampleIndex;
  
  public Limbtracker( int size ) {
    initBuffer( size );
  };
  
  protected void initBuffer( int size ) {
    this.size = size;
    limbtracker1 = new PVector[size];
    limbtracker2 = new PVector[size];
    sampleIndex = 0;
   
    for( int i=0; i != limbtracker1.length; i++) 
    {

      limbtracker1[i]=new PVector(0,0,0);
      limbtracker2[i]=new PVector(0,0,0);
      //println( limbtracker1);
    }
  };
  
   public Limbtracker update( float[] xPos,float[] yPos,float[] zPos )
   {
    sampleIndex++;
    if(sampleIndex == size) sampleIndex = 0;
    
    //for( int i=0; i < xPos.length; i++) 
    //{
      limbtracker1[sampleIndex].set(xPos[sampleIndex],yPos[sampleIndex],zPos[sampleIndex]);        
    //}
     return this;
   };
   
   public Limbtracker fillFollowing(int size)
   {
    if(sampleIndex == size) 
    {
     for(int i=0; i<size; i++) 
     {
      limbtracker2[i]=limbtracker1[i].copy();
     }
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
  
  
  
