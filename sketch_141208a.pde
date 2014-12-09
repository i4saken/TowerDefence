


static int _Width = 800; // set me

static float x1, y1;
static int _Height = (int)(_Width * .8);
static float PlaySection = _Width * .65;
static float gridSize = _Width/20;
static float menuTop = PlaySection + 1;
static float menuHeight = _Height - menuTop;
Tower tower1;
Cell[][] Grid = new Cell[20][13];


PImage field;
PImage path;
PImage pathMask;
PImage tower;
void setup() {
  size(_Width, _Height);
  tower1=new Tower();

  //initialize Grid
  for (int x = 0; x < Grid.length; x++) {
    for (int y = 0; y < Grid[0].length; y++) {
      Grid[x][y] = new Cell(x, y);
    }
  }
  //------
  tower=loadImage("t1.png");
  field = loadImage("grass.png");
  path = loadImage("dirt.png");
  pathMask = loadImage("dirt-mask.png");
  path.mask(pathMask);
}

void draw() {
  
  image(field, 0, 0, width, PlaySection);
  image(path, 0, 0, width, PlaySection);
  tower1.render();
  mouseCheck();

  //render tower on the grid the mouse is on----
  if (mouseY<PlaySection) {
    int x = (int)(mouseX / gridSize);
    int y = (int)(mouseY / gridSize);
    float gridTopLeft=Grid[x][y].x*gridSize;
    float gridBotRight=Grid[x][y].y*gridSize;
    image(tower, gridTopLeft, gridBotRight, gridSize, gridSize);
  }
  //-------
}

void mouseCheck() {
  int x = (int)(mouseX / gridSize);
  int y = (int)(mouseY / gridSize);

  if (x < Grid.length && y < Grid[0].length)Grid[x][y].gridBox();
}

class Cell {
  int x;
  int y;

  void gridBox() {
    noFill();
    stroke(#00FF00);
    rect(x * gridSize, y * gridSize, gridSize, gridSize);
  }

  Cell(int _x, int _y) {
    x = _x;
    y = _y;
  }
}

class Tower {
  float x;
  float y;
  Tower() {
  }
  void render() {
    image(tower, x1, y1, gridSize, gridSize);
  }
}

void mousePressed() {
  int x = (int)(mouseX / gridSize);
  int y = (int)(mouseY / gridSize);
  float gridTopLeft=Grid[x][y].x*gridSize;
  float gridBotRight=Grid[x][y].y*gridSize;
  x1=gridTopLeft;
  y1=gridBotRight;
}

