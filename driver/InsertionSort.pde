public class InsertionSort extends Sort{

  //Constructor
  public InsertionSort(ArrayList<element> array){
    super(array);
    curr = 1;
    comp = curr; 
  }
  
  //Each time this method is run, insertion sort advances one step
  public ArrayList<element> sortArr() {
    normalize();
    if (curr<data.size()){
      if (comp>0){         
          data.get(comp).setElementType("yellow");
          data.get(comp-1).setElementType("red");
        if (Integer.parseInt(data.get(comp).getName())<Integer.parseInt(data.get(comp-1).getName())){
          swap(comp,comp-1);
        }
        comp--;
      }
      else {        
        partialFinal();
        curr++;
        comp=curr;
      }
    }
    else {
      finalize();
      done=true;
    }
    return data;
  }
  
  public void partialFinal() {
    for (int i = 0; i <= curr - 1; i++) {
      data.get(i).setElementType("purple");
    }
  }
  
  
}