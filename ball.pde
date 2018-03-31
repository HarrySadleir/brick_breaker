class Ball {
  float x, y, dx, dy, w;
  int lives;
  boolean Win;
  
  Ball(){
    w = 15;//20
    x = width/2 - w/2;
    y = 520 - w/2;
    dy -= 4;
    dx += 4;
    lives = 3;
    bip = 1;
  }
  
  void show(){
    fill(grey);
    stroke(grey);
    strokeWeight(2);
    ellipse(x, y, w, w);
    //image(beachball, x, y, w, w);
  }
  
  void act(){
    if(mode == PLAY){
      x += dx;
      y += dy;
    }
    
    //bouncing
    if(x >= width - w/2)/* - w*/ dx *= -1;
    if(x <= w/2)/*0*/ dx *= -1;
    
    //this ball dead
    if(y >= height){
      lives += -1;
      bip -= 1;
      x = -15;
      y = -15;
    }
    
    //all balls dead
    if(bip <= 0){
      bip = 1;
      x = width/2;
      mypaddle.x = width/2;
      y = 520;
      dy -= 4;
      dx += 4;
      mode = PAUSE;
    }
    
    //bouncing
    if(y <= w/2)/*0*/ dy *= -1;
    
    if(dist(mypaddle.x, mypaddle.y, x, y) < (w + mypaddle.w)/2){//dist(mypaddle.x, mypaddle.y, x + w/2, y + w/2) < (w + mypaddle.w)/2
      dx = (x - mypaddle.x)/8;
      dy = (y - mypaddle.y)/8;
      if(mypaddle.w == 80){
      dx = (x - mypaddle.x)/11;
      dy = (y - mypaddle.y)/11;
      }
      bounce.rewind();
      bounce.play();
    }
    
    if(lives <= 0){
      mode = GAMEOVER;
      myball.Win = false;    
    }
  }
  
}