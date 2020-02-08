// table holding our data
Table table;

// each 'line' is a shape defined by set of vertices
int currentRow = -1;

void setup() {
  size(700, 860);
  background(0);
  stroke(255);
  noFill();
  
  // https://raw.githubusercontent.com/coolbutuseless/CP1919/master/data-raw/clean.csv
  table = loadTable("data.csv", "header");
}

void draw() {
  for (TableRow row : table.rows()) {
    int rowNum = row.getInt("line");
    Float x = row.getFloat("x");
    Float y = row.getFloat("y");

    if (rowNum != currentRow) {
      startNextRow(rowNum);
    }

    curveVertex(x + 40, 820 - y);
  }
  endShape();
  noLoop();
}

// close off the current row
void startNextRow(int rowNum){
  endShape();
  currentRow = rowNum;
  beginShape();
}
