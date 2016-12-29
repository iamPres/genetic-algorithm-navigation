int pop = 10;
int pool = 2;
int p;
int rad = 10;
int count, fitCount;
int[] fittestGene = new int[2];
int[] fittestPos = new int[2];
float[] fittestAng = new float[2];
float[] fittestSpeed = new float[2];
int fittestError = 10000000;
int[] target = new int[pool+1];
int gen = 1;
int mutAmt = 5;
int mutCount;
int rectStartX = 200;
int rectStartY = 0;
int rectSizeX = 100;
int rectSizeY = 475;
int rectEndX = rectStartX + rectSizeX;
int rectEndY = rectStartY + rectSizeY;

Individual[] ind = new Individual[pop];
void setup ()
{
  for (int i=0;i<pop;i++)
  {
  ind[i] = new Individual ();
  }
size(500, 500);  
surface.setResizable(true);
ellipseMode(RADIUS);
noStroke();

}

void draw ()
{
  println();
  println(gen);
  background(125,255,125); 
  for (int i=0;i<pop;i++)
  {
  setTarget();
  ind[i].setPos();
  ind[i].setError();
  ind[i].setFittest();
  ind[i].physical();
  ind[i].refine();
  ind[i].obstacle();

  
      for (int p=0;p<pool;p++)
      {  
      print(ind[i].ang[p]);
      print(" ");
      }
    
      print("     ");
  
    for(int p=0;p<pool;p++)
    {
    print(ind[i].pos[p]);
    print(" ");
    }
    
  print("     ");
  
    for(int p=0;p<pool;p++)
    {
    print(ind[i].error[p]);
    print(" ");
    }
    
  print("     ");    
  println(ind[i].totalError);

  }
  
  print(fittestError);
  print("     ");
  
    for(int p=0;p<pool;p++)
    {
    print(fittestAng[p]);
    print(" ");
    }
    println();
}

  void setTarget()
    {
    target[0] = 413;
    target[1] = 400;
    }
    
    