public class Rover {
  public PVector pos;
  public PImage img;
  public float SIZE;
  
  public Rover(PVector spawnPoint) {
    this.pos = spawnPoint;
    this.img = loadImage("rover.png");
    this.SIZE = SCALE * 5;
    imageMode(CENTER);
  }
  
  public void show() {
    image(img,pos.x,pos.y,SIZE,SIZE);
  }
  
  public void move(float[][] terrain, Goal g) {    
    PVector vel = pursue(terrain, g);
    pos.add(vel);
  }
  
  public PVector safestDirection(float[][] terrain) {
    PVector dir = new PVector(0,0);
    float nearest = Float.MAX_VALUE;
    float currAlt = terrain[(int)(pos.y/SCALE)][(int)(pos.x/SCALE)];
    for (int i = -1; i <= 1; i++) {
       for (int j = -1; j <= 1; j++) {
         if (i == 0 && j == 0) continue;
         float alt = terrain[(int)(pos.y/SCALE)+i][(int)(pos.x/SCALE)+j];
         float change = alt - currAlt;
         if (change < nearest) {
           dir = new PVector(j,i);
           nearest = change;
         }
       }
    }
    return dir;
  }
  public PVector pursue(float[][] terrain, Goal g) {
    PVector toTarget = PVector.sub(g.pos,pos).limit(1);
    PVector dir = new PVector(0,0);
    float nearest = Float.MAX_VALUE;
    float currAlt = terrain[(int)(pos.y/SCALE)][(int)(pos.x/SCALE)];
    for (int i = -1; i <= 1; i++) {
       for (int j = -1; j <= 1; j++) {
         if (i == 0 && j == 0) continue;
         PVector maybeDir = new PVector(j,i);
         if (PVector.angleBetween(toTarget,maybeDir) < HALF_PI) continue; //<>//
         float alt = terrain[(int)(pos.y/SCALE)+i][(int)(pos.x/SCALE)+j];
         float change = Math.abs(alt - currAlt);
         if (change < nearest) {
           dir = new PVector(j,i);
           nearest = change;
         }
       }
    }
    dir.rotate(PI); //why?
    System.out.println(PVector.angleBetween(dir,toTarget));
    return dir;
  }
}
