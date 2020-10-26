PImage sky;
PGraphics pgSky;
PImage sky2;
PGraphics pgSky2;

Owl myOwl;
Step[] steps = new Step[1];
float[] starsX = new float[100];
float[] starsY = new float[100];
float gravity = 0.3;
float y = 0;
float x;
float floor = height;
float stepx;
boolean jump;
boolean landed = false;
boolean stop = false;
boolean jumpnow = false;
int coinCount = 0;
boolean death = false;
int mode = 0;
int highscore = 0;

void setup() {
  size(640,360);
  y = height/2-25;
  myOwl = new Owl(50,y,30);
  steps[0] = new Step (50, height/2,600);
  for (int i = 0; i < starsX.length; i++) {
    starsX[i] = random(0, width);
    starsY[i] = random(0, height);
  }
  
  sky = loadImage("sky.jpg");
  pgSky = createGraphics(640, 360);
  pgSky.beginDraw();
  pgSky.image(sky, 0, 0);
  pgSky.endDraw();
  
  sky2 = loadImage("sky2.png");
  pgSky2 = createGraphics(640, 756);
  pgSky2.beginDraw();
  pgSky2.image(sky2, 0, 0);
  pgSky2.endDraw();
}

void draw() {
  if(mode == 0){
    image(pgSky, 0, 0);
    fill(#5CA3CE);
    rect(220,height/2+10,200,40);
    fill(0);
    textAlign(CENTER);
    text("Instructions:", width/2, height/2-80);
    textSize(20);
    text("Click on the mouse to jump to the next branch.",width/2,height/2-50);
    text("Collect the coins to earn points and avoid the spikes.", width/2, height/2-25);
    text("Good Luck!", width/2, height/2);
    textSize(32);
    text("Play!", width/2, height/2+40);
  }
  
  if(mode == 1){
    background(#02093E);
    
    fill(#5CA3CE);
    textSize(20);
    text("Score = " + coinCount,60,30);
    
    fill(255);
    for (int i = 0; i < starsX.length; i++) {
      ellipse(starsX[i], starsY[i], 1.5, 1.5);
      starsX[i]-=2.5;
      if(starsX[i]<0){
        starsX[i]=width;
      }
    }
    
    myOwl.display();
    myOwl.reset();
    myOwl.fall();
    
    for (int i = 0; i < steps.length; i ++ ) {
      steps[i].display();
    }
    
    landed= true;
    stop = false;
    
    for (int i = 0; i < steps.length; i ++ ) {
      if(myOwl.intersect(steps[i])){
          floor = steps[i].y;
          jumpnow = true;
        }
    }
   
   for (int i = 0; i < steps.length; i ++ ) {
      if(myOwl.y==steps[i].y-(myOwl.r/2) && myOwl.x>=steps[i].x){
        if(myOwl.x<=steps[i].x+steps[i].w){
          stop = true;
        }else{
          stop = false;
        }
     } 
   }
    
    if(jumpnow){
      if(landed){
        myOwl.jump(floor);
      }
    }
    
    if(stop){
      myOwl.stopfall();
    }
    if(myOwl.y>height+10){
      println("dead");
      death = true;
    }
    
    if(steps[steps.length-1].x < width-90){
      steps = (Step[]) append(steps,myOwl.step());
    }
    
    if(death){
      mode = 2;
    }
  }
  
  if(mode == 2){
    image(pgSky2, 0, 0);
    textSize(45);
    fill(#58A9E5);
    text("YOU LOSE!",width/2,height/3);
    if(coinCount > highscore){
      highscore = coinCount;
    }
    textSize(35);
    text("Score: " + coinCount,width/2,height/9*4);
    textSize(30);
    text("Highscore: " + highscore,width/2,height/9*5);
    fill(#3D8FB7);
    stroke(255);
    strokeWeight(3);
    rect(215,height/9*6,200,40);
    fill(#97DAE5);
    text("Play Again!",width/2,height/9*6+32);
    landed = false;
    stop = false;
    jumpnow = false;
    myOwl.reset();
    myOwl.y = height/2-25;
  }
  
}

void mousePressed() {
  if(mode == 0 && mouseX>220 && mouseX<420 && mouseY>height/2+10 && mouseY<height/2+50){
    mode = 1;
  }
  if(mode == 1){
    landed = false;
    jump = true;
  }
  if(mode == 2 && mouseX>215 && mouseX<415 && mouseY>height/9*6 && mouseY<height/9*6+40){
    coinCount = 0;
    death = false;
    mode = 1;
    for (int i = 0; i < steps.length; i ++ ) {
      steps[i].x = -300;
      if(steps[i].cProbability==0){
        if(steps[i].coin.x>0){
          steps[i].coin.x = -300;
        }
      }
      if(steps[i].bProbability==0){
        if(steps[i].obstacle.x>0){
          steps[i].obstacle.x = -300;
        }
      }
    }
    steps[0].x = 40;
  }
}