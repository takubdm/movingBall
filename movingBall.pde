Debug dbg;
//Constant constant;
Balls balls;
Line line;
int INITIAL_BALL_NUM = 5;
int BALL_SIZE = 10;
float[] BALL_GENERATE_REGION = { 100, 100, 300, 300 };
float[] BALL_ALIVE_REGION = { 50, 50, 600, 400 };
PrintWriter output;

void setup() {
  size(800, 600);
  frameRate(60);
  //noSmooth();
  output = createWriter("positions.txt");
  //constant = new Constant("positions.txt");
  balls = new Balls(BALL_SIZE);
  balls.setGenerateRegion(BALL_GENERATE_REGION);
  balls.setAliveRegion(BALL_ALIVE_REGION);
  balls.initialGenerate(INITIAL_BALL_NUM);
  line = new Line(balls);
  //line = new LineDelayed(balls, 5);
  dbg = new Debug();
  dbg.registBalls(balls);
  dbg.registLine(line);
}

void draw()
{
  background(0);
  balls.move(5);
  dbg.showBallAliveRegion(BALL_ALIVE_REGION, color(#00FFCC, 100));
  dbg.showBallGenerateRegion(BALL_GENERATE_REGION, color(#FFFFCC, 100));
  dbg.showDistance(color(#FF9999, 100));
  stroke(#00FF00); noFill(); line.draw();
  stroke(#FFFFFF); fill(#000000); balls.draw();
  //output.println(mouseX + "t" + mouseY); // Write the coordinate to the file
}

void keyPressed()
{
  dbg.keyPressed(key);
  //output.flush(); // Writes the remaining data to the file
  //output.close(); // Finishes the file
  //exit(); // Stops the program
}