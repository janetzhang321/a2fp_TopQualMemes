public class SelectionSort extends Sort{
  
  int curr;
  int comp;
  int min;
  
  public SelectionSort(ArrayList<element> array){
    super(array);
    curr = 0;
    comp = curr+1; 
    min = curr;
  }
  
  public ArrayList<element> sortArr() {
    if (curr<data.size()-1){
      if(comp<data.size()){
        if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(min).getName())){
          min=comp;
        }
        comp++;
      }
      else {     
        swap(min,curr);
        curr++;
        comp = curr+1;
        min = curr;
      }
    }
    else {
      done = true;
    }
    return data;
  }
  
  
}