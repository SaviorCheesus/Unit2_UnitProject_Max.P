class Floor
{
  private float _x, _y;
  private PImage _img;
  private boolean _isActive;
  private Body _body;
  
  Floor(float x, float y, PImage img, boolean isActive)
  {
    _x = x;
    _y = y;
    _img = img;
    _isActive = isActive;
    
    CreateBody();
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
    fd.friction = 0;
    fd.restitution = 0;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
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

  
  boolean GetActive() { return _isActive; }
  void    SetActive(boolean state) { _isActive = state; }
  
  Vec2    GetPosition()    { return box2d.getBodyPixelCoord(_body); }
  Vec2    GetWorldCenter() { return _body.getWorldCenter(); } 
  void    SetPosition(float x, float y) { }  
}