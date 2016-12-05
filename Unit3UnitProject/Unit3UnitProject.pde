import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

float cameraX = 0.0;
float cameraY = 0.0;
PImage playerSprite;
PImage playerSprite1;
PImage playerSprite2;
PImage pointerSprite;
PImage fireBall;
PImage sprite;
PImage floor;
Boolean shooting;

Player player;
Mouse pointer;
Projectile projectile;
ArrayList<Enemy> enemy;
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
  
  playerSprite1 = loadImage("playerSprite1.png");
  playerSprite2 = loadImage("playerSprite2.png");
  pointerSprite = loadImage("pointerSprite.png");
  fireBall = loadImage("fireBall.png");
  sprite = loadImage("Box2D.png");
  floor = loadImage("Floor.png");
  
  
  enemy = new ArrayList<Enemy>();
  player = new Player(width/2, height/2, playerSprite, true);
  pointer = new Mouse (0, 0, pointerSprite);
  projectile = new Projectile (player._x, player._y, true);
  floor1 = new Floor (width/2, height -20, floor, true);
  
}

void draw()
{ 
  box2d.step();
  background(200);
 
  camera(width/2.0 + cameraX, height/2.0 + cameraY, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0 + cameraX, height/2.0 + cameraY, 0, 
  0, 1, 0);
  
  if (random(1) <= 0.01)
  {
    enemy.add(new Enemy(random(width), 20.0, sprite, true));
  }
  
  for (int i = enemy.size()-1; i >= 0; i--) 
  {
    Enemy body = enemy.get(i);
    body.Display();
    
    if (body.done())
    {
      enemy.remove(i);
    }
  }
  
  
   
  pointer.Display();
  projectile.Display();
  
  floor1.Draw();  
}