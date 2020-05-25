import java.util.Arrays;
//DEATH
//4 or more
//1 or fewer

//BIRTH
//EXACTLY 3 cells

//IDLENESS
//Else cases

int sizeSquare = 20;
int board[][];
int currentGeneration = 0;
int cols;
int rows;

void setup(){
  size(1000, 1000);
  cols = int(height/sizeSquare);
  rows = int(width/sizeSquare);
  board = new int[rows][cols];  
  frameRate(24);
  populate();
  startBoard();
}

void draw(){
  live();
  startBoard();
  currentGeneration++;
}

void live(){
  
  int [][] next = new int[rows][cols];
  
  for(int x = 0; x < rows; x++){
    for(int y = 0; y < cols; y++){
      int neighbors = 0;
      for(int a = -1; a <= 1; a++){
        for(int b = -1; b <= 1; b++){ 
          neighbors += board[(x+a+rows)%rows][(y+b+cols)%cols];
        }
      }
      neighbors -= board[x][y];
      if(board[x][y] == 1 && neighbors > 3){
        next[x][y] = 0;
      }
      else if(board[x][y] == 1 && neighbors < 2){
        next[x][y] = 0;
      }
      else if(neighbors == 3 && board[x][y] == 0){
        next[x][y] = 1;
      }
      else{
        next[x][y] = board[x][y];
      }
    }
  }
  board = next;
}

void startBoard(){
  for(int i = 0; i < (rows); i++){
    for(int j = 0; j < (cols); j++){
      if(board[i][j] == 1){
        fill(0, 0, 0);
      }
      else{
        fill(255, 255, 255);
      }
      rect(i*sizeSquare, j*sizeSquare, sizeSquare, sizeSquare);
    }
  }
}

void populate(){
  for(int i = 1; i < (rows)-1; i++){
    for(int j = 1; j < (cols)-1; j++){
      board[i][j] = int(random(2));
    }
  }
}
