// CS 0445 Spring 2017 
// LinkedListPlus<T> class partial implementation

// See the commented methods below.  You must complete this class by
// filling in the method bodies for the remaining methods.  Note that you
// may NOT add any new instance variables, but you may use method variables
// as needed.
//Graham Hoehing
//Ramirez CS 445


public class LinkedListPlus<T> extends A2LList<T> 
{
	// A no arg constructor that just makes an empty list
	public LinkedListPlus() 
	{
		super.clear();
	
	}
	
	// Copy constructor.  This is a "deepish" copy so it will make new
		// Node objects for all of the nodes in the old list.  However, it
		// is not totally deep since it does NOT make copies of the objects
		// within the Nodes -- rather it just copies the references.
	public LinkedListPlus(LinkedListPlus<T> oldList)
	{
			Node firstInOldList = oldList.firstNode;										
			
			firstNode = new Node(firstInOldList.getData())	;	   							
			numberOfEntries++;
			Node oldListNext = firstInOldList.getNextNode();										
			Node newListNext = new Node(oldListNext.getData()); 			 				
			firstNode.setNextNode(newListNext);												
			oldListNext = oldListNext.getNextNode();										
			numberOfEntries++;
		
			
			while(oldListNext != null)
			{												
				newListNext.setNextNode(new Node(oldListNext.getData())); 					
				newListNext = newListNext.getNextNode();									
				oldListNext = oldListNext.getNextNode();									
				numberOfEntries++;

			}
			
			
	}

	// Shift left num positions.  This will shift out the first num Nodes
		// of the list, with Node num+1 now being at the front.	
	public void leftShift(int num)
	{
		if(num >= numberOfEntries )
		{
			super.clear();
		}
		else if(num <= 0)
		{
			// Do nothing
		}
		else
		{
			
			for(int i = 0; i < num; i++)
			{
				firstNode = firstNode.getNextNode();
				numberOfEntries--;
			}
			
		}
	}
	
	// Remove num items from the end of the list
	public void rightShift(int num)
	{
		if(num >= numberOfEntries )
		{
			super.clear();
		}
		else if(num <= 0)
		{
			// Do nothing
		}
		else
		{	
			
			Node newTailNode = firstNode;
			
			
			for(int i = 1; i <= (numberOfEntries - num) - 1; i ++)
			{
				newTailNode = newTailNode.getNextNode();
			}
			
			newTailNode.setNextNode(null);   
			numberOfEntries -= num;
			
		}
	}
	
	/// Remove from the front and add at the end.  Note that this method should
	// not create any new Node objects -- it is simply moving them.  If num
	// is negative it should still work, actually doing a right rotation.
	public void leftRotate(int num)
	{
		if(num == 0)
		{
			// Do nothing
		}
		else if( num > 0 && num < numberOfEntries)
		{
			Node lastNode = firstNode;
			
			
			for(int i = 1; i <= numberOfEntries - 1  ; i++)
			{
				lastNode = lastNode.getNextNode();
			}
			
			lastNode.setNextNode(firstNode);		
			
			Node newEnd = firstNode;
			
			
			for(int i = 0; i < num - 1; i++ )
			{
				newEnd = newEnd.getNextNode();
			}
			
			firstNode = newEnd.getNextNode();		
			newEnd.setNextNode(null);				
			
		}
		else if(num > numberOfEntries)
		{
			while(num > numberOfEntries)
			{
				num -= numberOfEntries;
			}
			
			leftRotate(num);
		}
		else if(num < 0)
		{
			num = num * (-1);
			rightRotate(num);
			
		}
	}
	
	// Remove from the end and add at the front.  Note that this method should
	// not create any new Node objects -- it is simply moving them.  If num
	// is negative it should still work, actually doing a left rotation.
	public void rightRotate(int num)
	{
		if(num == 0)
		{
			// Do nothing
		}
		else if( num > 0 && num < numberOfEntries)
		{
			Node lastNode = firstNode;
			
			// this for loop will grab the last node in the list
			for(int i = 1; i <= numberOfEntries - 1  ; i++)
			{
				lastNode = lastNode.getNextNode();
			}
			
			lastNode.setNextNode(firstNode);		
			
			Node newEnd = firstNode;
			
			
			for(int i = 0; i < (numberOfEntries - num) - 1 ; i++ )
			{
				newEnd = newEnd.getNextNode();
			}
			
			firstNode = newEnd.getNextNode();		
			newEnd.setNextNode(null);				
			
			
		}
		else if(num > numberOfEntries)
		{
			while(num > numberOfEntries)
			{
				num -= numberOfEntries;
			}
			
			rightRotate(num);
		}
		else if(num < 0)
		{
			num = num * (-1);
			leftRotate(num);
			
		}
	}
	
	
	// Reverse the nodes in the list.  Note that this method should not create
		// any new Node objects -- it is simply moving them.
	public void reverse()
	{
		LinkedListPlus<T> temp = new LinkedListPlus<T>();					
		
		temp.firstNode = new Node(firstNode.getData());						
	
		if(firstNode.getNextNode() != null)
		{
		
			Node nextOldList = firstNode.getNextNode();							
			Node nextNewList = new Node(nextOldList.getData());					
		
		
			
			while(nextOldList != null)
			{
				nextNewList.setNextNode(temp.firstNode);
				temp.firstNode = nextNewList;
				nextOldList = nextOldList.getNextNode();
				if(nextOldList != null)
					nextNewList = new Node(nextOldList.getData());
		
			}
		
			firstNode = temp.firstNode;										
		}
		else
			firstNode = temp.firstNode;
			
	}
	
	// Make a StringBuilder then traverse the nodes of the list, appending the
		// toString() of the data for each node to the end of the StringBuilder.
		// Finally, return the StringBuilder as a String.
	public String toString()
	{
		
		StringBuilder b = new StringBuilder();
		for (Node curr = firstNode; curr != null; curr = curr.next)
		{
			b.append(curr.data.toString());
			b.append(" ");
		}
		return b.toString();
	}
	
}