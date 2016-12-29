
public class Individual
{
private int[] error = new int[2];
private int[] pos = new int[2];
private float[] ang = new float[2];
private float[] speed = new float[2];
private int totalError;
 
    Individual ()
    {
     for(int p=0;p<pool;p++)
       {
         pos[p] = 100;
       }
    }
    
   void obstacle()
   {
    rect(rectStartX,rectStartY,rectSizeX,rectSizeY);
    if(pos[0] > rectStartX && pos[0] < rectEndX && pos[1] > rectStartY && pos[1] < rectEndY)
    {
    pos[0] = rectStartX;
    }
   }
   
   void physical()
   {
        
     if (pos[0] == fittestPos[0] && pos[1] == fittestPos[1])
     {
     fill(255,0,255);
     }
     ellipse(pos[0],pos[1], rad, rad);
     fill(255,0,0);
     ellipse(target[0], target[1], rad, rad);
     fill(0,255,255);
     ellipse(mean[0], mean[1], rad, rad);   
     fill(255);
   }
 
 void setPos()
 {
  pos[0] += speed[0];
  pos[1] += speed[1]; 
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
       fittestSpeed[p] = speed[p];
       }
     }
 } 
 
 void setMean()
 {
 
 if(count == 0)
 {
  for(int p=0;p<pool;p++)
 {
 sum[p] = 0;
 }
 }
count++; 
 for(int p=0;p<pool;p++)
 {
 sum[p] += pos[p];
 }
 
 if(count == pop)
 {
   for(int p=0;p<pool;p++)
   { 
   mean[p] = sum[p]/pop; 
   }
 count = 0;
 }
 }
 
 void refine ()
 {   
     for(int p=0;p<pool;p++)
     {
     pos[p] = fittestPos[p];
     }
     gen++;    
     mutate();  
 }
 
 void mutate ()
 {
   for(int p=0;p<pool;p++)
   {
   pos[p] += random(-mutAmt,mutAmt);
   }
} 
}