class StigField {
  float[][] stig;
  int cols, rows;
  float xRes, yRes;

  StigField(int cols, int rows, float xRes, float yRes) {
    this.cols = cols;
    this.rows = rows;
    this.xRes = xRes;
    this.yRes = yRes;
    stig = new float[cols][rows];
    initField();
  }

  StigField(PApplet p5) {
    this(p5.width, p5.height, 1, 1);
  }

  void initField() {
    for (int i=0; i< cols; i++) {
      for (int j=0; j< rows; j++) {
        stig[i][j]=0;
      }
    }
  }

  void evaporate(float t) {
    for (int i=0; i< cols; i++) {
      for (int j=0; j< rows; j++) {
        stig[i][j]*=t;
      }
    }
  }

  float read(Vec3D loc) {
    int col = int(constrain(loc.x/xRes, 0, cols-1));
    int row = int(constrain(loc.y/yRes, 0, rows-1));
    return stig[col][row];
  }

  void write(Vec3D loc, float s) {
    int col = int(constrain(loc.x/xRes, 0, cols-1));
    int row = int(constrain(loc.y/yRes, 0, rows-1));
    stig[col][row]= constrain(stig[col][row]+s, 0, 1);
  }


  void display() {
    PGraphics pg;
    int ind;
    pg = createGraphics(cols, rows, JAVA2D);
    pg.loadPixels();
    for (int i=0; i< cols; i++) {
      for (int j=0; j< rows; j++) {
        ind = j*cols+i;
        pg.pixels[ind]=color(stig[i][j]*255);
      }
    }
    pg.updatePixels();
    image(pg,0,0);
  }
}
