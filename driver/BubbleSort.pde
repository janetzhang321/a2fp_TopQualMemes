public class BubbleSort extends Sort{
  
  int curr;
  int comp;
  
  public BubbleSort(ArrayList<element> array) {
    super(array);
    curr = 0;
    comp = 1; 
  }
  
  
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