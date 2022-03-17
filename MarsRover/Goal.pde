public class Goal {
  PVector pos;
  final int SIZE = 25;
  
  public Goal() {
    pos = new PVector(random(width),random(height));
  }
  
  public void show() {
    fill(0,255,0);
    square(pos.x,pos.y,SIZE);
  }
}
