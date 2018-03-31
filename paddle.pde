class Paddle {
  float x, y, w;
  boolean leftkey, rightkey;
  
  Paddle(/*float _x, float _y*/){
    w = 50;
    x = width/2;
    y = height;
  }
  
  void show(){
    fill(yellow);
    stroke(yellow);
    strokeWeight(2);
    ellipse(x, y, w, w);
  }
  
  void act(){
    if(mode == PLAY && mouseY > 300 ){
      x = mouseX;
    }
    
    if(mode == GAMEOVER && mouseY > 300 ){
      x = mouseX;
    }
    
    //timer
    if(w == 80){
      timer -= 1;
      fill(black);
      text(timer, 10, 575);
    }
    if(timer <= 0){
      w = 50;
    }
    
    
  }
}