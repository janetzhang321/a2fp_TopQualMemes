public class button{
  
  private float[] coors;
  private String name;
  
  public button(String words, float[] inputCoors) {
      coors = new float[4];
      
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
  
  //accessor
  public String getName() {
    return name;
  }
  
  //text
  public void fillText(String words){
    //center words
    textFont(createFont("arial", 10));
    textAlign(CENTER,CENTER);
    rectMode(RADIUS);
    //fill to see the words
    fill(255);
    text(words,coors[0],coors[1],coors[2],coors[3]);
  }
  
  //If mouse is hovering over button
  public boolean hover() {
    float x,y,w,h;
    
    x = coors[0];
    y = coors[1];
    w = coors[2];
    h = coors[3];
    strokeWeight(1);
    stroke(204,102,0);
    
    if (mouseX>= x-w && mouseX <= x+w &&
        mouseY>= y-h && mouseY <= y+h) {
          fill(31,34,0);
          
          return true;
        }
    else {
      fill(31,34,255);
      return false;
    }
  }
 
}