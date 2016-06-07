//class try{

  ArrayList array=new ArrayList<element>();
  
  void setup(){
   //set bkgrnd size
   size (500,500);
   //and color
   background (225);
   noStroke();
   fill (102);
  }

  void draw () {
    //make it white
    fill(255);
    //add element (we will change this to user input later)
    stroke(204,102,0);
    addE(5);
    //fill(255);
    //addE(6);
  }
  
  //find where to put the next box, like in an array
  float[] findCoor(float size){
    //default
    
    float[] newCoor = ((element)array.get(array.size()-1)).getCoors();
    newCoor[0] += size;
    newCoor[1] += size;
    //float[] a = {50,50,25,25}
    //return a;
    return newCoor;
  }
  
  void addE(int i){
    element e=new element(new Integer(i).toString(), findCoor(25)); 
    array.add(e);
  }
  
  
//}