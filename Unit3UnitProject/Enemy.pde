class Enemy
{ 
  private float _x, _y;
  private PImage _img;
  private boolean _isAlive;
  private Body _body;
  
  private PVector _moveSpeed;
  Enemy(float x, float y, PImage img, boolean isAlive)
  {
    
    _x = x;
    _y = y;
    _img = img;
    _isAlive = isAlive;
    
    _moveSpeed = new PVector(20,20);
    CreateBody();
  }
  
  public void Display()
  {
    Update();
    Draw();
    Check();
  }
    
  public void Update()
  {
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

    fd.density = 100;
    fd.friction = 100;
    fd.restitution = 0;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
  }
   
   
  private void HandleMovement()
  {

    Vec2 currentVelocity = _body.getLinearVelocity();   
    currentVelocity.x = -20;
  }
}