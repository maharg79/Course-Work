Graham Hoehing- CS 447 Project1 Zombies.asm
3/15/2017

Algorithm Explained:
- The maze is created by looping through the maze text file, a LED is lit wherever an 'x' is present
in the maze text. The player is placed at 1,1 and the zombies in their respective quadrants.
-My code works that the polling function constantly loops checking for key input from the 
user. Upon receiving input, we move to the appropriate keys own function where the move is
checked for legality (Not a wall). If legal, we move to a seprate function that performs
move. Afterwards player position is updated and Zombies are moved (more on Zombies soon).
If a player tries and moves onto a square occupied by a Zombie, the player will lose and
the game will end immediately. During the polling process, a check is made if 500ms have
passed since the Zombies had last move( Compares current system time with "old time", which
is the last time the zombies moved, this value is set to zero intially.) if 500ms have passed,
the code moves to the "makemovez" function wherein the first zombie (the bottom left) is
moved. A random number generator selects the direction in which the zombie moves. The Zombie
will move in the selected random direction. And its postion and direction are saved. On sub-
sequent moves, the Zombie will reroll its random number again if it tries to move in the re-
verse direction of its last move, only moving in the reverse direction if there are no other
viable moves.After the first Zombie moves, we move to a very similar function for the other
zombies. Once the 4th zombie has moved the previous "current time" becomes the new "old time"
and we return to the polling loop. When the player reaches the point 63,63, the player wins
the game, if the player makes contact with a Zombie, the player loses the game. Appropriate
messages are shown for both as well as steps taken should the player win the game. 


NOTE: The first move of the game must be made with the onscreen keypad, all others may be made with the keypad or using WASD. (This is also noted in Bugs/Errors)








Bugs/Errors:
-Zombies make no real attempt to chase player 
-Game Starts Immediately (b key doesn't do anything)
-First move in game MUST be mad using on-screen keypad all other moves may be made via WASD
-If you run into a wall for about 10 seconds uninterupted the game will sometimes seize up
-Sometimes if the game runs fro a prolonged time (about 2 minutes) it will end displayig
either the win text or the lose text.