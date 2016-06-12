public class InsertionSort extends Sort{
  
  int curr;
  int comp;
  
  public InsertionSort(ArrayList<element> array){
    super(array);
    curr = 1;
    comp = curr; 
  }
  
  public ArrayList<element> sortArr() {
    if (curr<data.size()){
      if (comp>0){
        if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(comp-1).getName())){
          swap(comp,comp-1);
        }
        comp--;
      }
      else {
        curr++;
        comp=curr;
      }
    }
    else {
      done=true;
    }
    return data;
  }
  
  
}