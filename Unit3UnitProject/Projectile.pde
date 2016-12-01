class Projectile
{
  private float _x, _y; 
  private boolean _isAlive;
  
  private Body _body;
  private PVector movement;
  
  Projectile(float x, float y, boolean isAlive)
  {
    _x = x;
    _y = y;
    _isAlive = isAlive;
    
    imageMode(CENTER);
    movement = new PVector(player._x, player._y);
    CreateBody();
  }
  
  public void Display()
  {
    Update();
    Draw();
  }
  
  public void Update()
  {
    HandleMovement();
  }
  
  public void Draw()
  {
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
    pushMatrix();
    translate(pos.x, pos.y);   
    popMatrix();    
  }
  
  private void CreateBody()
  {
    int imgH = sprite.height;
    int imgW = sprite.width;


    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
  }
  
  void HandleMovement()
  {
    if (mousePressed == true)
    {
      movement.x=mouseX-(player._x);
      movement.y=mouseY-(player._y);
      movement.normalize();
  
      _x+=15*movement.x;
      _y+=15*movement.y;
  
      image (sprite, _x, _y);
    }
    else
    {
      _x = cameraX + (width/2);
      _y = cameraY + (height/2) - 40;
    }
  }
}