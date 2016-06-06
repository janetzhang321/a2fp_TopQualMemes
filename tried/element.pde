class element {
  
  float x1,x2,y1,y2;
  
  //constructor
  element(String words){
    //finding space
    float[] a = findCoor(25);
    x1=a[0];
    y1=a[1];
    x2=a[2];
    y2=a[3];
    //creating a rect
    rect(x1,y1,x2,y2); 
    //fill to see the words
    fill(225);
    //fill w. words
    fillText(words);
    //center words
    textAlign(CENTER);
  }
  
  //idk
  void draw() {
    
  }
  
  //text
  void fillText(String words){
    text(words,x1,x2,y1,y2);
  }

  //find where to put the next box, like in an array
  float[] findCoor(float size){
    //default
    float[] a={25+size,25,50+size,50}; 
    return a;
  }
}