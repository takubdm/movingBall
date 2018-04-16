public class LineFaded extends Line
{
  public float distanceFade = 80;
  public LineFaded(Balls balls)
  {
    super(balls);
  }
  public void draw()
  {
    super.connection.clear();
    stroke(lineColor);
    ArrayList<Ball> ballList = balls.getBalls();
    int blSize = ballList.size();
    for (int i = 0; i < blSize - 1; i++)
    {
      Ball b1 = ballList.get(i);
      ArrayList<Integer> cBallId = new ArrayList<Integer>();
      for (int i2 = i + 1; i2 < blSize; i2++)
      {
        Ball b2 = ballList.get(i2);
        if (isNear(b1, b2))
        {
          int alpha = getOpacity(b1, b2);
          stroke(lineColor, alpha);
          super.drawLine(b1, b2);
          cBallId.add(b2.getId());
          if (super.lastConnectedId < b2.getId()) super.lastConnectedId = b2.getId();
        }
      }
      //System.out.println(b1.getId() + " / " + connection);
      super.connection.put(String.valueOf(b1.getId()), cBallId);
    }
  }
  private int getOpacity(Ball b1, Ball b2)
  {
    int alpha = 255;
    Map<String, Float> bp1 = b1.getPosition();
    Map<String, Float> bp2 = b2.getPosition();
    float bx1 = bp1.get("x");
    float by1 = bp1.get("y");
    float bx2 = bp2.get("x");
    float by2 = bp2.get("y");
    float distBalls = dist(bx1, by1, bx2, by2);
    if (distBalls > distance && distBalls <= distance + distanceFade)
    {
      float ratio = (distance + distanceFade - distBalls) / distanceFade;
      alpha = parseInt(255 * ratio);
    }
    return alpha;
  }
  private boolean isNear(Ball b1, Ball b2)
  {
    boolean isNear = false;
    Map<String, Float> bp1 = b1.getPosition();
    Map<String, Float> bp2 = b2.getPosition();
    float bx1 = bp1.get("x");
    float by1 = bp1.get("y");
    float bx2 = bp2.get("x");
    float by2 = bp2.get("y");
    if (dist(bx1, by1, bx2, by2) <= distance + distanceFade)
    {
      isNear = true;
    }
    return isNear;
  }
} 
