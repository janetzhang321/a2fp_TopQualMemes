class element {
  
  float[] coors = new float[4];
  boolean interested, sorted, selected;
  
  //constructor
  element(String words, float[] inputCoors){
    //finding space
    for (int x=0;x<coors.length;x++){
      coors[x]=inputCoors[x];
    }
    
    interested = false;
    sorted = false;
    selected = false;
    
    //creating a rect
    rectMode(RADIUS);
    //fil bakgrnd
    fill(255);    
    //draw border
    stroke(204,102,0);
    //create rectangle
    rect(coors[0],coors[1],coors[2],coors[3]); 
    //fill w. words
    fillText(words);
  }
  
  //idk
  void draw() {
    
  }
  
  //accessors
  float[] getCoors(){
    float[] a = {coors[0],coors[1],coors[2],coors[3]};
    return a;
  }
  
  void setCoors(float[] newCoors) {
    coors = newCoors;
    redraw(); //Might have to comment out if redraw is written outside
  }
  
  //text
  void fillText(String words){
    //center words
    textAlign(CENTER,CENTER);
    rectMode(RADIUS);
    //fill to see the words
    fill(25);
    text(words,coors[0],coors[1],coors[2],coors[3]);
  }
  
  void swap(element swapper) {
    float[] swapperCoors = swapper.getCoors();
    swapper.setCoors(this.getCoors());
    this.setCoors(swapperCoors);
  }
    
}