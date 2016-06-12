public class SelectionSort extends Sort{
  
  int curr;
  int comp;
  
  public SelectionSort(ArrayList<element> array){
    super(array);
    curr = 0;
    comp = curr+1; 
  }
  
  public ArrayList<element> sortArr() {
    if (curr<data.size()-1){
      int iMin=curr;
      if(comp<data.size()){
        if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(iMin).getName())){
          iMin=comp;
        }
        comp++;
      } 
      if (iMin != curr) {
        swap(iMin,comp); 
      }
      curr++;
    }
    return data;
  }
  
  
}