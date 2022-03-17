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
  
  public void move(float[][] terrain) {    
    PVector vel = safestDirection(terrain);
    prePos = pos.copy();
    pos.add(vel);
  }
  
  public PVector safestDirection(float[][] terrain) {
    PVector dir = new PVector(0,0);
    float nearest = Float.MAX_VALUE;
    float currAlt = terrain[(int)pos.y][(int)pos.x];
    for (int i = -1; i <= 1; i++) {
       for (int j = -1; j <= 1; j++) {
         if (i == 0 && j == 0) continue;
         PVector maybePos = new PVector(pos.x+j,pos.y+i);
         if (PVector.sub(maybePos,prePos).mag() < 0.01) continue;
         float alt = terrain[(int)pos.y+i][(int)pos.x+j];
         float change = alt - currAlt;
         if (change < nearest) {
           dir = new PVector(j,i);
           nearest = change;
         }
       }
    }
    return dir;
  }
}
