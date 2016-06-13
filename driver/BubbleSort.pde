public class BubbleSort extends Sort{
  
  //Constructor
  public BubbleSort(ArrayList<element> array) {
    super(array);
    curr = 0;
    comp = 1; 
  }
  
  //Each time this method is run, bubble sort advances one step
  public ArrayList<element> sortArr() {
    normalize();
    if(curr < data.size()) {
        if (comp < data.size() - curr) {          
          data.get(comp).setElementType("yellow");
          data.get(comp-1).setElementType("red");
          if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(comp-1).getName())) {
             swap(comp,comp-1);
          }        
          comp++;
        }
        if (comp == data.size() - curr) {
          curr++;          
          data.get(data.size()-curr).setElementType("purple");
          comp = 1;
        }
    }
    
    else {
      finalize();
      done = true;
    }
    
    return data;
  }
}