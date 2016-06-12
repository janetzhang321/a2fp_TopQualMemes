public class element {
  
  private float[] coors = new float[4];
  private String elementType;
  private String name;
  
  //constructor
  public element(String words, float[] inputCoors, String inputType){
    //finding space
    for (int x=0;x<coors.length;x++){
      coors[x]=inputCoors[x];
    }
    
    elementType = inputType;
    
    name = words;
        
    //creating a rect
    rectMode(RADIUS);
    //fil bakgrnd
    fill(255);    
    //draw border
    strokeWeight(4);
    //defaut is green
    stroke(37,255,0);
    if (elementType=="red"){
      stroke(232,44,12);
    }
    else if (elementType=="yellow"){
      stroke(255,224,0);
    }
    else if (elementType=="blue"){
      stroke(3,51,255);
    }
    else if (elementType=="purple"){
      stroke(128,13,255);
    }
    //strokeWeight(1);
    //create rectangle
    rect(coors[0],coors[1],coors[2],coors[3]); 
    //fill w. words
    fillText(name);
  }
  
  //idk
  void draw() {

    
  }
  
  //accessors
  public String getElementType() {
    return elementType;
  }
  
  public float[] getCoors(){
    float[] a = {coors[0],coors[1],coors[2],coors[3]};
    return a;
  }
  
  public String getName() {
    return name;
  }
  
  public void setElementType(String s) {
    elementType = s;
  }
  
  public void setCoors(float[] b) {
    coors = b;
  }
  
  public void setName(String s) {
    name = s;
  }
  
  //text
  public void fillText(String words){
    //center words
    textAlign(CENTER,CENTER);
    rectMode(RADIUS);
    //fill to see the words
    fill(25);
    text(words,coors[0],coors[1],coors[2],coors[3]);
  }

}