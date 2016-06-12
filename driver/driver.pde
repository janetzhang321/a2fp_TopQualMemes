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
private button current;

void setup(){
   //set bkgrnd size
   size(700, 400);
   //fullScreen();
   //and color
   background (225);
   //choose menuPFont font = createFont("arial",20);
   PFont font = createFont("arial",20);

    cp5 = new ControlP5(this);
    
    cp5.addTextfield("input")
       .setPosition(20,20)
       .setSize(100,20)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255,0,0))
       ;
         
    cp5.addBang("enter")
       .setPosition(140,20)
       .setSize(40,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;    

    
    //run();
    }

  void draw () {
    //create buttons
    //This writes the coordinates of the button (x coor, y coor, width, height)
    float[] buttonCoor = {width-60,40,35,20};
    //This creates the button
    button manual = new button("Bubble",buttonCoor);
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

  /*
  void run(){
    enter();
    play();
  }
  */
  
  public void enter() {
    try {
      String theText = cp5.get(Textfield.class,"input").getText();
      addE(Integer.parseInt(theText));
      cp5.get(Textfield.class,"input").setText("");
    } catch (Exception e) {
      cp5.get(Textfield.class,"input").setText("");
      println("input was not numerical");
    }
  }

  void mousePressed() {
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