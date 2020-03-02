public class Limbtracker {
  
  protected int size;
  protected PVector[] limbtracker1, limbtracker2;
  protected int sampleIndex;
  FloatBuffer buffer;

  
  public Limbtracker( int size ) {
    initBuffer( size );
  };
  
  protected void initBuffer( int size ) {
    this.size = size;
    limbtracker1 = new PVector[size];
    limbtracker2 = new PVector[size];
    buffer= new FloatBuffer(30);
    sampleIndex = 0;
    for( int i=0; i != limbtracker1.length; i++) 
    {
      limbtracker1[i]=new PVector(0,0,0);
      limbtracker2[i]=new PVector(0,0,0);
    }
  };
  
  //Fill first PVector with x, y, and z postitions of skelotens
   public Limbtracker update( float[] xPos,float[] yPos,float[] zPos )
   {
    sampleIndex++;
    if(sampleIndex == size) sampleIndex = 0;  
      limbtracker1[sampleIndex].set(xPos[sampleIndex],yPos[sampleIndex],zPos[sampleIndex]);         
     return this;
   };
  
   //Copy the first PVector into a second one once it is full. 
   public Limbtracker fillFollowing(int size)
   {
    if(sampleIndex == size) 
    {  
     for(int i=0; i<size; i++) 
     {
      //limbtracker2[i]=limbtracker1[i].copy();
      limbtracker2[i].set(limbtracker1[i]);
     }
    }
     return this;
   };
  
  //Compute the distance of each point to one another.
  public float[] distance(int size)
  {
    float[] comparison= new float[size];  
    for(int i=0; i<size;i++)
    {
      comparison[i]=limbtracker1[i].dist(limbtracker2[i]);     
    }
    return comparison; 
  };
  
  public void fillBuffer(float value)
  {
    buffer.update(value);   
  };
 
  public float bufferVariance()
  {
    float variance=buffer.variance();
    return variance;  
  };
  
}
  
  
  
