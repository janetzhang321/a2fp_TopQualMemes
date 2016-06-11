class animate {
  
  element move;
  
  animate(element TBM) {
    move = TBM;
  }
  
  void swap(element other) {
    element tmp = this.move;
    this.move = other;
    other = tmp;
  }
  
}