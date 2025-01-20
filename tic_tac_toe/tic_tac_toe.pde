char[][] board = new char[3][3];
float unitH;
float unitW;
boolean isXTurn = true;
void setup () {
  size(900, 900);
  unitH = height/3;
  unitW = width/3;
  initTable();//initierer tabellen med blanke.x
  textAlign(CENTER, CENTER);
}

void draw () {
  background(255);
  drawBoard();
  hasWon();
}

void drawBoard() {
  line(0, unitH, width, unitH);
  line(0, unitH*2, width, unitH*2);
  line(unitW, 0, unitW, height);
  line(unitW*2, 0, unitW*2, height);
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      fill(125);
      pushMatrix();
      translate(i*unitW, j*unitH);
      textSize(100);
      text(board[i][j], unitW/2, unitH/2);
      popMatrix();
    }
  }
}

void mousePressed() {
  int indexX =int(mouseX/unitW);
  int indexY =int(mouseY/unitH);
  if (isXTurn) {
    board[indexX][indexY]='X';
  } else {
    board[indexX][indexY]='O';
  }
  isXTurn=!isXTurn;
}
void initTable() {
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      board[i][j]=' ';
    }
  }
}

// lots of chatgpt
void hasWon() {
  if (
    (board[0][0]==(board[0][1]) && board[0][1]==(board[0][2]) && board[0][0]!=' ') ||
    (board[1][0]==(board[1][1]) && board[1][1]==(board[1][2]) && board[1][0]!=' ') ||
    (board[2][0]==(board[2][1]) && board[2][1]==(board[2][2]) && board[2][0]!=' ') ||

    (board[0][0]==(board[1][0]) && board[1][0]==(board[2][0]) && board[0][0]!=' ') ||
    (board[0][1]==(board[1][1]) && board[1][1]==(board[2][1]) && board[0][1]!=' ') ||
    (board[0][2]==(board[1][2]) && board[1][2]==(board[2][2]) && board[0][2]!=' ') ||

    (board[0][0]==(board[1][1]) && board[1][1]==(board[2][2]) && board[0][0]!=' ') ||
    (board[0][2]==(board[1][1]) && board[1][1]==(board[2][0]) && board[0][2]!=' ')
    ) {
    noLoop();
    println("won");
  }
}
