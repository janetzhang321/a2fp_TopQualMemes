public class BubbleSort extends Sort{
  
  int curr;
  int comp;
  
  public BubbleSort(ArrayList<element> array) {
    super(array);
    curr = 0;
    comp = 1; 
  }
  
  
  public ArrayList<element> sortArr() {
    normalize()
    if(curr < data.size()) {
      data.get(curr).setElementType("red");
        if (comp < data.size() - curr) {
          data.get(comp).setElementType("yellow");
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
    
    else {
      done = true;
    }
    
    return data;
  }
}