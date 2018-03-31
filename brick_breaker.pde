//Kaitlynn chan
//2017-02-14

final int INTRO = 1;
final int INSTRUCTIONS = 2;
final int STARTUP = 3;
final int PLAY = 4;
final int PAUSE = 5;
final int GAMEOVER = 6;
int mode = INTRO;

import ddf.minim.*;
Minim minim;

AudioPlayer bounce;
AudioPlayer brickbreaking;
AudioPlayer pop;
AudioPlayer change;
AudioPlayer pup;
AudioInput input;

Brick[] bricks;
Ball myball;
Paddle mypaddle;

ArrayList<Sand> sandexplosion;
ArrayList<Paddlesize> padpowerup;
ArrayList<Ballquantity> multipleballs;
ArrayList<Moreballs> balls;


color lightpink = #FF9E9D;
color darkpink = #EF746F;
color darkerpink = #F35E57;//E2514A, AF4843
color black = #000000;
color white = #FFFFFF;
color grey = #7D887F;//403C37
color yellow = #EDDE45;//FEF400
color yellowb = #DAD8A7;
color pink = #EA3556;
color pinkb = #FF9E9D;
color blue = #61D2D6;//61D2D6, 17F9FF, 005BC5
color blueb = #7FC7AF;
color purple = #ABB4B5;
color sand = #EBC288;

int br = 35;
int timer;
int score = 0;
int countdown = 3;
int bricksdead;
int bip;
float alpha = 255;
float alpha2 = 100;
float frameW = 50;

PImage background, bouncingline, beachball, introbackground, playpause, arrow, home, ballpowerup, sizepowerup;
PFont mainfont;
PFont font;

void setup(){
 size(600, 600, FX2D);//, FX2D
 
 background = loadImage("background.jpg");
 bouncingline = loadImage("bouncing ball1.png");
 beachball = loadImage("beachball.png");
 //introbackground = loadImage("background4.jpg");
 playpause = loadImage("play.png");
 arrow = loadImage("arrow.png");
 home = loadImage("home.png");
 ballpowerup = loadImage("ballpowerup.png");
 sizepowerup = loadImage("sand_castle.png");//powerup.png
 
 mainfont = createFont("Life's A Beach Thin.ttf", 20);//TT Bricks Medium Italic
 font = createFont("Duxbury Beach.ttf", 20);
 
 minim = new Minim(this);
 bounce = minim.loadFile("bounce1.mp3");
 brickbreaking = minim.loadFile("brick-breaking.mp3");
 pop = minim.loadFile("pop1.mp3");
 change = minim.loadFile("swish1.mp3");
 pup = minim.loadFile("power-up.mp3");
 input = minim.getLineIn();
 
 bricks = new Brick[br];
 myball = new Ball();
 mypaddle = new Paddle();
 sandexplosion = new ArrayList<Sand>();
 padpowerup = new ArrayList<Paddlesize>();
 multipleballs = new ArrayList<Ballquantity>();
 balls = new ArrayList<Moreballs>();
 
 float x = 60;
 float y = 60;
 int i = 0;
 while(i < br){
   bricks[i] = new Brick(x, y);
   i++;
   x += 80;
   if(x >= 600){
     x = 60;
     y += 80;
   }
 }
}
void draw(){
  image(background, 0, 0, 1065, height);
  
  if(mode == INTRO){
    bounce.rewind();
    brickbreaking.rewind();
    drawIntro();//61D2D6, #403C37
    countdown = 3;
    alpha = 255;
    frameW = 50;
  } else if(mode == INSTRUCTIONS){
    drawInstructions();
  } else if(mode == STARTUP){
    mypaddle.show();
    myball.show();
    drawStartup();
  } else if(mode == PLAY){
    drawPlay();
    myball.show();
    myball.act();
  
    mypaddle.show();
    mypaddle.act(); 
  } else if(mode == PAUSE){  
    mypaddle.show();
    myball.show();
    drawPause();
    countdown = 3;
    alpha = 255;
    frameW = 50;
  } else if(mode == GAMEOVER){
    mypaddle.show();
    myball.show();
    drawGameover();
  } else {
    println("Error: unexpected mode: " + mode);
  }
}