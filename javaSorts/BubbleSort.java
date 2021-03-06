/*======================================
  class BubbleSort -- implements bubblesort algorithm (vanilla version)
  ======================================*/

/* Nalanda Sharadjaya
   APCS1 pd9
   HW51 -- Dat Bubbly Tho
   2015-12-21
*/

import java.util.ArrayList;

public class BubbleSort {

    //~~~~~~~~~~~~~~~~~~~ HELPER METHODS ~~~~~~~~~~~~~~~~~~~
    //precond: lo < hi && size > 0
    //postcond: returns an ArrayList of random integers
    //          from lo to hi, inclusive
    public static ArrayList populate( int size, int lo, int hi ) 
    {
	ArrayList<Integer> retAL = new ArrayList<Integer>();
	while( size > 0 ) {
	    //     offset + rand int on interval [lo,hi]
	    retAL.add( lo + (int)( (hi-lo+1) * Math.random() ) );
	    size--;
	}
	return retAL;
    }


    //randomly rearrange elements of an ArrayList
    public static void shuffle( ArrayList al ) 
    {
	int randomIndex;
	//setup for traversal fr right to left
        for( int i = al.size()-1; i > 0; i-- ) {
	    //pick an index at random
            randomIndex = (int)( (i+1) * Math.random() );
	    //swap the values at position i and randomIndex
            al.set( i, al.set( randomIndex, al.get(i) ) );
        }
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    // VOID version of bubbleSort
    // Rearranges elements of input ArrayList
    // postcondition: data's elements sorted in ascending order
    public static void bubbleSortV( ArrayList<Comparable> data ) {
	boolean fullPass = false;
	while (! fullPass) {
	    fullPass = true;
	    for(int i = data.size() - 1; i > 0; i--) {
		if (data.get(i).compareTo(data.get(i - 1)) < 0) {
		    Comparable temp = data.get(i);
		    data.set(i, data.get(i - 1));
		    data.set(i - 1, temp);
		    fullPass = false;
		}
	    }
	}
		
	    
    }//end bubbleSortV -- O(?)


    // ArrayList-returning bubbleSort
    // postcondition: order of input ArrayList's elements unchanged
    //                Returns sorted copy of input ArrayList.
    public static ArrayList<Comparable> bubbleSort( ArrayList<Comparable> input ) {
	ArrayList<Comparable> data = new ArrayList<Comparable>();
	boolean fullPass = false;
	for(int i = 0; i < input.size(); i++) {
	    data.add(input.get(i));
	}
	while (! fullPass) {
	    fullPass = true;
	    for(int i = data.size() - 1; i > 0; i--) {
		if (data.get(i).compareTo(data.get(i - 1)) < 0) {
		    Comparable temp = data.get(i);
		    data.set(i, data.get(i - 1));
		    data.set(i - 1, temp);
		    fullPass = false;
		}
	    }
	}
	return data;
    }//end bubbleSort -- O(?)


    public static void main(String [] args){

	ArrayList george = new ArrayList<Integer>();
	george.add(7);
	george.add(1);
	george.add(5);
	george.add(12);
	george.add(3);
	System.out.println( "ArrayList george before sorting:\n" + george );
	bubbleSortV(george);
	System.out.println( "ArrayList george after sorting:\n" + george );

	ArrayList ringo = populate( 10, 1, 1000 );
	System.out.println( "ArrayList ringo before sorting:\n" + ringo );
	bubbleSortV(ringo);
	System.out.println( "ArrayList ringo after sorting:\n" + ringo );
	/*===============for VOID methods=============
	  ============================================*/

    	ArrayList glen = new ArrayList<Integer>();
	glen.add(7);
	glen.add(1);
	glen.add(5);
	glen.add(12);
	glen.add(3);
	System.out.println( "ArrayList glen before sorting:\n" + glen );
	ArrayList glenSorted = bubbleSort( glen );
	System.out.println( "sorted version of ArrayList glen:\n" 
			    + glenSorted );
	System.out.println( "ArrayList glen after sorting:\n" + glen );

      	ArrayList coco = populate( 10, 1, 1000 );
	System.out.println( "ArrayList coco before sorting:\n" + coco );
	ArrayList cocoSorted = bubbleSort( coco );
	System.out.println( "sorted version of ArrayList coco:\n" 
			    + cocoSorted );
	System.out.println( "ArrayList coco after sorting:\n" + coco );
	/*==========for AL-returning methods==========
	  ============================================*/

    }//end main

}//end class BubbleSort
