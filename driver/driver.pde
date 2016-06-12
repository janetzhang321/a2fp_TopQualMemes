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
private boolean runMethod;//true for manual turned on
private boolean start;//starts play method
private button current=null;

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
    manualButton();
    playButton();
    bubbleSort();
    selectionSort();
    insertionSort();
    drawArray();
    /*
    while (array.size()==2){
      swap(0,1);
    }
    */
  }
  
  public void drawArray() {
     if (array.size() == 0) {
       return;
     }
     else {
       element e = new element(array.get(0).getName(),array.get(0).getCoors());
       for (int i = 1; i < array.size(); i++) {
         element pho = array.get(i);
         element redraw = new element(pho.getName(),pho.getCoors());
       }
     }
  }
  /*
   public void swap(int i1, int i2) {
     element one = array.get(i1);
     element two = array.get(i2);
     float[] oneCoors = one.getCoors();
     float[] twoCoors = two.getCoors();
     array.get(i1).setCoors(twoCoors);
     array.get(i2).setCoors(oneCoors);
     array.set(i1, two);
     array.set(i2, one); 
   }
    */
  public void bubbleSort(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-60,30,25,10};
    //This creates the button
    button bubble = new button("Bubble",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (bubble.hover() != null) {
      current = bubble.hover();
    }
    //Otherwise, the mouse is over no button
    else {
      current = null;
    }
  }
  
  public void selectionSort(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-140,30,25,10};
    //This creates the button
    button selection = new button("Selection",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (selection.hover() != null) {
      current = selection.hover();
    }
    //Otherwise, the mouse is over no button
    else {
      current = null;
    }
  }
  
  public void insertionSort(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-220,30,25,10};
    //This creates the button
    button insertion = new button("Insertion",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (insertion.hover() != null) {
      current = insertion.hover();
    }
    //Otherwise, the mouse is over no button
    else {
      current = null;
    }
  }
  
  public void manualButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {225,30,20,10};
    //This creates the button
    button manual = new button("Manual",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (manual.hover() != null) {
      current = manual.hover();
    }
    //Otherwise, the mouse is over no button
    else {
      current = null;
    }
  }
  
  public void playButton(){
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {300,30,20,10};
    //This creates the button
    button play = new button("Play",buttonCoor);
    //This checks for hover
    //If the mouse is over the button, then it sets the current button to the button the mouse is over
    if (play.hover() != null) {
      current = play.hover();
    }
    //Otherwise, the mouse is over no button
    else {
      current = null;
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
        element e=new element(new Integer(i).toString(), b); 
        array.add(e);
    }
    
    else{
      element e=new element(new Integer(i).toString(), findCoor(25)); 
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
    
    for (int i = 0; i < temp.size(); i++) {
      element e = new element(temp.get(i), findCoor(25));
      array.add(e);  
    }
    
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
    
  /*
  void run(){
    enter();
    play();
  }
  */
  
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
  
  public void mousePressed() {
    if (current != null) {
      println(current.getName());
    }
  }

/*
  public void play(){
    //starts when sort button is pressed
    
    if (start){
      if (runMethod){//run manual sort
    
      }
      else{ //start automatic animation
      
      }
    }
  }
  */