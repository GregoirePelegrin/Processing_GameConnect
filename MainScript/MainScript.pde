// Multiple class of block, bc the boolean[] is passed by referrence (same for every block)

int nbrIssuesPerBlock;
int sizeBlocks;

ArrayList<Block> puzzle;

void setup(){
  size(600, 600);
  frameRate(30);
  
  nbrIssuesPerBlock = 4;
  sizeBlocks = 50;
  
  puzzle = new ArrayList<Block>();
  boolean[] n = new boolean[4];
  n[0] = false;
  n[1] = false;
  n[2] = true;
  n[3] = false;
  boolean[] s = new boolean[4];
  s[0] = true;
  s[1] = false;
  s[2] = false;
  s[3] = false;
  Block block = new Block(width/2, height/2, n, s);
  puzzle.add(block);
  boolean[] n2 = new boolean[4];
  n2[0] = false;
  n2[1] = false;
  n2[2] = false;
  n2[3] = true;
  boolean[] s2 = new boolean[4];
  s2[0] = true;
  s2[1] = false;
  s2[2] = false;
  s2[3] = false;
  block = new Block(width/2+sizeBlocks, height/2, n2, s2);
  puzzle.add(block);
}

void draw(){
  background(0);
  noFill();
  
  for(Block block : puzzle){
    block.display();
  }
  
  if(verify()){
    noLoop();
    println("Well played!");
  }
}

void mousePressed(){
  for(Block block : puzzle){
    block.contains(mouseX, mouseY);
  }
}

boolean verify(){
  boolean verif = true;
  
  for(Block block : puzzle){
    for(int i=0; i<block.neighbours.length; i++){
      if(block.issues[i] && !block.neighbours[i]){
        verif = false;
      }
    }
  }
  
  return verif;
}
