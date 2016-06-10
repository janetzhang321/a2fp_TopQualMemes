

  ArrayList<element> array=new ArrayList<element>();
  boolean runMethod;
  
  void setup(){
   //set bkgrnd size
   fullScreen();
   //and color
   background (225);
   //choose menu
   run();
  }

  void draw () {
    addE(5);
    addE(6);
    addE(40000);
    addE(65644489);
    noLoop();
    
  }
  
  //find where to put the next box, like in an array
  float[] findCoor(float size){
    //default
    float[] newCoor = array.get(array.size()-1).getCoors();
    newCoor[0] += size*2;
    newCoor[1] += size*0;
    return newCoor;
  }
  
  void addE(int i){
    if (array.size()==0){
        float[] b={50,250,25,25};
        element e=new element(new Integer(i).toString(), b); 
        array.add(e);
    }
    else{
      element e=new element(new Integer(i).toString(), findCoor(25)); 
      array.add(e);
    }
  }
  
  void run(){
    input();
    play();
  }
  