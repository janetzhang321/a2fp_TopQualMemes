public class SelectionSort extends Sort{

  int min; //The current min
  
  //Constructor
  public SelectionSort(ArrayList<element> array){
    super(array);
    curr = 0;
    comp = curr+1; 
    min = curr;
  }
  
  //Each time this method is run, selection sort advances one step
  public ArrayList<element> sortArr() {
    normalize();
    if (curr<data.size()-1){
      data.get(curr).setElementType("yellow");
      if(comp<data.size()){
        if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(min).getName())){
          min=comp;
        }
        data.get(comp).setElementType("red");
        data.get(min).setElementType("pink");
        comp++;
      }
      else {     
        swap(min,curr);
        curr++;
        partialFinal();
        comp = curr+1;
        min = curr;
      }
    }
    else {
      finalize();
      done = true;
    }
    return data;
  }
  
  public void partialFinal() {
    for (int i = 0; i <= curr - 1; i++) {
      data.get(i).setElementType("purple");
    }
  }
  
}