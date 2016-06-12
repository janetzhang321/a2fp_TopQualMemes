public class BubbleSort {
  
  ArrayList<element> data = new ArrayList<element>();
  boolean fullPass = false;
  int start = array.size() - 1;
  
  public BubbleSort(ArrayList<element> array) {
    for (int i = 0; i < array.size(); i++) {
      data.add(array.get(i));
    }
  }
  
  public static ArrayList<element> bubble() {
    if(!fullPass) {
        fullPass = true;
        if (Integer.parseInt(array.get(i).getName())<Integer.parseInt(array.get(i-1).getName())) {
           swap(i,i-1);
           fullPass = false;
        }
    }        
  }