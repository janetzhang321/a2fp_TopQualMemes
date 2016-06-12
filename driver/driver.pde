/**
* ControlP5 Textfield
*
*
* find a list of public methods available for the Textfield Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/
import controlP5.*;

ControlP5 cp5;

private String textValue = "";
private ArrayList<element> array=new ArrayList<element>();
private boolean runMethod;//true for  turned on
private boolean start;//starts play method
private String current=null;
private Sort currSort;



void setup(){
   //set bkgrnd size
   size(700, 400);
   //fullScreen();
   //and color
   background (225);
   //choose menuPFont font = createFont("arial",20);
   //drawInput();
       PFont font = createFont("arial",20);

    cp5 = new ControlP5(this);
    
    cp5.addTextfield("input")
       .setPosition(20,20)
       .setSize(100,20)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255,0,0))
       ;
         
    cp5.addBang("insert")
       .setPosition(140,20)
       .setSize(40,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ; 
   
   cp5.addTextfield("index")
       .setPosition(20,70)
       .setSize(100,20)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255,0,0))
       ;
         
    cp5.addBang("delete")
       .setPosition(140,70)
       .setSize(40,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;    
    
    //run();
    }

  void draw () {
    //create buttons 
    bubbleSortButton();
    selectionSortButton();
    insertionSortButton();
    mergeSortButton();
    notOnButton();
    sortySelect();
    sorty(); 
    drawArray();
  }
  
  public void drawArray() {
     if (array.size() == 0) {
       return;
     }
     else {
       element e = new element(array.get(0).getName(),array.get(0).getCoors(),array.get(0).getElementType());
       for (int i = 1; i < array.size(); i++) {
         element pho = array.get(i);
         element redraw = new element(pho.getName(),pho.getCoors(),pho.getElementType());
       }
     }
  }
  
  
  public void notOnButton() {
    if (!bubbleSortButton() && 
        !selectionSortButton() && 
        !insertionSortButton() &&
        !mergeSortButton())
        {
          current = null;
        }
  }
  
  public boolean bubbleSortButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-60,30,25,10};
    //This creates the button
    button bubble = new button("Bubble",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (bubble.hover()) {
      current = "bubble";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
  
  public boolean selectionSortButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-140,30,25,10};
    //This creates the button
    button selection = new button("Selection",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (selection.hover()) {
      current = "selection";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
  
  public boolean insertionSortButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-220,30,25,10};
    //This creates the button
    button insertion = new button("Insertion",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (insertion.hover()) {
      current = "insertion";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
    
  public boolean mergeSortButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-220,60,25,10};
    //This creates the button
    button merge = new button("Merge",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (merge.hover()) {
      current = "merge";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
  
  //find where to put the next box, like in an array
  public float[] findCoor(float size){
    //default
    float[] newCoor = array.get(array.size()-1).getCoors();
    newCoor[0] += size*2;
    newCoor[1] += size*0;
    return newCoor;
  }
  
  public void addE(int i){
    if (array.size()==0){
        float[] b={50,250,25,25};
        element e=new element(new Integer(i).toString(), b,""); 
        array.add(e);
    }
    
    else{
      element e=new element(new Integer(i).toString(), findCoor(25),""); 
      array.add(e);
    }
  }

  public void deleteE(int n) {
    
    if (n > array.size()) {
      return;
    }
    
    ArrayList<String> temp = new ArrayList<String>();
    while (array.size() > n+1) {
      temp.add(array.get(n+1).getName());
      array.remove(n+1);
    }
    
    array.remove(n);
    
    float[] start={50,250,25,25};
    
    if (temp.size() == 0) {    
      //creating a rect
      rectMode(RADIUS);
      //fil bakgrnd
      fill(225);
      stroke(225);
      //create rectangle
      rect(start[0],start[1],start[2],start[3]);
    }
    
    if (n == 0) {
       element e=new element(temp.get(0), start,""); 
       array.add(e);
       
       for (int i = 1; i < temp.size(); i++) {
        e = new element(temp.get(i), findCoor(25),"");
        array.add(e);  
       }
    }
    else {
      for (int i = 0; i < temp.size(); i++) {
        element e = new element(temp.get(i), findCoor(25),"");
        array.add(e);  
      }
    }
    
    if (array.size() != 0) {
    //This deletes the remnant box that Processing drew
    float[] nextBox = findCoor(25);
    
    //creating a rect
    rectMode(RADIUS);
    //fil bakgrnd
    fill(225);
    stroke(225);
    //create rectangle
    rect(nextBox[0],nextBox[1],nextBox[2],nextBox[3]);
    }
  }
  
  public void insert() {
    try {
      String theText = cp5.get(Textfield.class,"input").getText();
      addE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"input").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"input").setText("");
      println("input was not numerical");
    }
  }
  
  public void delete() {
    try {
      String theText = cp5.get(Textfield.class,"index").getText();
      deleteE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"index").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"index").setText("");
      println("input was not numerical");
    }
  }
  
  public void sortySelect() {
    //if (mousePressed) {
      if (current=="bubble" && mousePressed){
          currSort = new BubbleSort(array);
      }
      else if (current=="selection" && mousePressed){
          return;
      }
      else if (current=="insertion" && mousePressed){
          currSort = new InsertionSort(array);
      } 
    //}
  }
  
  public void sorty() {
    if (currSort == null) {
      return;
    }
    else {
      
      ArrayList<element> temp = currSort.sortArr();
      for (int i = 0; i < temp.size(); i++) {
        array.set(i, temp.get(i));
      }
      delay(500);
      if (currSort.getDone()) {
        currSort = null;
      }
    }
  }
  
  public void input(String theText) {
    addE(Integer.parseInt(theText));
  }
  
  public void index(String theText) {
    deleteE(Integer.parseInt(theText)); 
  }
  