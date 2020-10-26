class Coin{
  float x;
  float y;
  color c = #E3CA3C;
  color m = #B9A21A;
  color b = #8A979D;
  
  Coin(float tempx, float tempy) {
    x = tempx;
    y = tempy-10;
  }
  
  void coin(){
    fill(c);
    x-=2.5;
    ellipse(x,y,17,17);
    fill(m);
    textAlign(CENTER);
    textSize(15);
    text("$",x,y+5);
  }
  
  void obstacle(){
    fill(b);
    x-=2.5;
    //ellipse(x,y,17,17);
    triangle(x-9,y+10,x+9,y+10,x,y-5.6);
  }
}  