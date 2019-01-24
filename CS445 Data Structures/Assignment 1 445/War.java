//Graham Hoehing 4108720
// John Ramerirez
//445 assignment 1

public class War {

	static MultiDS<Card> deck = new MultiDS<Card>(52);
	static MultiDS<Card> player1 = new MultiDS<Card>(52);
	static MultiDS<Card> player2 = new MultiDS<Card>(52);
	static MultiDS<Card> player1Discard = new MultiDS<Card>(52);
	static MultiDS<Card> player2Discard = new MultiDS<Card>(52);
	static MultiDS<Card> warZone = new MultiDS<Card>(52);

	public static void main(String[] args) {

		int rounds = 0;
		// takes the command line and turns it into an int
		int total = Integer.parseInt(args[0]);

		System.out.println(
				"Welcome to the game of War (Not the Mobile phone app, we don't need the Legend27 around here");
		System.out.println("Dealing the cards to the players...");
		// creates all cards. Probably could've used a for loop but I wanted to be sure
		Card c1 = new Card(Card.Suits.Diamonds, Card.Ranks.Two);
		Card c2 = new Card(Card.Suits.Hearts, Card.Ranks.Two);
		Card c3 = new Card(Card.Suits.Clubs, Card.Ranks.Two);
		Card c4 = new Card(Card.Suits.Spades, Card.Ranks.Two);
		Card c5 = new Card(Card.Suits.Diamonds, Card.Ranks.Three);
		Card c6 = new Card(Card.Suits.Hearts, Card.Ranks.Three);
		Card c7 = new Card(Card.Suits.Clubs, Card.Ranks.Three);
		Card c8 = new Card(Card.Suits.Spades, Card.Ranks.Three);
		Card c9 = new Card(Card.Suits.Diamonds, Card.Ranks.Four);
		Card c10 = new Card(Card.Suits.Hearts, Card.Ranks.Four);
		Card c11 = new Card(Card.Suits.Clubs, Card.Ranks.Four);
		Card c12 = new Card(Card.Suits.Spades, Card.Ranks.Four);
		Card c13 = new Card(Card.Suits.Diamonds, Card.Ranks.Five);
		Card c14 = new Card(Card.Suits.Hearts, Card.Ranks.Five);
		Card c15 = new Card(Card.Suits.Clubs, Card.Ranks.Five);
		Card c16 = new Card(Card.Suits.Spades, Card.Ranks.Five);
		Card c17 = new Card(Card.Suits.Diamonds, Card.Ranks.Six);
		Card c18 = new Card(Card.Suits.Hearts, Card.Ranks.Six);
		Card c19 = new Card(Card.Suits.Clubs, Card.Ranks.Six);
		Card c20 = new Card(Card.Suits.Spades, Card.Ranks.Six);
		Card c21 = new Card(Card.Suits.Diamonds, Card.Ranks.Seven);
		Card c22 = new Card(Card.Suits.Hearts, Card.Ranks.Seven);
		Card c23 = new Card(Card.Suits.Clubs, Card.Ranks.Seven);
		Card c24 = new Card(Card.Suits.Spades, Card.Ranks.Seven);
		Card c25 = new Card(Card.Suits.Diamonds, Card.Ranks.Eight);
		Card c26 = new Card(Card.Suits.Hearts, Card.Ranks.Eight);
		Card c27 = new Card(Card.Suits.Clubs, Card.Ranks.Eight);
		Card c28 = new Card(Card.Suits.Spades, Card.Ranks.Eight);
		Card c29 = new Card(Card.Suits.Diamonds, Card.Ranks.Nine);
		Card c30 = new Card(Card.Suits.Hearts, Card.Ranks.Nine);
		Card c31 = new Card(Card.Suits.Clubs, Card.Ranks.Nine);
		Card c32 = new Card(Card.Suits.Spades, Card.Ranks.Nine);
		Card c33 = new Card(Card.Suits.Diamonds, Card.Ranks.Ten);
		Card c34 = new Card(Card.Suits.Hearts, Card.Ranks.Ten);
		Card c35 = new Card(Card.Suits.Clubs, Card.Ranks.Ten);
		Card c36 = new Card(Card.Suits.Spades, Card.Ranks.Ten);
		Card c37 = new Card(Card.Suits.Diamonds, Card.Ranks.Jack);
		Card c38 = new Card(Card.Suits.Hearts, Card.Ranks.Jack);
		Card c39 = new Card(Card.Suits.Clubs, Card.Ranks.Jack);
		Card c40 = new Card(Card.Suits.Spades, Card.Ranks.Jack);
		Card c41 = new Card(Card.Suits.Diamonds, Card.Ranks.Queen);
		Card c42 = new Card(Card.Suits.Hearts, Card.Ranks.Queen);
		Card c43 = new Card(Card.Suits.Clubs, Card.Ranks.Queen);
		Card c44 = new Card(Card.Suits.Spades, Card.Ranks.Queen);
		Card c45 = new Card(Card.Suits.Diamonds, Card.Ranks.King);
		Card c46 = new Card(Card.Suits.Hearts, Card.Ranks.King);
		Card c47 = new Card(Card.Suits.Clubs, Card.Ranks.King);
		Card c48 = new Card(Card.Suits.Spades, Card.Ranks.King);
		Card c49 = new Card(Card.Suits.Diamonds, Card.Ranks.Ace);
		Card c50 = new Card(Card.Suits.Hearts, Card.Ranks.Ace);
		Card c51 = new Card(Card.Suits.Clubs, Card.Ranks.Ace);
		Card c52 = new Card(Card.Suits.Spades, Card.Ranks.Ace);

		// adds all of the cards into the deck
		deck.addItem(c1);
		deck.addItem(c2);
		deck.addItem(c3);
		deck.addItem(c4);
		deck.addItem(c5);
		deck.addItem(c6);
		deck.addItem(c7);
		deck.addItem(c8);
		deck.addItem(c9);
		deck.addItem(c10);
		deck.addItem(c11);
		deck.addItem(c12);
		deck.addItem(c13);
		deck.addItem(c14);
		deck.addItem(c15);
		deck.addItem(c16);
		deck.addItem(c17);
		deck.addItem(c18);
		deck.addItem(c19);
		deck.addItem(c20);
		deck.addItem(c21);
		deck.addItem(c22);
		deck.addItem(c23);
		deck.addItem(c24);
		deck.addItem(c25);
		deck.addItem(c26);
		deck.addItem(c27);
		deck.addItem(c28);
		deck.addItem(c29);
		deck.addItem(c30);
		deck.addItem(c31);
		deck.addItem(c32);
		deck.addItem(c33);
		deck.addItem(c34);
		deck.addItem(c35);
		deck.addItem(c36);
		deck.addItem(c37);
		deck.addItem(c38);
		deck.addItem(c39);
		deck.addItem(c40);
		deck.addItem(c41);
		deck.addItem(c42);
		deck.addItem(c43);
		deck.addItem(c44);
		deck.addItem(c45);
		deck.addItem(c46);
		deck.addItem(c47);
		deck.addItem(c48);
		deck.addItem(c49);
		deck.addItem(c50);
		deck.addItem(c51);
		deck.addItem(c52);

		// shuffles
		deck.shuffle();

		// deal em
		int count2 = 0;
		while (count2 < 26) {

			player1.addItem(deck.removeItem());
			player2.addItem(deck.removeItem());
			count2++;

		}
		// prints each player's deck
		System.out.println(" ");
		System.out.println("Player 1 cards\n" + player1.toString());
		System.out.println(" ");
		System.out.println("Player 2 cards\n" + player2.toString());
		System.out.println(" ");

		while (rounds < total) {
			// The games begin
			if (player1.empty()) {

				if (player1Discard.empty()) {
					System.out.println("Player 2 Wins! Poor Player 1, they ran out of cards!");

					break;
				}
				System.out.println("Shuffling deck and adding discard piles");
				player1Discard.shuffle();
				while (!player1Discard.empty()) {
					player1.addItem(player1Discard.removeItem());
				}

			}

			if (player2.empty()) {
				if (player2Discard.empty()) {
					System.out.println("Player 1 Wins! Poor Player 2, they ran out of cards!");
					break;
				}
				System.out.println("Shuffling deck and adding discard piles");
				player2Discard.shuffle();
				while (!player2Discard.empty()) {
					player2.addItem(player2Discard.removeItem());
				}

			}
			Card p1 = player1.removeItem();
			Card p2 = player2.removeItem();
			if (p1 != null & p2 != null) {
				compareCards(p1, p2);
			}

			// when round limit is reached the winner is determined
			rounds++;
			if (rounds == total) {

				int totalP1 = (player1.count) + (player1Discard.count);
				int totalP2 = (player2.count) + (player2Discard.count);
				System.out.println("The round limit has been reached. Counting cards... ");
				if (totalP1 > totalP2) {
					System.out.println("Player 1 Card Total: " + totalP1);
					System.out.println("Player 2 Card Total: " + totalP2);
					System.out.println("Player 1 Wins");
				} else if (totalP1 < totalP2) {
					System.out.println("Player 1 Card Total: " + totalP1);
					System.out.println("Player 2 Card Total: " + totalP2);
					System.out.println("Player 2 Wins");
				} else {
					System.out.println("Player 1 Card Total: " + totalP1);
					System.out.println("Player 2 Card Total: " + totalP2);
					System.out.println("The both players have the same number of cards. Looks like its a tie.");
				}

			}
		}

	}

	// handles the comparing of cards
	public static void compareCards(Card x, Card y) {

		if (x != null || (y != null)) {

			int result = x.compareTo(y);
			//player1 wins the hand
			if (result > 0) {
				System.out.println("Player 1 wins: " + x + " beats " + y);
				player1Discard.addItem(x);
				player1Discard.addItem(y);
			}
			//player 2 wins the hand
			else if (result < 0) {
				System.out.println("Player 2 wins: " + x + " loses to " + y);
				player2Discard.addItem(x);
				player2Discard.addItem(y);

			}
			// if a war happens
			else {
				System.out.println(x + " ties " + y);
				warZone.addItem(x);
				warZone.addItem(y);
				if (player1.empty()) {
					System.out.println("Shuffling deck and adding discard piles");
					player1Discard.shuffle();
					while (!player1Discard.empty()) {
						player1.addItem(player1Discard.removeItem());
					}
				} else if (player2.empty()) {
					System.out.println("Shuffling deck and adding discard piles");
					player2Discard.shuffle();
					while (!player2Discard.empty()) {

						player2.addItem(player2Discard.removeItem());
					}
				}
				if (!player1.empty() && (!player2.empty())) {
					Card war1 = player1.removeItem();
					Card war2 = player2.removeItem();
					System.out.println("Player 1 is risking " + war1);
					System.out.println("Player 2 is risking " + war2);
					warZone.addItem(war1);
					warZone.addItem(war2);
				}
				if (player1.empty()) {

					if (player1Discard.empty()) {
						System.out.println("Player 2 Wins! Player 1 ran out of cards!");
						System.exit(0);

					}
					System.out.println("Shuffling deck and adding discard piles");
					player1Discard.shuffle();
					while (!player1Discard.empty()) {
						player1.addItem(player1Discard.removeItem());
					}

				}
				if (player2.empty()) {
					if (player2Discard.empty()) {
						System.out.println("Player 1 Wins! Player 2 ran out of cards!");
						System.exit(0);

					}
					System.out.println("Shuffling deck and adding discard piles");
					player2Discard.shuffle();
					while (!player2Discard.empty()) {
						player2.addItem(player2Discard.removeItem());
					}
				}
				if (!player1.empty() && (!player2.empty())) {
					Card w1 = player1.removeItem();
					Card w2 = player2.removeItem();
					if (w1 != null & w2 != null) {
						int warResult = w1.compareTo(w2);

						warZone.addItem(w1);
						warZone.addItem(w2);
						if (warResult > 0) {
							System.out.println("Player 1 wins " + w1 + " beats " + w2);
							while (!warZone.empty()) {
								player1Discard.addItem(warZone.removeItem());
							}
						} else if (warResult < 0) {
							System.out.println("Player 2 wins " + w2 + " beats " + w1);
							while (!warZone.empty()) {
								player2Discard.addItem(warZone.removeItem());
							}
						}
					}

				}

			}
		}
	}
}