class Mouse
{
  private float _x, _y;
  private PImage _img;
  
  Mouse(float x, float y, PImage img)
  {
    _x = x;
    _y = y;
    _img = img;
    
    imageMode(CENTER);
  }
  
  void Display()
  {
    _x = mouseX + cameraX;
    _y = mouseY + cameraY;
    image (_img, _x, _y);
  }
}