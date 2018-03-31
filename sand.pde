class Sand {
 float x, y, dx, dy;
 
 Sand(float _x, float _y){
   x = _x;
   y = _y;
   dx = random(-5, 5);
   dy = random(-5, 5);
 }
 
 void show(){
   fill(sand);
   stroke(sand);
   ellipse(x, y, 2, 2);
 }
 
 void act(){
   x += dx;
   y += dy;
 }
}