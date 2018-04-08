import java.util.ConcurrentModificationException;

public class Balls
{
  private ArrayList<Ball> balls = new ArrayList<Ball>();
  private float[] ballAliveRegion = new float[4];
  private float[] ballGenerateRegion = new float[4];
  private int initialBallNum;
  private float ballSize;
  private int id = 0;
  private float speed, speedOriginal;
  public Balls(float ballSize)
  {
    this.ballSize = ballSize;
  }
  public void setGenerateRegion(float[] ballGenerateRegion)
  {
    this.ballGenerateRegion = ballGenerateRegion;
  }
  public void setAliveRegion(float[] ballAliveRegion)
  {
    this.ballAliveRegion = ballAliveRegion;
  }
  public void initialGenerate(int num)
  {
    initialBallNum = num;
    for (int i=0; i<num; i++)
    {
      generate();
    }
  }
  public void reset()
  {
    balls.clear();
    id = 0;
    initialGenerate(initialBallNum);
  }
  public Ball getBall(int id)
  {
    Ball ball = null;
    for (Ball b : balls)
    {
      if (b.getId() == id)
      {
        ball = b;
        break;
      }
    }
    return ball;
  }
  public ArrayList<Ball> getBalls()
  {
    return balls;
  }
  public int getNum()
  {
    return balls.size();
  }
  public void draw() throws ConcurrentModificationException
  {
    ArrayList<Ball> killList = new ArrayList<Ball>();
    ellipseMode(CENTER);
    for(Ball b : balls)
    {
      b.draw();
      if (!isAlive(b))
      {
        killList.add(b);
      }
    }
    for(Ball b : killList)
    {
      balls.remove(b);
      generate();
    }
  }
  public void setSpeed(float speed)
  {
    this.speed = speed;
    speedOriginal = speed;
  }
  public void suspend(boolean suspend)
  {
    if (suspend)
    {
      speed = 0;
    }
    else
    {
      speed = speedOriginal;
    }
  }
  public void move()
  {
    for(Ball b : balls)
    {
      b.move(speed);
    }
  }
  private boolean isAlive(Ball b)
  {
    boolean isAlive = true;
    float arx1 = ballAliveRegion[0];
    float ary1 = ballAliveRegion[1];
    float arx2 = ballAliveRegion[2];
    float ary2 = ballAliveRegion[3];
    Map<String, Float> ballPosition = b.getPosition();
    float bx = ballPosition.get("x");
    float by = ballPosition.get("y");
    boolean isInsideX = (bx >= arx1 && bx <= arx2); 
    boolean isInsideY = (by >= ary1 && by <= ary2); 
    if (!isInsideX || !isInsideY)
    {
      isAlive = false;
    }
    return isAlive;
  }
  public void generate()
  {
    float x1 = ballGenerateRegion[0];
    float y1 = ballGenerateRegion[1];
    float x2 = ballGenerateRegion[2];
    float y2 = ballGenerateRegion[3];
    float x = random(x1, x2);
    float y = random(y1, y2);
    Ball b = new Ball(id++, ballSize);
    //Ball b = new BallBounce(id++, ballSize, ballAliveRegion);
    b.setPosition(x, y);
    b.setAcceralation(random(-1, 1), random(-1, 1));
    balls.add(b);
  }
} 
