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

private ArrayList<element> array=new ArrayList<element>(); //Stores the Array
private boolean running = false; //Boolean for whether a sort is running
private String current=null; //The current button that the mouse is hovered over
private Sort currSort; //The current sort that is being run
private int speed; //The speed at which the sort is run



  void setup(){
   //set bkgrnd size
   size(800, 400);
   //and color
   background (65,65,65);
   //draw inputs and sliders useing ControlP5;
   PFont font = createFont("arial",20);
    
   cp5 = new ControlP5(this);
   
    //Adds an input text field
   cp5.addTextfield("input")
       .setPosition(20,20)
       .setSize(100,20)
       .setFont(font)
       .setFocus(true)
       .setColor(color(145,145,0))
       ;
   
   //Button for that input
   cp5.addBang("insert")
       .setPosition(140,20)
       .setSize(40,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ; 
   
   //Adds an input text field for index of deletion
   cp5.addTextfield("index")
       .setPosition(20,70)
       .setSize(100,20)
       .setFont(font)
       .setFocus(false)
       .setColor(color(145,145,0))
       ;
    
    //Button to delete 
    cp5.addBang("delete")
       .setPosition(140,70)
       .setSize(40,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;    
    
    //Slider for speed
    cp5.addSlider("speed")
     .setRange(0,100)
     .setValue(50)
     .setPosition(width-200,100)
     .setSize(100,10)
     ;
    }

  void draw () {
    //clear all extraenous stuff
    background (65,65,65);
    //create buttons 
    bubbleSortButton();
    selectionSortButton();
    insertionSortButton();
    clearButton();
    scrambleButton();
    notOnButton();
    //Select the sort
    buttonSelect();
    //Actually sort
    sorty(); 
    //Write name of sort algo
    title();
    //Draw the actual array
    drawArray(); 
  }
  
  public void drawArray() {
    //If empty
     if (array.size() == 0) {
       return;
     }
     //Not empty
     else {
       //Remember the value of the original array
       element old = array.get(0);
       //This redraws the array by remaking all those elements
       element redraw = new element(old.getName(),old.getCoors(),old.getElementType());
       //This part writes out the index
       fill(255);
       float[] textCoors = old.getCoors();
       text("0",textCoors[0],textCoors[1]+40);
       
       //The previous part was for index 0. All other indices are covered by this for loop.
       for (int i = 1; i < array.size(); i++) {
         element pho = array.get(i);
         redraw = new element(pho.getName(),pho.getCoors(),pho.getElementType());
         fill(255);
         textCoors = pho.getCoors();
         text(""+i,textCoors[0],textCoors[1]+40);
       }
     }
  }
  
  //BUTTONS GALORE!!
  
  public void notOnButton() {
    if (!bubbleSortButton() && 
        !selectionSortButton() && 
        !insertionSortButton() &&
        !clearButton() &&
        !scrambleButton())
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
  
  public boolean clearButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {220,30,20,9};
    //This creates the button
    button clear = new button("Clear",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (clear.hover()) {
      current = "clear";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
  
  public boolean scrambleButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {220,80,20,9};
    //This creates the button
    button scramble = new button("Scram",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (scramble.hover()) {
      current = "scramble";
      return true;
    }
    //Otherwise, the mouse is over no button
    else {
      return false;
    }
  }
  
  //find where to put the next box in an array
  public float[] findCoor(float size){
    float[] newCoor = array.get(array.size()-1).getCoors();
    newCoor[0] += size*2;
    newCoor[1] += size*0;
    return newCoor;
  }
  
  //Adds the next part of the array
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

  //Deletes at a certain index
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
      return;
    }
    
    else if (n == 0) {
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
  }
  
  //This is the code for the insert button
  public void insert() {
    try {
      String theText = cp5.get(Textfield.class,"input").getText();
      addE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"input").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"input").setText("");
      println("input invalid");
    }
  }
  
  //This is the code for the delete button
  public void delete() {
    try {
      String theText = cp5.get(Textfield.class,"index").getText();
      deleteE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"index").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"index").setText("");
      println("input invalid");
    }
  }
  
  //Same code as insert(), but for when you click enter
  public void input(String theText) {
    try {
      theText = cp5.get(Textfield.class,"input").getText();
      addE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"input").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"input").setText("");
      println("input invalid");
    }
  }
  
  //Same code as delete(), but for when you click enter
  public void index(String theText) {
    try {
      theText = cp5.get(Textfield.class,"index").getText();
      deleteE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"index").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"index").setText("");
      println("input invalid");
    }
  }
  
  //This selects which sort to undergo. It also deals with clearing and scrambling. 
  public void buttonSelect() {
    if (mousePressed) {
      //The sorts work by creating a new object of the sort type
      if (current=="bubble"){
          currSort = new BubbleSort(array);
      }
      else if (current=="selection"){
          currSort = new SelectionSort(array);
      }
      else if (current=="insertion"){
          currSort = new InsertionSort(array);
      }
      
      //Check the respective methods
      else if (current=="clear"){
          clearVal();
      }
      else if (current=="scramble"){
          scramble();
      }
    }
  }
  
  //This actually calls the sort
  public void sorty() {
    if (currSort == null) {
      return;
    }
    else {
      running = true; //Set running to true
      ArrayList<element> temp = currSort.sortArr(); //Have a temp array that gets the value of the sort
      //Move the values from the temp array to the actual array
      for (int i = 0; i < temp.size(); i++) {
        array.set(i, temp.get(i));
      }
      
      //delay
      int slow = (int) (((100.0-speed)/100.0) * 2000);
      delay(slow);
      
      //finished?
      if (currSort.getDone()) {
        running = false;
        currSort = null;
      }
    }
  }
  
  //This writes out the title
  public void title() {
    if (running) {
      if (currSort instanceof BubbleSort) {
        textSize(30);
        fill(255);
        text("Bubble", width - 100, height - 50);
      }
      else if (currSort instanceof SelectionSort) {
        textSize(30);
        fill(255);
        text("Selection", width - 100, height - 50);
      }
      else if (currSort instanceof InsertionSort) {
        textSize(30);
        fill(255);
        text("Insertion", width - 100, height - 50);
      }
    }
  }
  
  //This clears the array
  public void clearVal() {
      while (array.size() > 0) {            
            deleteE(0);
          }
  }
  
  //This scrambles the array
  public void scramble() {
    ArrayList<String> temp = new ArrayList<String>();
    for (int i = 0; i < array.size(); i++) {
      temp.add(array.get(i).getName());
    }
    
    for (int i = 0; i < temp.size(); i++) {
      String swapVal = temp.get(i);
      int swapInd = (int) (Math.random() * temp.size());
      temp.set(i, temp.get(swapInd));
      temp.set(swapInd, swapVal);
    }
    
    clearVal();
    
    while (temp.size() > 0) {
      addE(Integer.parseInt(temp.remove(0)));
    }
  }
  
  