
public class Debug
{
  private final float AXL = 20;
  private boolean isEnabled = true;
  private Balls balls;
  private Line line;
  private boolean isLoop = true;
  public Debug()
  {
    toggleLoop();
  }
  public void registBalls(Balls balls)
  {
    this.balls = balls;
  }
  public void registLine(Line line)
  {
    this.line = line;
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
  public void toggleLoop()
  {
    if (isLoop)
    {
      noLoop();
    }
    else
    {
      loop();
    }
    isLoop = !isLoop;
  }
  public void keyPressed(char k)
  {
    if (k == 'd')
    {
      isEnabled = !isEnabled;
    }
    switch(k)
    {
      case 'f':
        toggleLoop(); break;
      case 'g':
        balls.generate(); break;
      case 'r':
        balls.reset(); break;
      case ' ':
        redraw(); break;
    }
  }
} 
