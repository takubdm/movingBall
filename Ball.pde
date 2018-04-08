import java.util.HashMap;
import java.util.Map;

public class Ball
{
  private int id;
  private float x;
  private float y;
  private float ax;
  private float ay;
  private float ballSize;
  public Ball(int id, float ballSize)
  {
    this.id = id;
    this.ballSize = ballSize;
  }
  public Map<String, Float> getPosition()
  {
    return new HashMap<String, Float>()
    {
      {
        put("x", x);
        put("y", y);
      }
    };
  }
  public void setPosition(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  public void setAcceralation(float ax, float ay)
  {
    this.ax = ax;
    this.ay = ay;
  }
  public void draw()
  {
    ellipse(x, y, ballSize, ballSize);
  }
  public void move(float axl)
  {
    this.x += ax * axl;
    this.y += ay * axl;
  }
  public int getId()
  {
    return id;
  }
} 
