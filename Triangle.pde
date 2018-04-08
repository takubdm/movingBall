public class Triangle
{
  private Balls balls;
  private Line line;
  private ArrayList<int[]> triConnection = new ArrayList<int[]>();
  public Triangle(Balls balls, Line line)
  {
    this.balls = balls;
    this.line = line;
  }
  public ArrayList<int[]> getTriConnection()
  {
    return triConnection;
  }
  public void reset()
  {
    triConnection.clear();
  }
  public void draw()
  {
    ArrayList<Ball> ballList = balls.getBalls(); 
    checkConnection();
    for (int[] tc : triConnection)
    {
      Ball b1 = ballList.get(tc[0]);
      Ball b2 = ballList.get(tc[1]);
      Ball b3 = ballList.get(tc[2]);
      Map<String, Float> bp1 = b1.getPosition();
      Map<String, Float> bp2 = b2.getPosition();
      Map<String, Float> bp3 = b3.getPosition();
      float bx1 = bp1.get("x");
      float by1 = bp1.get("y");
      float bx2 = bp2.get("x");
      float by2 = bp2.get("y");
      float bx3 = bp3.get("x");
      float by3 = bp3.get("y");
      triangle(bx1, by1, bx2, by2, bx3, by3);
    }
  }
  public void checkConnection()
  {
    triConnection.clear();
    ArrayList connections = line.getConnection();
    if (connections.size() < 3) return;
    int lastId = line.getLastConnectedId();
    int startSize = connections.size();
    for (int s = 0; s < startSize; s++)
    {
      int startId = s;
      ArrayList connectionSM = (ArrayList)connections.get(s);
      int middleSize = connectionSM.size();
      if (middleSize < 2) continue;
      for (int m = 0; m < middleSize; m++)
      {
        int middleId = (int)connectionSM.get(m);
        if (middleId == lastId) continue;
        ArrayList connectionME = (ArrayList)connections.get(middleId);
        int endSize = connectionME.size();
        for (int e = 0; e < endSize; e++)
        {
          int endId = (int)connectionME.get(e);
          if (connectionSM.indexOf(endId) > -1)
          {
            int[] nodeIds = { startId, middleId, endId };
            triConnection.add(nodeIds);
          }
        }
      }
    }
  }
} 
