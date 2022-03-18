public class Rover {
  public PVector pos;
  public PImage img;
  public float SIZE;
  public int[][] prevXYs = new int[10][2];
  public int steps = 0;
  
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
  
  /**
  * Adds an x,y pair to prevXYs matrix
  * Reuses spots, i.e. step 11 stored in index 0
  * @param x the x component of the position
  * @param y the y component of the position
  */
  private void addPrevPos(int x, int y) {
    int nextIndex = steps % prevXYs.length;
    
  }
  
  /**
  * Determines if an x,y pair is found within 
  * prevXYs matrix, indicating the position
  * has been recently visited
  * @param x the x component of the possible position
  * @param y the y component of the possible position
  * @return isPrevPos true when within prevXYs otherwise false 
  */
  private boolean isPrevPos(int x, int y) {
    
    return false;
  }
}
