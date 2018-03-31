class Moreballs {
 float x, y, dx, dy, w;
  
  Moreballs(float _x, float _y){
   x = _x;
   y = _y;
   dx = random(-5, 5);
   dy = random(-1, -5);
   w = 15;
  }
  
  void show(){
    fill(grey);
    stroke(grey);
    ellipse(x, y, w, w);
  }
  
  void act(){
    x += dx;
    y += dy;
    
    //bouncing
    if(x >= width - w/2) dx *= -1;
    if(x <= w/2) dx *= -1;
    
    if(y >= height){
      myball.lives += -1;
      bip -= 1;
      y = -15;
      x = -15;
    }
    
    if(y <= w/2) dy *= -1;
    
    //bouncing
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
    
  }
  
}