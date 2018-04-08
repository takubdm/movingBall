import java.util.*;

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
    checkConnection();
    for (int[] tc : triConnection)
    {
      int id1 = tc[0];
      int id2 = tc[1];
      int id3 = tc[2];
      Ball b1 = balls.getBall(id1);
      Ball b2 = balls.getBall(id2);
      Ball b3 = balls.getBall(id3);
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
    Map<String, ArrayList> connections = line.getConnection();
    if (connections.size() < 3) return;
    int lastId = line.getLastConnectedId();
    
    Set<String> con = connections.keySet();
    for (Iterator<String> n = con.iterator(); n.hasNext();)
    {
      String startId = n.next();
      ArrayList connectionSM = (ArrayList)connections.get(startId);
      int middleSize = connectionSM.size();
      if (middleSize < 2) continue;
      for (int m = 0; m < middleSize; m++)
      {
        int middleId = (int)connectionSM.get(m);
        if (middleId == lastId) continue;
        ArrayList connectionME = (ArrayList)connections.get(String.valueOf(middleId));
        int endSize = connectionME.size();
        for (int e = 0; e < endSize; e++)
        {
          int endId = (int)connectionME.get(e);
          if (connectionSM.indexOf(endId) > -1)
          {
            int[] nodeIds = { Integer.parseInt(startId), middleId, endId };
            triConnection.add(nodeIds);
          }
        }
      }
    }
  }
} 
