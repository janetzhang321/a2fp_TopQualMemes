/*======================================
  class InsertionSort -- implements InsertionSort algorithm
  ======================================*/

// ~~~~~~~~ QUESTIONS ~~~~~~~~
/*
   Q1: Is more work done toward beginning or end of insertion sort? Why? 
       - toward the end, because you have to make comparisons across a bigger subarray
   Q2: For n items, how many passes are necessary to sort? 
       - n - 1
   Q3: What is known after pass p, and how do you know it? 
       - p items are ordered, if not in their final resting place
       - we know this because everything before index p has already been sorted; then we insert data[p] into its correct ordered location, so p - 1 + 1 items must be sorted (the inner loop guarantees this)
   Q4: What is the runtime classification of this sort? 
       - O(n^2)
*/

import java.util.ArrayList;

public class InsertionSort {

    //~~~~~~~~~~~~~~~~~~~ HELPER METHODS ~~~~~~~~~~~~~~~~~~~
    //precond: lo < hi && size > 0
    //postcond: returns an ArrayList of random integers
    //          from lo to hi, inclusive
    public static ArrayList populate( int size, int lo, int hi ) {
	ArrayList<Integer> retAL = new ArrayList<Integer>();
	while( size > 0 ) {
	    //     offset + rand int on interval [lo,hi]
	    retAL.add( lo + (int)( (hi-lo+1) * Math.random() ) );
	    size--;
	}
	return retAL;
    }

    //randomly rearrange elements of an ArrayList
    public static void shuffle( ArrayList al ) {
	int randomIndex;
        for( int i = al.size()-1; i > 0; i-- ) {
	    //pick an index at random
            randomIndex = (int)( (i+1) * Math.random() );
	    //swap the values at position i and randomIndex
            al.set( i, al.set( randomIndex, al.get(i) ) );
        }
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    public static void swap(ArrayList<Comparable> data, int i1, int i2) {
	Comparable temp = data.get(i1);
	data.set(i1, data.get(i2));
	data.set(i2, temp);
    }

    public static Comparable findMin(ArrayList<Comparable> data, int lowBound) {
	Comparable min = data.get(lowBound);
	for(int i = lowBound; i < data.size(); i++) {
	    if (data.get(i).compareTo(min) == -1) min = data.get(i);
	}
	return min;
    }

    
    // VOID version of InsertionSort
    // Rearranges elements of input ArrayList
    // postcondition: data's elements sorted in ascending order
    public static void insertionSortV( ArrayList<Comparable> data ) 
    {
	for(int i = 1; i < data.size() - 1; i++) {
	    Comparable current = data.get(i);
	    int j = i - 1;
	    while( j >= 0 && data.get(j).compareTo(current) == 1 ) {
		data.set(j + 1, data.get(j));
		j--;
	    }
	    data.set(j + 1, current);
	}
    }//end insertionSort -- O(n^2)
    
    // ArrayList-returning insertionSort
    // postcondition: order of input ArrayList's elements unchanged
    //                Returns sorted copy of input ArrayList.
    public static ArrayList<Comparable> 
	insertionSort( ArrayList<Comparable> input ) 
    {
	ArrayList<Comparable> data = new ArrayList<Comparable>();
	for(int i = 0; i < input.size(); i++) {
	    data.add(input.get(i));
	}
	for(int i = 0; i < data.size() - 1; i++) {
	    Comparable current = data.get(i);
	    int j = i - 1;
	    while( j >= 0 && data.get(j).compareTo(current) == 1 ) {
		data.set(j + 1, data.get(j));
		j--;
	    }
	    data.set(j + 1, current);
	}
	return data;
	/* your implementation UP IN HERE, UP IN HERE */
    }//end insertionSort -- O(?)


    //main method for testing
    public static void main( String [] args ) {

	  ArrayList you = new ArrayList<Integer>();
	  you.add(7);
	  you.add(1);
	  you.add(5);
	  you.add(12);
	  you.add(3);
	  System.out.println( "ArrayList you before sorting:\n" + you );
	  insertionSortV(you);
	  System.out.println( "ArrayList you after sorting:\n" + you );
	
	  ArrayList go = populate( 10, 1, 1000 );
	  System.out.println( "ArrayList go before sorting:\n" + go );
	  insertionSortV(go);
	  System.out.println( "ArrayList go after sorting:\n" + go );
	/*===============for VOID methods=============
	  ============================================*/

	  ArrayList glen = new ArrayList<Integer>();
	  glen.add(7);
	  glen.add(1);
	  glen.add(5);
	  glen.add(12);
	  glen.add(3);
	  System.out.println( "ArrayList glen before sorting:\n" + glen );
	  ArrayList glenSorted = insertionSort( glen );
	  System.out.println( "sorted version of ArrayList glen:\n" 
	  + glenSorted );
	  System.out.println( "ArrayList glen after sorting:\n" + glen );

	  ArrayList coco = populate( 10, 1, 1000 );
	  System.out.println( "ArrayList coco before sorting:\n" + coco );
	  ArrayList cocoSorted = insertionSort( coco );
	  System.out.println( "sorted version of ArrayList coco:\n" 
	  + cocoSorted );
	  System.out.println( "ArrayList coco after sorting:\n" + coco );
	/*==========for AL-returning methods==========
	  ============================================*/

    }//end main

}//end class InsertionSort
