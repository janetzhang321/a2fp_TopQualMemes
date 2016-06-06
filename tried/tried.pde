//class try{

  ArrayList array=new ArrayList<element>();
  
  void setup(){
   //set bkgrnd size
   size (500,500);
   //and color
   background (0);
   noStroke();
   fill (102);
  }

  void draw () {
    //make it white
    //fill(255);
    //add element (we will change this to user input later)
    addE(5);
    //fill(255);
    //addE(6);
  }
  
  
  void addE(int i){
    element e=new element(new Integer(i).toString()); 
    array.add(e);
  }
//}