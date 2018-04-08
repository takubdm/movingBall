Debug dbg;
//Constant constant;
Balls balls;
Line line;
Triangle triangle;
int INITIAL_BALL_NUM = 5;
int BALL_SIZE = 10;
float[] BALL_GENERATE_REGION = { 100, 100, 300, 300 };
float[] BALL_ALIVE_REGION = { 0, 0, 800, 600 };
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
  balls.setSpeed(3.0);
  line = new Line(balls);
  //line = new LineDelayed(balls, 5);
  triangle = new Triangle(balls, line);
  dbg = new Debug();
  dbg.registBalls(balls);
  dbg.registLine(line);
}

void draw()
{
  background(#222222);
  balls.move();
  //dbg.showBallAliveRegion(BALL_ALIVE_REGION, color(#00FFCC, 100));
  //dbg.showBallGenerateRegion(BALL_GENERATE_REGION, color(#FFFFCC, 100));
  //dbg.showDistance(color(#FF9999, 100));
  dbg.showId(14, color(#FFFFFF), 10, -10);
  stroke(#CCCCCC); noStroke(); noFill(); line.draw();
  noStroke(); stroke(#CCCCCC); fill(color(#999999, 50)); triangle.draw();
  stroke(#FFFFFF); fill(#000000); noStroke(); noFill(); balls.draw();
  //output.println(mouseX + "t" + mouseY); // Write the coordinate to the file
}
void mousePressed()
{
  switch(mouseButton)
  {
    case LEFT:
      balls.generate(); 
      break;
    case RIGHT:
      balls.reset(); 
      line.reset();
      triangle.reset();
      redraw();
      break;
  }
}
void keyPressed()
{
  dbg.keyPressed(key);
  //output.flush(); // Writes the remaining data to the file
  //output.close(); // Finishes the file
  //exit(); // Stops the program
}
