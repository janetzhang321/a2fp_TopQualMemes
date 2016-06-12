class button{
  
  float w=40;
  float h=20;
  float[] coors= new float[2];
  boolean pressed=false;
  String name;
  
  button(String n, float x,float y){
    name=n;
    coors[0]=x;
    coors[1]=y;
  }
  
  void draw(){
    rect(coors[0],coors[1],w,h);
    //fil bakgrnd
    fill(255);
    fillText(name);
    noLoop();
  }
  
  void fillText(String words){
    //center words
    textAlign(CENTER,CENTER);
    rectMode(RADIUS);
    //fill to see the words
    fill(25);
    text(words,coors[0],coors[1],coors[2],coors[3]);
  }
}