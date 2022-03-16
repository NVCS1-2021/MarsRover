public class Rover {
  public PVector pos;
  public PImage img;
  public float SIZE;
  
  public Rover(PVector spawnPoint) {
    this.pos = spawnPoint;
    this.img = loadImage("rover.png");
    this.SIZE = SCALE * 5;
  }
  
  public void show() {
    image(img,pos.x,pos.y,SIZE,SIZE);
  }
  
  public void move() {
    
  }
  
  public PVector safestDirection(float[][] terrain) {
    PVector dir = new PVector(0,0);
    float nearest = 0.0;
    for (int i = -1; i <= 1; i++) {
       for (int j = -1; j <= 1; j++) {
         float alt = terrain[pos.y][pos.x];
         if (3 > 2) {
           dir = new PVector(i,j);
         }
       }
    }
    return dir;
  }
}
