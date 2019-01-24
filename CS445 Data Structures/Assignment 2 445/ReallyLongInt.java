
// CS 0445 Spring 2017
// This is a partial implementation of the ReallyLongInt class.  You need to
// complete the implementations of the remaining methods.  Also, for this class
// to work, you must complete the implementation of the LinkedListPlus class.
// See additional comments below.
//Graham Hoehing
//Ramirez CS 445
public class ReallyLongInt extends LinkedListPlus<Integer> implements Comparable<ReallyLongInt> {
	// Instance variables are inherited. You may not add any new instance
	// variables

	// Default constructor
	private ReallyLongInt() {
		super();
	}

	// Note that we are adding the digits here in the FRONT. This is more
	// efficient
	// (no traversal is necessary) and results in the LEAST significant digit
	// first
	// in the list. It is assumed that String s is a valid representation of an
	// unsigned integer with no leading zeros.
	public ReallyLongInt(String s) {
		super();
		char c;
		int digit;
		// Iterate through the String, getting each character and converting it
		// into
		// an int. Then make an Integer and add at the front of the list. Note
		// that
		// the add() method (from A2LList) does not need to traverse the list
		// since
		// it is adding in position 1. Note also the the author's linked list
		// uses index 1 for the front of the list.
		for (int i = 0; i < s.length(); i++) {
			c = s.charAt(i);
			if (('0' <= c) && (c <= '9')) {
				digit = c - '0';
				this.add(1, new Integer(digit));
			} else
				throw new NumberFormatException("Illegal digit " + c);
		}
	}

	// Simple call to super to copy the nodes from the argument ReallyLongInt
	// into a new one.
	public ReallyLongInt(ReallyLongInt rightOp) {
		super(rightOp);
	}

	// Method to put digits of number into a String. Since the numbers are
	// stored "backward" (least significant digit first) we first reverse the
	// number, then traverse it to add the digits to a StringBuilder, then
	// reverse it again. This seems like a lot of work, but given the
	// limitations of the super classes it is what we must do.
	public String toString() {
		StringBuilder sb = new StringBuilder();
		if (numberOfEntries > 0) {
			this.reverse();
			for (Node curr = firstNode; curr != null; curr = curr.next) {
				sb.append(curr.data);
			}
			this.reverse();
		}
		return sb.toString();
	}

	// You must implement the methods below. See the descriptions in the
	// assignment sheet

	public ReallyLongInt add(ReallyLongInt rightOp) {
		Node leftcurr = firstNode;
		Node rightcurr = rightOp.firstNode;
		int carry = 0;
		ReallyLongInt temp = new ReallyLongInt();

		// same digits
		if (numberOfEntries == rightOp.numberOfEntries) {
			for (int i = 1; i <= numberOfEntries; i++) {
				int sum = leftcurr.getData() + rightcurr.getData() + carry;
				int place = sum % 10;
				carry = sum / 10;
				temp.add(place);
				if (i != numberOfEntries) {
					leftcurr = leftcurr.next;
					rightcurr = rightcurr.next;
				}
			}
			if (carry != 0)
				temp.add(carry);
		}

		// right has more digits
		if (numberOfEntries < rightOp.numberOfEntries) {

			// adding with 2 digits
			for (int i = 1; i <= numberOfEntries; i++) {
				int sum = leftcurr.getData() + rightcurr.getData() + carry;
				int place = sum % 10;
				carry = sum / 10;
				temp.add(place);
				leftcurr = leftcurr.next;
				rightcurr = rightcurr.next;
			}
			// adding with 1 digit
			for (int i = 1; i <= (rightOp.numberOfEntries - numberOfEntries); i++) {
				int sum = rightcurr.getData() + carry;
				int place = sum % 10;
				carry = sum / 10;
				temp.add(place);
				rightcurr = rightcurr.next;

			}
			if (carry != 0)
				temp.add(carry);
		}

		// left has more digits
		if (numberOfEntries > rightOp.numberOfEntries) {

			// adding with 2 digits
			for (int i = 1; i <= rightOp.numberOfEntries; i++) {
				int sum = leftcurr.getData() + rightcurr.getData() + carry;
				int place = sum % 10;
				carry = sum / 10;
				temp.add(place);
				leftcurr = leftcurr.next;
				rightcurr = rightcurr.next;

			}
			// adding with 1 digit
			for (int i = 1; i <= (numberOfEntries - rightOp.numberOfEntries); i++) {
				int sum = leftcurr.getData() + carry;
				int place = sum % 10;
				carry = sum / 10;
				temp.add(place);
				leftcurr = leftcurr.next;

			}
			if (carry != 0)
				temp.add(carry);
		}
		return temp;
	}

	// Subtraction
	public ReallyLongInt subtract(ReallyLongInt rightOp) {

		Node leftcurr = firstNode;
		Node rightcurr = rightOp.firstNode;

		int dif = 0;
		int token = 0;
		int shifty = 0;
		int x = 0, y = 0;
		ReallyLongInt temp = new ReallyLongInt();

		// same digits
		if (numberOfEntries == rightOp.numberOfEntries) {
			if (leftcurr.getData() < rightcurr.getData()) {
				throw new ArithmeticException("Invalid Difference -- Negative Number");
			}
			for (int i = 1; i <= numberOfEntries; i++) {
				x = leftcurr.getData();
				y = rightcurr.getData();

				if (token == 1) {
					x = x - 1;
					token = 0;
				}
				if (x < y) {
					dif = x - y;
					dif = 10 + dif;
					token = 1;
				} else {
					dif = x - y;
				}
				int place = dif % 10;

				if (place == 0) {
					shifty++;
				} else
					shifty = 0;

				temp.add(place);

				if (i != numberOfEntries) {
					leftcurr = leftcurr.next;
					rightcurr = rightcurr.next;

				}
			}

		}

		// right has more digits
		if (numberOfEntries < rightOp.numberOfEntries) {

			throw new ArithmeticException("java.lang.ArithmeticException: Invalid Difference -- Negative Number");

		}
		// left has more digits
		if (numberOfEntries > rightOp.numberOfEntries) {

			// subtracting with 2 digits
			for (int i = 1; i <= rightOp.numberOfEntries; i++) {
				x = leftcurr.getData();
				y = rightcurr.getData();
				if (token == 1) {
					x = x - 1;
					token = 0;

				}
				if (x < y) {
					dif = x - y;
					dif = 10 + dif;
					token = 1;
				} else {
					dif = x - y;
				}
				int place = dif % 10;
				if (place == 0) {
					shifty++;
				} else
					shifty = 0;

				temp.add(place);
				leftcurr = leftcurr.next;
				rightcurr = rightcurr.next;

			}
			// sub with 1 digit
			for (int i = 1; i <= (numberOfEntries - rightOp.numberOfEntries); i++) {
				dif = leftcurr.getData();
				if (token == 1) {
					dif = dif - 1;
					token = 0;

					if (dif == -1) {
						dif = 9;
						token = 1;

					}
				}
				int place = dif % 10;
				if (place == 0) {
					shifty++;
				} else
					shifty = 0;

				temp.add(place);
				leftcurr = leftcurr.next;

			}

		}

		temp.rightShift(shifty);

		return temp;

	}

	public int compareTo(ReallyLongInt rOp) {
		Integer current = new Integer(numberOfEntries);
		Integer other = new Integer(rOp.numberOfEntries);
		if (!((current.compareTo(other)) == 0)) {
			return current.compareTo(other);
		} else {
			Node curfirst = firstNode;
			Node otherfirst = rOp.firstNode;

			for (int i = 1; i <= numberOfEntries; i++) {
				if ((curfirst.getData().compareTo(otherfirst.getData())) < 0)
					return -1;
				if ((curfirst.getData().compareTo(otherfirst.getData())) > 0)
					return 1;
				curfirst = curfirst.next;
				otherfirst = otherfirst.next;
			}
			return 0;
		}
	}

	public boolean equals(Object rightOp) {
		return (this.compareTo((ReallyLongInt) rightOp) == 0);
	}

	public void multTenToThe(int num) {
		if (num > 0) {

			while (num > 0) {
				Integer zero = new Integer(0);
				add(1, zero);
				num--;
			}

		}
	}

	public void divTenToThe(int num) {
		if (num > 0) {
			leftShift(num);
		}
	}

}