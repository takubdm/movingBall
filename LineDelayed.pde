

public class LineDelayed extends Line
{
  private PGraphics pg;
  public LineDelayed(Balls balls, int delayNum)
  {
    super(balls);
    pg = createGraphics(width, height);
  }
  public void noStroke()       { pg.noStroke(); }
  public void stroke(color c)  { pg.stroke(c); }
  public void noFill()         { pg.noFill(); }
  public void fill(color c)    { pg.fill(c); }
  public void draw()
  {
    pg.beginDraw();
    tint(255, 100);
    image(pg, 0, 0);
    ArrayList<Ball> ballList = balls.getBalls();
    int blSize = ballList.size();
    for (int i = 0; i < blSize - 1; i++)
    {
      for (int i2 = i + 1; i2 < blSize; i2++)
      {
        Ball b1 = ballList.get(i);
        Ball b2 = ballList.get(i2);
        if (super.isNear(b1, b2))
        {
          drawLine(b1, b2);
        }
      }
    }
    pg.endDraw();
  }
  private void drawLine(Ball b1, Ball b2)
  {
    Map<String, Float> bp1 = b1.getPosition();
    Map<String, Float> bp2 = b2.getPosition();
    float bx1 = bp1.get("x");
    float by1 = bp1.get("y");
    float bx2 = bp2.get("x");
    float by2 = bp2.get("y");
    pg.line(bx1, by1, bx2, by2);
  }
} 
