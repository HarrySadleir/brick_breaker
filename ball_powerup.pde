class Ballquantity {
  float x, y, framey, ballx, bally;
  
  Ballquantity(float _x, float _y){
    x = _x;
    y = _y;
    framey = _y;
    ballx = x;
    bally = y;
  }
  
  void show(){
    image(ballpowerup, x, framey, 30, 30);
  }
  
  void act(){
    if (frameCount % 30 == 0) {
      framey += 15;
    }
    
    if(framey >= height){
      framey = -30;
      x = -30;
    }
    
    //if touching paddle
    if(dist(x + 15, framey + 15, mypaddle.x, mypaddle.y) < mypaddle.w/2 + 15){
      int i3 = 0;
      while(i3 < 3){
        balls.add(new Moreballs(mypaddle.x, mypaddle.y));
        i3++;
      }
      framey = -30;
      x = -30;
      myball.lives += 3;
      bip += 3;
      pup.rewind();
      pup.play();
      score += 350;
    }
  }
  
}