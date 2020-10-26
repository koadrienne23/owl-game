class Step {
  float x;
  float y;
  float w;
  Coin coin;
  Coin obstacle;
  int cProbability;
  int bProbability;
  boolean point = false;
  
  Step(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    cProbability = (int)random(0,2);
    bProbability = (int)random(0,3);
    if(cProbability == 0){
      coin = new Coin(random(x,x+w),y);
    }
    if(bProbability == 0){
      obstacle = new Coin(random(x,x+w),y);
    }
  }
  
  void display() {
    noStroke();
    fill(#553B2E);
    x-=2.5;
    rect(x,y,w,10);

    if(cProbability == 0){
      float d1 = dist(myOwl.x,myOwl.y,coin.x,coin.y);
      if(d1<25){
        coin.c = color(255,0,0,0);
        coin.m = color(255,0,0,0);
        coinCount++;
      }
      coin.coin();
    }
    if(bProbability == 0){
      float d2 = dist(myOwl.x,myOwl.y,obstacle.x,obstacle.y);
      if(d2<25){
        obstacle.b = color(255,0,0,0);
        myOwl.y+=10;
        death = true;
      }
      obstacle.obstacle();
    }
  }
  
  void still(){
    noStroke();
    fill(#553B2E);
    rect(x,y,w,10);
  }
}  