void beginContact(Contact cp)
{
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  boolean o1IsPlayer = o1.getClass() == Player.class;
  boolean o2IsPlayer = o2.getClass() == Player.class;
  
  if ( o1IsPlayer || o2IsPlayer )
  {
    int other=0;
    if (o1IsPlayer)
    {
      other = 2;
    }
    else if (o2IsPlayer)
    {
      other = 1;
    }
    else
    {
      println("ERROR");
    }
   
    if (other == 1)
    {
      Player p = (Player)o2;
      if(o1.getClass() == Enemy.class)
      {
        p._isAlive = false;
      }
      
      if(o1.getClass() == Floor.class)
      {
        p._canJump = true;
      }
      else
      {
        p._canJump = false;
      }
    }
    
    else if (other == 2)
    {
      Player p = (Player)o1;
      
      if(o2.getClass() == Enemy.class)
      {
        p._isAlive = false;
      }
      
      if(o2.getClass() == Floor.class)
      {
        p._canJump = true;
      }
      else
      {
        p._canJump = false;
      }
    }
  }
}