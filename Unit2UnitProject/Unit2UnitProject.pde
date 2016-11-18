import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

PImage sprite;
PImage floor;

Player player1;
Enemy enemy;
Floor floor1;

Box2DProcessing box2d;


void setup()
{
  fullScreen();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -300);
  box2d.setContinuousPhysics(true);
  
  sprite = loadImage("Box2D.png");
  floor = loadImage("Floor.png");
  
  player1 = new Player (width/2, height/2, sprite, true);
  floor1 = new Floor (width/2, height -20, floor, true);
  enemy = new Enemy (5000, height -60, sprite, true);
  
}

void draw()
{
  box2d.step();
  background(200);
  
  player1.Update();
  player1.Draw();
  
  if (enemy._isAlive == true)
  {
    enemy.Draw();
    enemy.Update();
  }
  
  floor1.Draw(); 
  
  if (dist(enemy._x,enemy._y,player1._x,player1._y) <= 2)
  {
    enemy._isAlive = false;
  }
}