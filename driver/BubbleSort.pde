public class BubbleSort {
  
  ArrayList<element> data;
  boolean done;
  int curr;
  int comp;
  
  public BubbleSort(ArrayList<element> array) {
    data = new ArrayList<element>();
    for (int i = 0; i < array.size(); i++) {
      data.add(array.get(i));
    }
    done = false;
    curr = 0;
    comp = 1; 
  }
  
  
  
   public void swap(int i1, int i2) {
     element one = data.get(i1);
     element two = data.get(i2);
     two.setElementType("interested");
     one.setElementType("selected");
     float[] oneCoors = one.getCoors();
     float[] twoCoors = two.getCoors();
     data.get(i1).setCoors(twoCoors);   
     data.get(i2).setCoors(oneCoors);
     data.set(i1, two);
     data.set(i2, one);
   }
  
  public boolean getDone() {
    return done;
  }
  
  public ArrayList<element> bSort() {
    if(curr < data.size()) {
        if (comp < data.size() - curr) {
          if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(comp-1).getName())) {
             swap(comp,comp-1);
          }
          comp++;
        }
        if (comp == data.size() - curr) {
          curr++;
          comp = 1;
        }
    }
    
    if (curr == data.size()) {
      done = true;
    }
    
    return data;
  }
}