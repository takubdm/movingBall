
public class Debug
{
  private final float AXL = 20;
  private boolean isEnabled = true;
  private Balls balls;
  private Line line;
  private boolean isLoop = true;
  public Debug()
  {
  }
  public void registBalls(Balls balls)
  {
    this.balls = balls;
  }
  public void registLine(Line line)
  {
    this.line = line;
  }
  public void dumpTriangle()
  {
    ArrayList<int[]> triConnection = triangle.getTriConnection();
    for (int[] t : triConnection)
    {
      System.out.println(t[0] + ", " + t[1] + ", " + t[2]);
    }
    System.out.println();
  }
  public void dumpConnection()
  {
    ArrayList connections = line.getConnection();
    int startSize = connections.size();
    for (int s = 0; s < startSize; s++)
    {
      int startId = s;
      ArrayList connection = (ArrayList)connections.get(s);
      int endSize = connection.size(); 
      for (int e = 0; e < endSize; e++)
      {
        int endId = (int)connection.get(e);
        System.out.println(startId + ", " + endId);
      }
    }
    System.out.println();
  }
  public void showId(float tSize, color tColor, float offsetX, float offsetY)
  {
    if (!isEnabled) return;
    ArrayList<Ball> ballList = balls.getBalls();
    fill(tColor);
    for(Ball b : ballList)
    {
      Map<String, Float> ballPosition = b.getPosition();
      float bx = ballPosition.get("x");
      float by = ballPosition.get("y");
      textSize(tSize);
      text(b.getId(), bx + offsetX, by + offsetY); 
    }
  }
  public void showDistance(color c)
  {
    if (!isEnabled) return;
    ArrayList<Ball> ballList = balls.getBalls();
    float distance = line.distance;
    for(Ball b : ballList)
    {
      Map<String, Float> ballPosition = b.getPosition();
      float bx = ballPosition.get("x");
      float by = ballPosition.get("y");
      noStroke();
      fill(c);
      ellipseMode(CENTER);
      ellipse(bx, by, distance, distance);
    }
  }
  public void showBallAliveRegion(float[] r, color c)
  {
    if (!isEnabled) return;
    float x1 = r[0];
    float y1 = r[1];
    float x2 = r[2];
    float y2 = r[3];
    noStroke();
    fill(c);
    rect(x1, y1, x2 - x1, y2 - y1);
  }
  public void showBallGenerateRegion(float[] r, color c)
  {
    if (!isEnabled) return;
    float x1 = r[0];
    float y1 = r[1];
    float x2 = r[2];
    float y2 = r[3];
    noStroke();
    fill(c);
    rect(x1, y1, x2 - x1, y2 - y1);
  }
  private void refresh()
  {
    if (!isLoop)
    {
      balls.suspend(true);
      redraw(); 
    }
  }
  private void start()
  {
    isLoop = true;
    balls.suspend(false);
    loop();
  }
  private void stop()
  {
    isLoop = false;
    balls.suspend(true);
    noLoop();
  }
  public void keyPressed(char k)
  {
    if (k == 'd')
    {
      isEnabled = !isEnabled;
      refresh();
    }
    switch(k)
    {
      case 'c':
        dumpConnection();
        break;
      case 't':
        dumpTriangle();
        break;
      case ENTER:
        start();
        break;
      case 'g':
        balls.generate(); 
        refresh();
        break;
      case 'r':
        balls.reset(); 
        line.reset();
        triangle.reset();
        redraw(); 
        break;
      case ' ':
        stop();
        balls.suspend(false);
        redraw(); 
        break;
    }
  }
} 
