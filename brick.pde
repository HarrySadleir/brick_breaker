class Brick {
  float x, y;
  int c = (int)random(0, 3);
  boolean alive;
  
  Brick(float incomingX, float incomingY){ //_X, _Y
   x = incomingX;
   y = incomingY;
   alive = true;
   bricksdead = 0;
  }
  
  void show(){    
    if(alive){
      color[] colors = {
       lightpink, darkpink, darkerpink
      };
      fill(colors[c]);
      stroke(colors[c]);
      strokeWeight(2);
      ellipse(x, y, 50, 50);
    }
  }
  
  void act(){
    
    //changing life
    if(dist(myball.x, myball.y, x, y) < (myball.w + 50)/2 && alive == true){
      myball.dx = (myball.x - x)/8;
      myball.dy = (myball.y - y)/8;
      score += 100;
      c += -1;
      change.rewind();
      change.play();
    }
    
    //moreballs change
    int n4 = balls.size();
    int i5 = 0;
    while (i5 < n4){
      Moreballs mb = balls.get(i5);
      if(dist(mb.x, mb.y, x, y) < (mb.w + 50)/2 && alive == true){
        mb.dx = (mb.x - x)/8;
        mb.dy = (mb.y - y)/8;
        score += 100;
        c += -1;
        change.rewind();
        change.play();
      }
      i5++;
    }
    
    //dead
    if(c < 0 && alive == true){
      //score += 200;
      alive = false;
      myball.Win = true;
      bricksdead += 1;
      pop.rewind();
      pop.play();
      change.pause();
      int i2 = 0;
      while(i2 < 100){
        sandexplosion.add(new Sand(x, y));
        i2++;
      }
      
      if (random(0,100) <= 25) {
        padpowerup.add(new Paddlesize(x, y));
      }
      
      if (random(0,100) <= 10) {
        multipleballs.add(new Ballquantity(x, y));
      }
    }
    
    if (alive == false && bricksdead < bricksdead){
      bricksdead += 1;
      
    }
    //win sequence
    if(bricksdead == br){
      myball.Win = true;
      mode = GAMEOVER;
    }
    
  }
  
}