int pop = 10;
int pool = 2;
int p;
int rad = 10;
int count, fitCount;
int[] fittestGene = new int[2];
int[] fittestPos = new int[2];
double[] fittestAng = new double[2];
int fittestError = 10000000;
int[] target = new int[pool+1];
int gen = 1;
int mutAmt = 5;
int mutCount;


Individual[] ind = new Individual[pop];

void setup ()
{
  for (int i=0;i<pop;i++)
  {
  ind[i] = new Individual ();
  }
size(1300, 700);  
surface.setResizable(true);
ellipseMode(RADIUS);
noStroke();
setTarget();
}

void draw ()
{
  println();
  println(gen);
  background(125,255,125);
  for (int i=0;i<pop;i++)
  {  
    
  ind[i].setPos();
  ind[i].setSpeed();
  //ind[i].setBounds();
  ind[i].setError();
  ind[i].setFittest();
  ind[i].physical();
  ind[i].refine();

  
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
    target[0] = 1300;
    target[1] = 700;
    }
    