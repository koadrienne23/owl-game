class Owl{
  float x;
  float y;
  float r;
  boolean m = false;
  float speed = -10;
  Step[] steps = new Step[1];
  
  Owl(float tempXpos, float tempYpos, float tempSize) {
    x = tempXpos;
    y = tempYpos;
    r = tempSize;
    steps[0] = new Step (50, height/2,600);
  }
  
  void display(){
    noStroke();
    //head
    fill(#319BC4);
    ellipse(x,y,r,r/7*5);
    //body
    fill(#8FDAF0);
    ellipse(x,y+r/3,r,r/7*6);
    fill(#319BC4);
    triangle(x-r/100*19,y+r/40*13,x-r/8,y+r/50*17,x-r/40*7,y+r/40*17);
    triangle(x-r/200*7,y+r/200*71,x+r/200*7,y+r/200*71,x,y+r/200*89);
    triangle(x+r/100*19,y+r/40*13,x+r/8,y+r/50*17,x+r/40*7,y+r/40*17);
    triangle(x-r/8,y+r/40*19,x-r/20,y+r/200*97,x-r/200*19,y+r/100*57);
    triangle(x+r/8,y+r/40*19,x+r/20,y+r/200*97,x+r/200*19,y+r/100*57);
    //wings
    triangle(x-r/5,y+r/200*17,x-r/20*9,y+r/20,x-r/20*11,y+r/20*11);
    triangle(x+r/5,y+r/200*17,x+r/20*9,y+r/20,x+r/20*11,y+r/20*11);
    //ears
    fill(#8FDAF0);
    triangle(x-r/50*17,y-r/10*3,x-r/50*17,y-r/10*4,x-r/100*19,y-r/10*3);
    triangle(x+r/50*17,y-r/10*3,x+r/50*17,y-r/10*4,x+r/100*19,y-r/10*3);
    //eyes
    ellipse(x-r/25*6,y-r/100*3,r/40*23,r/40*23);
    ellipse(x+r/25*6,y-r/100*3,r/40*23,r/40*23);
    //nose
    fill(#FA8E28);
    triangle(x,y+r/4,x-r/100*19,y,x+r/100*19,y);
    //eyeballs
    fill(#FFFFFF);
    ellipse(x-r/25*6,y-r/100*3,r/40*19,r/40*19);
    ellipse(x+r/25*6,y-r/100*3,r/40*19,r/40*19);
    fill(#000000);
    ellipse(x-r/25*6,y-r/100*3,r/4,r/4);
    ellipse(x+r/25*6,y-r/100*3,r/4,r/4);
    fill(#FFFFFF);
    ellipse(x-r/100*17,y-r/200*19,r/10,r/10);
    ellipse(x+r/100*31,y-r/200*19,r/10,r/10);
    //feet
    fill(#FA8E28);
    ellipse(x-r/20*3,y+r/200*143,r/20,r/10);
    ellipse(x-r/5,y+r/10*7,r/20,r/10);
    ellipse(x-r/10,y+r/40*29,r/20,r/10);
    ellipse(x+r/20*3,y+r/200*143,r/20,r/10);
    ellipse(x+r/5,y+r/10*7,r/20,r/10);
    ellipse(x+r/10,y+r/40*29,r/20,r/10);
  }
  
  void jump(float ground){
    if(jump){
      stop = true;
      speed = speed + gravity;
      y = y + speed;
      if (speed>0 && y+r/2 >= ground) {
        y = ground-r/2;
        landed = true;
        jump = false;
      }
    }
  }
  
  void reset(){
   if(landed){
     if(jump==false){
       stop = true;
       gravity=0.3;
       speed=-10;
     }
   }
  }
  
  void fall(){
    y+=5;
  }
  
  void stopfall(){
    y-=5;
  }
  
  boolean intersect(Step s){
    if(x>=s.x && y<=s.y && x<=s.x+s.w){
      return true;
    }else{
      return false;
    }
  }
  
  Step step(){
    Step s = new Step(random(width,width+20),random(50,height),(int)(random(30,200)));
    steps = (Step[]) append(steps,s);
    return s;
  }
  
}