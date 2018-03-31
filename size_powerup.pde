class Paddlesize {
  float x, y, framey;
  //add negative powerup
  
  Paddlesize(float _x, float _y){
    x = _x;
    y = _y;
    framey = _y;
  }
  
  void show(){
    image(sizepowerup, x, framey, 30, 30);
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
      mypaddle.w = 80;
      timer += 500;
      framey = -30;
      x = -30;
      pup.rewind();
      pup.play();
      score += 250;
    }
  }
  
}