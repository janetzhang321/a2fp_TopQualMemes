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

String textValue = "";

  ArrayList<element> array=new ArrayList<element>();
  boolean runMethod;
  
  
  
  
  void setup(){
   //set bkgrnd size
   fullScreen();
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
       
  cp5.addBang("clear")
     .setPosition(140,20)
     .setSize(40,20)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;
     
  textFont(font);
   run();
  }

  void draw () {
  fill(255);
  text(cp5.get(Textfield.class,"input").getText(), 200,37);
    
    noLoop();
    
  }
  
  //find where to put the next box, like in an array
  float[] findCoor(float size){
    //default
    float[] newCoor = array.get(array.size()-1).getCoors();
    newCoor[0] += size*2;
    newCoor[1] += size*0;
    return newCoor;
  }
  
  void addE(int i){
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
  
  void run(){
    input(textValue);
    play();
  }
  

public void clear() {
  cp5.get(Textfield.class,"textValue").clear();
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }
}

public void input(String theText) {
  try {
    addE(Integer.parseInt(theText));
  } catch (Exception e) {
    println("input was not numerical");
  }
}

  void play(){
    //starts when play button is pressed
    //if manual is selected, then sets inst var of sort to manual
    //runs the sort
  }
  