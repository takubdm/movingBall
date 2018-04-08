public class BallBounce extends Ball
{
  float[] ballAliveRegion;
  public BallBounce(int id, float ballSize, float[] ballAliveRegion)
  {
    super(id, ballSize);
    this.ballAliveRegion = ballAliveRegion;
  }
  public void move(float axl)
  {
    float arx1 = ballAliveRegion[0];
    float ary1 = ballAliveRegion[1];
    float arx2 = ballAliveRegion[2];
    float ary2 = ballAliveRegion[3];
    float nextX = super.x + super.ax * axl;
    float nextY = super.y + super.ay * axl;
    boolean isInsideX = (nextX >= arx1 && nextX <= arx2);
    boolean isInsideY = (nextY >= ary1 && nextY <= ary2);
    if (!isInsideX) super.ax *= -1;
    if (!isInsideY) super.ay *= -1;
    super.x += super.ax * axl;
    super.y += super.ay * axl;
  }
} 
