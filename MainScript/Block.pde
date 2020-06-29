class Block{
  float xPos;
  float yPos;
  boolean[] neighbours;
  boolean[] issues;
  
  Block(float x, float y, boolean[] n, boolean[] i){
    this.xPos = x;
    this.yPos = y;
    this.neighbours = n;
    this.issues = i;
  }
  
  void contains(float x, float y){
    if((this.xPos-sizeBlocks/2 < x && this.xPos+sizeBlocks/2 > x) && (this.yPos-sizeBlocks/2 < y && this.yPos+sizeBlocks/2 > y)){
      this.update();
    }
  }
  
  void update(){
    boolean temp = this.issues[0];
    for(int i=0; i<this.issues.length-1; i++){
      this.issues[i] = this.issues[i+1];
    }
    this.issues[this.issues.length-1] = temp;
  }
  
  void display(){
    translate(xPos, yPos);
    stroke(255, 0, 0, 75);
    beginShape();
    vertex(-sizeBlocks/2, -sizeBlocks/2);
    vertex(sizeBlocks/2, -sizeBlocks/2);
    vertex(sizeBlocks/2, sizeBlocks/2);
    vertex(-sizeBlocks/2, sizeBlocks/2);
    endShape(CLOSE);
    
    stroke(255, 80);
    
    float diffAngle = 2*PI/nbrIssuesPerBlock;  
    for(int i=0; i<nbrIssuesPerBlock; i++){
      rotate(diffAngle);
      if(this.issues[i]){
        line(0, 0, 0, sizeBlocks/2);
      }
    }
    
    translate(-xPos, -yPos);
  }
}
