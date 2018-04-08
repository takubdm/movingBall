public class Line
{
  public float distance = 150;
  private Balls balls;
  private Map<String, ArrayList> connection = new HashMap<String, ArrayList>();
  private int lastConnectedId = -1;
  public Line(Balls balls)
  {
    this.balls = balls;
  }
  public void reset()
  {
    connection.clear();
    lastConnectedId = -1;
  }
  public void draw()
  {
    connection.clear();
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
          drawLine(b1, b2);
          cBallId.add(b2.getId());
          if (lastConnectedId < b2.getId()) lastConnectedId = b2.getId();
        }
      }
      //System.out.println(b1.getId() + " / " + connection);
      connection.put(String.valueOf(b1.getId()), cBallId);
    }
  }
  private void drawLine(Ball b1, Ball b2)
  {
    Map<String, Float> bp1 = b1.getPosition();
    Map<String, Float> bp2 = b2.getPosition();
    float bx1 = bp1.get("x");
    float by1 = bp1.get("y");
    float bx2 = bp2.get("x");
    float by2 = bp2.get("y");
    line(bx1, by1, bx2, by2);
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
    if (dist(bx1, by1, bx2, by2) <= distance)
    {
      isNear = true;
    }
    return isNear;
  }
  public int getLastConnectedId()
  {
    return lastConnectedId;
  }
  public Map<String, ArrayList> getConnection()
  {
    return connection;
  }
} 
