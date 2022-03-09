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
}
