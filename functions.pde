void drawIntro() {
  image(background, -465, 0, 1065, height);//introbackground, 0, 0, width, height
  //reset
  myball.x = width/2 - myball.w/2;
  myball.y = 520 - myball.w/2;
  myball.lives = 3;
  mypaddle.x = width/2;
  mypaddle.y = height;
  //bricks
  //int i = 0;
  //boolean alive;
  //while(i < br){
  //  br = 35;
  //  alive = true;
  //  i ++;
  //}
  
  //bouncing ball
  image(bouncingline, -50, 250, 330, 347);
  
  //title
  fill(black);
  textAlign(CENTER);
  textFont(mainfont);
  textSize(80);
  text("BREAK - OUT", width/2, 100);
  
  //play
  fill(black);
  textAlign(CENTER);
  textFont(mainfont);
  textSize(60);
  text("PLAY", width/2, height/2);
  
  //intructions
  fill(black);
  textAlign(CENTER);
  textFont(mainfont);
  textSize(50);
  text("INTRUCTIONS", width/2, 360);
  if(mode == INTRO && mousePressed && mouseX > 163 && mouseX < 438 && mouseY > 325 && mouseY < 360) mode = INSTRUCTIONS;
  
  //float arrowx;
  if(mouseX > 242 && mouseX < 362 && mouseY > 258 && mouseY < 299){
    image(arrow, 370, 255, 50, 50);
  }
  
  if(mode == INTRO && mousePressed && mouseX > 242 && mouseX < 362 && mouseY > 258 && mouseY < 299) mode = STARTUP;
  
}

void drawInstructions(){
  background(blue);
  
  //text
  fill(black);
  textAlign(CENTER);
  textFont(mainfont);
  textSize(30);
  text("INTRUCTIONS", width/2, 50);
  textAlign(LEFT);
  text("Use the mouse to move the paddle", 20, 100);
  text("Get rid of all the bricks", 20, 150);
  text("Try to get the sandcastles to upgrade the paddle", 20, 200);
  text("BUT the upgrade only lasts for a limited time", 20, 250);
  text("Collect more sandcastles to get more time", 20, 300);
  text("Try to get the multiple balls powerup", 20, 350);
  text("Click the pause button in the top right corner", 20, 400);
  text("To play press the space bar", 20, 450);
  text("You have 3 lives", 20, 500);
  
  image(sizepowerup, 525, 210, 50, 50);
  image(ballpowerup, 515, 270, 50, 50);
  
  //home
  image(home, 20, 550, 30, 30);
  if(mode == INSTRUCTIONS && mousePressed && mouseX > 20 && mouseX < 50 && mouseY > 550 && mouseY < 580) mode = INTRO;
}

void drawStartup(){
  int i = 0;
  while(i < br){
    bricks[i].show();
    bricks[i].act();
    i ++;
  }
  
  //sand explosion
  int n = sandexplosion.size();
  int i2 = 0;
  while (i2 < n){
    Sand s = sandexplosion.get(i2);
    s.show();
    i2++;
  }
  
  //pad powerup
  int n2 = padpowerup.size();
  int i3 = 0;
  while (i3 < n2){
    Paddlesize p = padpowerup.get(i3);
    p.show();
    i3++;
  }
 
  //ball powerup
  int n3 = multipleballs.size();
  int i4 = 0;
  while (i4 < n3){
    Ballquantity b = multipleballs.get(i4);
    b.show();
    i4++;
  }
  
  //moreballs
  int n4 = balls.size();
  int i5 = 0;
  while (i5 < n4){
    Moreballs mb = balls.get(i5);
    mb.show();
    i5++;
  }
  
  //background
  fill(black, alpha2);
  stroke(black, alpha2);
  rect(0, 0, width, height);
  
  //countdown
  fill(black, alpha);
  textAlign(CENTER);
  textFont(mainfont);
  textSize(frameW);
  text(countdown, width/2, height/2);
  if(mode == STARTUP){ 
    if (frameCount % 1 == 0) {
      frameW += 2;
      if (frameW >= 80) {
        frameW = 5;
        countdown += -1;
      }
    }
  }
  if(countdown <= 0) alpha = 0;  
  if(mode == STARTUP && alpha <= 0) mode = PLAY;
 
  
  //score
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(score, 10, 500);
  
  //lives
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(myball.lives, 550, 500);
  
}

void drawPlay() {
  //bricks
  int i = 0;
  while(i < br){
    bricks[i].show();
    bricks[i].act();
    i ++;
  }
 
  //sand explosion
  int n = sandexplosion.size();
  int i2 = 0;
  while (i2 < n){
    Sand s = sandexplosion.get(i2);
    s.show();
    s.act();
    i2++;
  }
  
  //pad powerup
  int n2 = padpowerup.size();
  int i3 = 0;
  while (i3 < n2){
    Paddlesize p = padpowerup.get(i3);
    p.show();
    p.act();
    i3++;
  }
 
  //ball powerup
  int n3 = multipleballs.size();
  int i4 = 0;
  while (i4 < n3){
    Ballquantity b = multipleballs.get(i4);
    b.show();
    b.act();
    i4++;
  }
 
  //moreballs
  int n4 = balls.size();
  int i5 = 0;
  while (i5 < n4){
    Moreballs mb = balls.get(i5);
    mb.show();
    mb.act();
    i5++;
  }
  
  //score
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(score, 10, 500);
  
  //pause button
  fill(black);
  textAlign(LEFT);
  textFont(font);
  textSize(25);
  text("||", 575, 25);
  
  //lives
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(myball.lives, 550, 500);
  
}

void drawPause(){
  //bricks
  int i = 0;
  while(i < br){
    bricks[i].show();
    bricks[i].act();
    i ++;
  }
  
  //sand explosion
  int n = sandexplosion.size();
  int i2 = 0;
  while (i2 < n){
    Sand s = sandexplosion.get(i2);
    s.show();
    i2++;
  }
  
  //pad powerup
  int n2 = padpowerup.size();
  int i3 = 0;
  while (i3 < n2){
    Paddlesize p = padpowerup.get(i3);
    p.show();
    i3++;
  }
 
  //ball powerup
  int n3 = multipleballs.size();
  int i4 = 0;
  while (i4 < n3){
    Ballquantity b = multipleballs.get(i4);
    b.show();
    i4++;
  }
  
  //moreballs
  int n4 = balls.size();
  int i5 = 0;
  while (i5 < n4){
    Moreballs mb = balls.get(i5);
    mb.show();
    i5++;
  }
  
  //background
  fill(black, alpha2);
  stroke(black, alpha2);
  rect(0, 0, width, height);
  //background(grey, alpha2);
  
  //score
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(score, 10, 500);
  
  //pause button
  image(playpause, 565, -3, 40, 40);
  
  //lives
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(myball.lives, 550, 500);
  
  //playpause
  image(playpause, 200, 200, 200, 200);
  
  //home
  image(home, 20, 550, 30, 30);
  if(mode == PAUSE && mousePressed && mouseX > 20 && mouseX < 50 && mouseY > 550 && mouseY < 580) mode = INTRO;
  
}

void mouseReleased(){
  if(mode == PLAY && mouseX > 580 && mouseX < 594 && mouseY > 6 && mouseY < 26) mode = PAUSE;
}

void keyReleased(){
  if(key == ' ' && mode == PAUSE) mode = STARTUP;
}

void drawGameover(){
  int i = 0;
  while(i < br){
    bricks[i].show();
    bricks[i].act();
    i ++;
  }

  //score
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(score, 10, 500);
  
  //lives
  fill(black);
  textAlign(LEFT);
  textFont(mainfont);
  textSize(30);
  text(myball.lives, 550, 500);
  
  //home
  image(home, 20, 550, 30, 30);
  if(mode == GAMEOVER && mousePressed && mouseX > 20 && mouseX < 50 && mouseY > 550 && mouseY < 580) mode = INTRO;
  
  //win sequence
  if(myball.Win == true){
    fill(black);
    textAlign(CENTER);
    textFont(mainfont);
    textSize(70);
    text("WIN", width/2, 275);
  }
  
  //lose sequence
  if(myball.Win == false){  
    fill(black);
    textAlign(CENTER);
    textFont(mainfont);
    textSize(70);
    text("YOU LOSE", width/2, 275);
  }
  
  //background
  fill(black, alpha2);
  stroke(black, alpha2);
  rect(0, 0, width, height);
  //do score and lives
  fill(black);
  textAlign(CENTER);
  textSize(50);
  text(score, width/2, 350);
  text(myball.lives, width/2, 400);
}