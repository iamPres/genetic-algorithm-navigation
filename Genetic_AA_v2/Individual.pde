import java.io.*;

public class Individual
{
private int[] error = new int[2];
private int[] pos = new int[2];
private double[] ang = new double[2];
private float[] speed = new float[2];
private int totalError;
 
    Individual ()
    {
     for(int p=0;p<pool;p++)
       {
         speed[p] = 10;
       }
    }
   void physical()
   {
        
     if (ang[0] == fittestAng[0] && ang[1] == fittestAng[1])
     {
     fill(0);
     }
     ellipse(pos[0],pos[1], rad, rad);
     fill(200,0,25);
     ellipse(target[0], target[1], rad, rad);
     fill(255);
   }
 
 void setPos()
 {
  pos[0] += speed[0] * ang[0];
  pos[1] += speed[1] * ang[1]; 
 }
 
 void setBounds()
 {
    if (pos[0] > width|| pos [0] < 0) {
    ang[0] *= -1;
  }
  if (pos [1] > height || pos[1] < 0) {
    ang[1] *= -1;
  }  
 }
 
 void setError()
 {
   totalError = 0;
   for(int p=0;p<pool;p++)
   {
   error[p] = abs(target[p] - pos[p]);
   totalError += error[p];
   }
 } 
 
 void setFittest()
 {
     if(totalError < fittestError)
     {
     fittestError = totalError;
       for(int p=0;p<pool;p++)
       {
       fittestPos[p] = pos[p];
       fittestAng[p] = ang[p];
       }
     }
 } 
 
 void refine ()
 {   
     for(int p=0;p<pool;p++)
     {
     ang[p] = fittestAng[p];
     pos[p] = 50;
     }
     gen++;
    mutate();     
   
 }
 
 void mutate ()
 {
   for(int p=0;p<pool;p++)
   {
   ang[p] += random(-1,1);
   }
} 
}