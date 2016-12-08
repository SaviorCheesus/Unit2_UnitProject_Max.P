class Player 
{ 
  public float _x, _y;
  private PImage _img;
  private boolean _isAlive;
  private Body _body;
  
  public boolean _canJump;
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyJump;
  private PVector _moveSpeed;
  private int     _jumpStrength;
  
  Player(float x, float y, PImage img, boolean isAlive)
  {
    
     _x = x;
    _y = y;
    _img = img;
    _isAlive = isAlive;
    
   
    _moveSpeed = new PVector(60,20);
    _jumpStrength = 999999999;
    CreateBody();
    _body.setUserData(this);
   }
  
    public void Display()
    {
      if (_isAlive)
      {
        Draw();
        Update();
      }
      else
      {
        exit();
      }
      
    }
    
    
    public void Update()
    {
    KeyInputs();
    HandleMovement();
    }
  
    public void Draw()
    {
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
    
    imageMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    image(_img, 0, 0);    
    popMatrix();    
    
    cameraX = pos.x - 720;
    cameraY = pos.y - height/2;
  }

  
    private void CreateBody()
  {
    int imgH = _img.height;
    int imgW = _img.width;


    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;

    fd.density = 10;
    fd.friction = 0;
    fd.restitution = 0;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
  }
 
  
   private void KeyInputs()
  {
    if (keyPressed)
    {
      if (key == 'a')
      {
        _keyRight = true;
      }
      if (key == 'd')
      {
        _keyLeft = true;
      }
      if (key == 'w')
      {
        _keyJump = true;
      }
    }
    else
    {
      _keyLeft  = false;
      _keyRight = false;
      _keyJump  = false;
    }
  }
  
  
  public void HandleMovement()
  { 
    Vec2 currentVelocity = _body.getLinearVelocity();
    if (_keyRight)
    {
      currentVelocity.x = - _moveSpeed.x;
      
    }
    else if (_keyLeft)
    {
      currentVelocity.x =  _moveSpeed.x;
    }
    else
    {
      currentVelocity.x = 0;
    }
    _body.setLinearVelocity(currentVelocity);
  
    if (_keyJump && _canJump == true)
    {
       _moveSpeed.y = _jumpStrength;
       _body.applyLinearImpulse( new Vec2(0, _jumpStrength), _body.getWorldCenter(), false);
    }
  }
}