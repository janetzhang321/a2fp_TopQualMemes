public class button{
  
  private float[] coors = new float[4];
  private String name;
  
  public button(String words, float[] inputCoors) {
     //finding space
      for (int x=0;x<coors.length;x++){
        coors[x]=inputCoors[x];
      }
      
      name = words;
      hover();
      
       //creating a rect
       rectMode(RADIUS);  
       //draw border  
       //create rectangle
       rect(coors[0],coors[1],coors[2],coors[3]); 
       //fill w. words
       fillText(name);
  }
  
  void draw(){

  }
  
  public String getName() {
    return name;
  }
  
  public void fillText(String words){
    //center words
    textFont(createFont("arial", 15));
    textAlign(CENTER,CENTER);
    rectMode(RADIUS);
    //fill to see the words
    fill(255);
    text(words,coors[0],coors[1],coors[2],coors[3]);
  }
  
  public button hover() {
    float x,y,w,h;
    
    x = coors[0];
    y = coors[1];
    w = coors[2];
    h = coors[3];
    
    stroke(204,102,0);
    
    if (mouseX>= x-w && mouseX <= x+w &&
        mouseY>= y-h && mouseY <= y+h) {
          fill(31,34,0);
          return this;
        }
    else {
      fill(31,34,255);
      return null;
    }
  }
 
}