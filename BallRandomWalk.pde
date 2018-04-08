public class BallRandomWalk extends Ball
{
  float[] ballAliveRegion;
  private int cnt = 0;
  private final int CNT_MIN = 40;
  private final int CNT_MAX = 100;
  public BallRandomWalk(int id, float ballSize, float[] ballAliveRegion)
  {
    super(id, ballSize);
    this.ballAliveRegion = ballAliveRegion;
  }
  public void move(float axl)
  {
    if (cnt > random(CNT_MIN, CNT_MAX))
    {
      super.setAcceralation(
        cos(radians(random(0, 360))), 
        sin(radians(random(0, 360)))
      );
      cnt = 0;
    }
    float arx1 = ballAliveRegion[0];
    float ary1 = ballAliveRegion[1];
    float arx2 = ballAliveRegion[2];
    float ary2 = ballAliveRegion[3];
    float nextX = super.x + super.ax * axl;
    float nextY = super.y + super.ay * axl;
    boolean isInsideX = (nextX >= arx1 + super.ballSize / 2 && nextX <= arx2 - super.ballSize / 2);
    boolean isInsideY = (nextY >= ary1 + super.ballSize / 2 && nextY <= ary2 - super.ballSize / 2);
    if (!isInsideX) super.ax *= -1;
    if (!isInsideY) super.ay *= -1;
    super.x += super.ax * axl;
    super.y += super.ay * axl;
    cnt++;
  }
} 
