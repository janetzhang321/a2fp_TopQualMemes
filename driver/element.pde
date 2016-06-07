class element {
  
  float[] coors = new float[4];
  
  //constructor
  element(String words, float[] inputCoors){
    //finding space
    x1=inputCoors[0];
    y1=inputCoors[1];
    w=inputCoors[2];
    h=inputCoors[3];
    //creating a rect
    rectMode(RADIUS);
    rect(x1,y1,w,h); 
    //fill to see the words
    fill(25);
    //fill w. words
    fillText(words);
    //center words
    textAlign(CENTER,CENTER);
  }
  
  //idk
  void draw() {
    
  }
  
  //accessors
  float[] getCoors(){
    float[] a = {x1,y1,w,h};
    return a;
  }
  
  //text
  void fillText(String words){
    rectMode(RADIUS);
    text(words,x1,y1,w,h);
  }


}