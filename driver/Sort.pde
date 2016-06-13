public abstract class Sort{

  ArrayList<element> data;
  boolean done;

  public Sort(ArrayList<element> array) {
    data = new ArrayList<element>();
    for (int i = 0; i < array.size(); i++) {
      data.add(array.get(i));
    }
    done = false;
  }
  
  public boolean getDone() {
    return done;
  }
  
   public void swap(int i1, int i2) {
     element one = data.get(i1);
     element two = data.get(i2);
     two.setElementType("cyan");
     float[] oneCoors = one.getCoors();
     float[] twoCoors = two.getCoors();
     data.get(i1).setCoors(twoCoors);   
     data.get(i2).setCoors(oneCoors);
     data.set(i1, two);
     data.set(i2, one);
   }
   
   public abstract ArrayList<element> sortArr();

   public void normalize() {
     for (int i = 0; i < data.size(); i++) {
       element e = data.get(i);
       if (e.getElementType() != "blue") {
         e.setElementType("");
       }
     }
   }
}