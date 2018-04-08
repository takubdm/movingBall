public class BallCurve extends Ball
{
  float[] ballAliveRegion;
  private int cnt;
  private float curveX;
  private float curveY;
  public BallCurve(int id, float ballSize, float[] ballAliveRegion)
  {
    super(id, ballSize);
    this.ballAliveRegion = ballAliveRegion;
    curveX = random(-3, 3);
    curveY = random(-3, 3);
  }
  public void move(float axl)
  {
    super.setAcceralation(
      cos(radians(cnt * curveX)) * random(1, 1.5), 
      sin(radians(cnt * curveY)) * random(1, 1.5)
    );
    super.x += super.ax * axl;
    super.y += super.ay * axl;
    cnt++;
  }
} 
