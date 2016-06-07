//class try{

  ArrayList<element> array=new ArrayList<element>();
  
  void setup(){
   //set bkgrnd size
   //size (500,500);
   fullScreen();
   //and color
   background (225);
   noStroke();
   fill (102);
  }

  void draw () {
    addE(5);
    addE(6);
    noLoop();
    //fill(255);
    //addE(6);
    
  }
  
  //find where to put the next box, like in an array
  float[] findCoor(float size){
    //default
    float[] newCoor = array.get(array.size()-1).getCoors();
    newCoor[0] += size*2;
    newCoor[1] += size*0;
    //float[] a = {50,50,25,25}
    //return a;
    return newCoor;
  }
  
  void addE(int i){
    if (array.size()==0){
        float[] b={50,50,25,25};
        element e=new element(new Integer(i).toString(), b); 
        array.add(e);
    }
    else{
      element e=new element(new Integer(i).toString(), findCoor(25)); 
      array.add(e);
    }
  }
  
  
//}