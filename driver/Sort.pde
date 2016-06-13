public abstract class Sort{

  ArrayList<element> data; //The data where the array is stored
  boolean done; //Are you done with the sort
  int curr; //The current value
  int comp; //The value you're comparing stuff to

  //Constructor
  public Sort(ArrayList<element> array) {
    //Deep copy
    data = new ArrayList<element>();
    for (int i = 0; i < array.size(); i++) {
      data.add(array.get(i));
    }
    done = false;
  }
  
  //Accessor
  public boolean getDone() {
    return done;
  }
  
  //Swap method
  public void swap(int i1, int i2) {
     element one = data.get(i1);
     element two = data.get(i2);
     
     //Turn cyan if swap
     one.setElementType("cyan");
     two.setElementType("cyan");
     
     //Have to keep track of coors when swapping as well
     float[] oneCoors = one.getCoors();
     float[] twoCoors = two.getCoors();
     data.get(i1).setCoors(twoCoors);   
     data.get(i2).setCoors(oneCoors);
     
     data.set(i1, two);
     data.set(i2, one);
   }
   
   //Each sorting class has its own method
   public abstract ArrayList<element> sortArr();
  
   //Sets everything to green except parts that are already relatively sorted
   public void normalize() {
     for (int i = 0; i < data.size(); i++) {
       element e = data.get(i);
       if (e.getElementType() != "purple") {
         e.setElementType("");
       }
     }
   }
   
   //Sets everything to blue
   public void finalize() {
     for (int i = 0; i < data.size(); i++) {
       element e = data.get(i);
         e.setElementType("blue");
     }
   }
}