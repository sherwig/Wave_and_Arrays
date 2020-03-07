public class Limbtracker {
  
  protected int size;
  protected PVector[] limbtracker1, limbtracker2;
  float[] comparison= new float[KinectPV2.JointType_Count]; 
  float[] z_values = new float[KinectPV2.JointType_Count];
  float[] y_values = new float[KinectPV2.JointType_Count];
  float[] x_values = new float[KinectPV2.JointType_Count];
  protected int sampleIndex;
  FloatBuffer buffer;
  boolean flag=true;
  
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
   public Limbtracker update2(KJoint[] joints3D)
   {
     x_values=getX(joints3D);
     y_values=getY(joints3D); 
     z_values=getZ(joints3D);
    println(z_values);
    sampleIndex++;
    if(sampleIndex == size) sampleIndex = 0;  
      limbtracker1[sampleIndex].set(x_values[sampleIndex], y_values[sampleIndex], z_values[sampleIndex]);         
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
  
public float[] getX(KJoint[] joints3D) 
  {  
// For every joints, get the x value, store it in an array 
     for(int i = 0; i < KinectPV2.JointType_Count; i++) {
        x_values[i] = joints3D[i].getX();
      }
      return x_values;   
    
  };
  
public float[] getY(KJoint[] joints3D) 
  {
// For every joints, get the y value, store it in an array 
     for(int i = 0; i < KinectPV2.JointType_Count; i++) {
        y_values[i] = joints3D[i].getY();
      }
      return y_values;
    
  };
  
  public float[] getZ(KJoint[] joints3D) 
  {
// For every joints, get the z value, store it in an array 
     for(int i = 0; i < KinectPV2.JointType_Count; i++) {
        z_values[i] = joints3D[i].getZ();
      }
      return z_values;    
  };
    
}
  
  
  
