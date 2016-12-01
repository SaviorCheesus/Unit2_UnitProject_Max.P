import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

float cameraX = 0.0;
float cameraY = 0.0;
PImage sprite;
PImage floor;

Player player;
Mouse pointer;
Projectile projectile;
Enemy enemy;
Floor floor1;

Box2DProcessing box2d;


void setup()
{
  fullScreen(P3D);
  noCursor();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -300);
  box2d.setContinuousPhysics(true);
  
  sprite = loadImage("Box2D.png");
  floor = loadImage("Floor.png");
  
  player = new Player (width/2, height/2, sprite, true);
  pointer = new Mouse (0, 0, sprite);
  projectile = new Projectile (player._x, player._y, true);
  floor1 = new Floor (width/2, height -20, floor, true);
  enemy = new Enemy (width -20, height -60, sprite, true);
}

void draw()
{    
  box2d.step();
  background(200);
  
  camera(width/2.0 + cameraX, height/2.0 + cameraY, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0 + cameraX, height/2.0 + cameraY, 0, 
  0, 1, 0);
  
  player.display();
  
  if (dist(floor1._x,floor1._y,player._x,player._y) < 450)
  {
    player._canJump = true;
  }
  else
  {
    player._canJump = false;
  }
  
  pointer.Display();
  
  projectile.Display();
  
  floor1.Draw(); 
  
  enemy.Display();
  
}