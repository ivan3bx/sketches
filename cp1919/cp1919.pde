Table table;
int currentRow = -1;

void setup() {
  size(700, 860);
  background(0);
  stroke(255);
  fill(0);
  
  // https://raw.githubusercontent.com/coolbutuseless/CP1919/master/data-raw/clean.csv
  table = loadTable("data.csv", "header");
}

void draw() {
  beginShape();
  for (TableRow row : table.rows()) {
    int rowNum = row.getInt("line");
    Float x = row.getFloat("x");
    Float y = row.getFloat("y");
    if (rowNum != currentRow) {
      startNextRow(rowNum, x, y);
    }
    curveVertex(x + 40, 840-y);
  }

  endShape();
  noLoop();
}

// close off the current row
void startNextRow(int rowNum, Float x, Float y){
  curveVertex(10, 840 - y);
  endShape();
  currentRow = rowNum;
  beginShape();
  curveVertex(640, 840-y);
}
