public final float SCALE = 5.0;
public Rover rover;
public Surface surface;

public void setup() {
  size(800,800); 
  rover = new Rover(new PVector(80,80));
  surface = new Surface(width/SCALE,height/SCALE);
}

public void draw() {
  background(220);   //<>//
  surface.show();
  rover.show();
  rover.move(surface.terrain);
}
