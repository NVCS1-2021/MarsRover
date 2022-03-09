public class Surface {
  public float[][] terrain;
  
  public Surface(float w, float h) {
    terrain = new float[(int)h][(int)w];
    float xOff = 0.0, yOff = 0.0, inc = 0.01;
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        terrain[i][j] = noise(xOff,yOff);
        yOff += inc;
      }
      xOff += inc;
    }
  }
  
  public void show() {
    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[0].length; j++) {
        System.out.println(terrain[i][j]);
        
      }
    }
  }
}
