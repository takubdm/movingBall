public class Constant
{
  private String filename;
  public Constant(String filename)
  {
    this.filename = filename;
  }
  private Map parameters = new HashMap()
  {
    {
        put("INITIAL_BALL_NUM", 5);
        put("BALL_SIZE", 10);
    }
  };
  public void set(String k, Float v)
  {
    parameters.replace(k, v);
  }
}