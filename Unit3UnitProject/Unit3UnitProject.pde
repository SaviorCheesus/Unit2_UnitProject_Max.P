import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
float cameraX = 0.0;
float cameraY = 0.0;
PImage playerSprite;
PImage playerSprite1;
PImage playerSprite2;
PImage pointerSprite;
PImage enemySprite;
PImage fireBall;
PImage sprite;
PImage floorSprite;
PImage rightWallSprite;
PImage leftWallSprite;
PImage backgroundSprite;
PImage leftBranchSprite;
PImage rightBranchSprite;
Boolean shooting;

Player player;
Mouse pointer;
Projectile projectile;
ArrayList<Enemy> enemy;
Floor floor1;
Floor rightWall;
Floor leftWall;
Floor rightBranch1;
Floor rightBranch2;
Floor rightBranch3;
Floor rightBranch4;
Floor rightBranch5;
Floor rightBranch6;
Floor rightBranch7;
Floor rightBranch8;
Floor rightBranch9;
Floor rightBranch10;
Floor rightBranch11;
Floor rightBranch12;
Floor leftBranch1;
Floor leftBranch2;
Floor leftBranch3;
Floor leftBranch4;
Floor leftBranch5;
Floor leftBranch6;
Floor leftBranch7;

Box2DProcessing box2d;


void setup()
{
  fullScreen(P3D);
  noCursor();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -300);
  box2d.setContinuousPhysics(true);
  box2d.listenForCollisions();
  
  playerSprite1 = loadImage("playerSprite1.png");
  playerSprite2 = loadImage("playerSprite2.png");
  pointerSprite = loadImage("pointerSprite.png");
  enemySprite = loadImage("enemySprite.png");
  fireBall = loadImage("fireBall.png");
  sprite = loadImage("Box2D.png");
  floorSprite = loadImage("floorSprite.png");
  rightWallSprite = loadImage("rightWallSprite.png");
  leftWallSprite = loadImage("leftWallSprite.png");
  backgroundSprite = loadImage ("backgroundSprite.png");
  rightBranchSprite = loadImage("rightBranchSprite.png");
  leftBranchSprite = loadImage("leftBranchSprite.png");
  
  enemy = new ArrayList<Enemy>();
  player = new Player(width/2, height/2, playerSprite1, true);
  pointer = new Mouse (0, 0, pointerSprite);
  projectile = new Projectile (player._x, player._y, true);
  floor1 = new Floor (width/2, height -20, floorSprite, true);
  rightWall = new Floor (width/2 + floorSprite.width/2 -20, 330 -floorSprite.height, 
  rightWallSprite, true);
  leftWall = new Floor ( -floorSprite.width/2 +702, 330 -floorSprite.height, 
  leftWallSprite, true);
  rightBranch1 = new Floor( -1727, 835 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch2 = new Floor( -1727, 385 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch3 = new Floor( -1727, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch4 = new Floor( -960, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch5 = new Floor( -540, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch6 = new Floor( -165, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch7 = new Floor( 250, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch8 = new Floor( 625, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch9 = new Floor( 1045, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch10 = new Floor( 1770, -35 -floorSprite.height, 
  rightBranchSprite, true);
  rightBranch11 = new Floor( 2490, -35 -floorSprite.height, 
  rightBranchSprite, true);
  leftBranch1 = new Floor( -1482, 585 -floorSprite.height, 
  leftBranchSprite, true);
  leftBranch2 = new Floor( -1482, 135 -floorSprite.height, 
  leftBranchSprite, true);
  leftBranch3 = new Floor( -1482, -385 -floorSprite.height, 
  leftBranchSprite, true);
  leftBranch4 = new Floor( 1600, -35 -floorSprite.height, 
  leftBranchSprite, true); 
  leftBranch5 = new Floor( 2320, -35 -floorSprite.height, 
  leftBranchSprite, true); 
  leftBranch6 = new Floor( 2960, -35 -floorSprite.height, 
  leftBranchSprite, true);  
  leftBranch7 = new Floor( 3310, -285 -floorSprite.height, 
  leftBranchSprite, true);  
}

void draw()
{ 
  box2d.step();
  background(0);
 
  camera(width/2.0 + cameraX, height/2.0 + cameraY, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0 + cameraX, height/2.0 + cameraY, 0, 
  0, 1, 0);
  
  image(backgroundSprite, 713, -35);
  
  if (random(1) <= 0.005)
  {
    enemy.add(new Enemy (random (floor1._img.width) - floor1._img.width/2 + width/2, 
    random (height) -100, enemySprite, true));
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
  
  player.Display();
     
  projectile.Display();
  
  floor1.Draw();
  rightWall.Draw();
  leftWall.Draw();
  rightBranch1.Draw();
  rightBranch2.Draw();
  rightBranch3.Draw();
  rightBranch4.Draw();
  rightBranch5.Draw();
  rightBranch6.Draw();
  rightBranch7.Draw();
  rightBranch8.Draw();
  rightBranch9.Draw();
  rightBranch10.Draw();
  rightBranch11.Draw();
  leftBranch1.Draw();
  leftBranch2.Draw();
  leftBranch3.Draw();
  leftBranch4.Draw();
  leftBranch5.Draw();
  leftBranch6.Draw();
  leftBranch7.Draw();
  
  pointer.Display();
}