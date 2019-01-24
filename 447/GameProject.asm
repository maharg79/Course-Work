.data
x: .byte 'x'
start: .byte 0
Ppos: .byte 0,0
random: .byte
oldtime: .word 64 #Time of prior move
dir: .byte 0,1,2,3 
currtime: .word 64 #Current time
Zpos: .byte 0,6,61,2,6,62,3,63,62 #starting positions of each Zombie
Zdir: .byte 0,0,0,0
moves: .word 0
winner: .asciiz "\nYou Win! Moves made:"
loser: .asciiz "\nYou Lose!"
maze:	.ascii
	# 0123456701234567012345670123456701234567012345670123456701234567
	 "  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",    # 0
	 "       xx      xx      xx      xx      xx      xx      xx      x",    # 1
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 2
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 3
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 4
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 5
	 "x                                                              x",    # 6
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 7
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 8
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 9
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 10
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 11
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 12
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 13
	 "x                                                              x",    # 14
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 15
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 16
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 17
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 18
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 19
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 20
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 21
	 "x                                                              x",    # 22
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 23
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 24
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 25
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 26
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 27
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 28
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 29
	 "x                                                              x",    # 30
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 31
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 32
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 33
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 34
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 35
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 36
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 37
	 "x                                                              x",    # 38
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 39
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 40
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 41
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 42
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 43
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 44
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 45
	 "x                                                              x",    # 46
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 47
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 48
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 49
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 50
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 51
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 52
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 53
	 "x                                                              x",    # 54
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 55
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 56
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 57
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 58
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 59
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 60
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 61
	 "x                                                               ",    # 62
	 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  "     # 63
	# for each "x", turn the corresponding LED to orange.  The other LEDs should
	# be set to off.
.text

jal player
li $a0, 0
li $a1, 0
li $a2, 2
la $a3, maze
jal mazer



#player starting point
player:
li $a0,0
li $a1,0
li $a2,3
j _setLED


#Base MazeMaker
mazer:
lb  $s2,x
lb  $s1,1($a3)
addi $a3,$a3,1
addi $a0,$a0,1
beq $s1,$s2, checker
beq $a0,64,nextline
beq $s1,$zero,exit
jal mazer

#Shifts Y value
nextline:
addi $a1,$a1,1
li  $a0,0
beq $a1,63,exit
jal mazer

#Manages jump/link
checker:
jal _setLED
jal mazer
#finishes
exit:
j main


main:
jal player
la $a3, Zpos
jal zombies

main2:
li $t1,0
li $s4, 0
#Readies starting position again
li $a0,0
li $a1,0
li $a2, 3
jal poll
zombies:
li $a2,1
lb $s1,1($a3)
addi $a3,$a3,1
move $a0,$s1
lb $s1,1($a3)
addi $a3,$a3,1
move $a1,$s1
jal _setLED
beq $a1,62,main2
jal zombies




# _setLED and _getLED functions for Keypad and LED Display Simulator (64x64)
#
# These functions may be used in your CS/CoE 0447 Project 1.
# They provide a convenient interface to the Keypad and LED Display Simulator
# extension (64x64) in Mars4_5-Pitt.  For arguments and return values,
# read the comments above each; call them like any other MIPS function.
#
# If you're really interested, look through the code to show yourself
# how it works, or even practice writing these yourself!  You know
# all the pieces; try fitting them together!


	# void _setLED(int x, int y, int color)
	#   sets the LED at (x,y) to color
	#   color: 0=off, 1=red, 2=yellow, 3=green
	#
	# arguments: $a0 is x, $a1 is y, $a2 is color
	# trashes:   $t0-$t3
	# returns:   none
	#
_setLED:
	# byte offset into display = y * 16 bytes + (x / 4)
	sll	$t0,$a1,4      # y * 16 bytes
	srl	$t1,$a0,2      # x / 4
	add	$t0,$t0,$t1    # byte offset into display
	li	$t2,0xffff0008 # base address of LED display
	add	$t0,$t2,$t0    # address of byte with the LED
	# now, compute led position in the byte and the mask for it
	andi	$t1,$a0,0x3    # remainder is led position in byte
	neg	$t1,$t1        # negate position for subtraction
	addi	$t1,$t1,3      # bit positions in reverse order
	sll	$t1,$t1,1      # led is 2 bits
	# compute two masks: one to clear field, one to set new color
	li	$t2,3		
	sllv	$t2,$t2,$t1
	not	$t2,$t2        # bit mask for clearing current color
	sllv	$t1,$a2,$t1    # bit mask for setting color
	# get current LED value, set the new field, store it back to LED
	lbu	$t3,0($t0)     # read current LED value	
	and	$t3,$t3,$t2    # clear the field for the color
	or	$t3,$t3,$t1    # set color field
	sb	$t3,0($t0)     # update display
	jr	$ra
	
	# int _getLED(int x, int y)
	#   returns the value of the LED at position (x,y)
	#
	#  arguments: $a0 holds x, $a1 holds y
	#  trashes:   $t0-$t2
	#  returns:   $v0 holds the value of the LED (0, 1, 2 or 3)
	#
_getLED:
	# byte offset into display = y * 16 bytes + (x / 4)
	sll  $t0,$a1,4      # y * 16 bytes
	srl  $t1,$a0,2      # x / 4
	add  $t0,$t0,$t1    # byte offset into display
	la   $t2,0xffff0008
	add  $t0,$t2,$t0    # address of byte with the LED
	# now, compute bit position in the byte and the mask for it
	andi $t1,$a0,0x3    # remainder is bit position in byte
	neg  $t1,$t1        # negate position for subtraction
	addi $t1,$t1,3      # bit positions in reverse order
    	sll  $t1,$t1,1      # led is 2 bits
	# load LED value, get the desired bit in the loaded byte
	lbu  $t2,0($t0)
	srlv $t2,$t2,$t1    # shift LED value to lsb position
	andi $v0,$t2,0x3    # mask off any remaining upper bits
	jr   $ra

		
	
poll:	
	move $a0,$zero
	move $a1,$zero
	#Gets system time				
	li $v0,30
	syscall
	move $s3,$a0
	#Subtracts Old time from current time if this number is greater thAN 500 branch to moving zombies
	sub $t1,$s3,$s4
	bge $t1,500,makemovez
	ble $t1,-500,makemovez
	la	$v0,0xffff0000		# address for reading key press status
	lw $t0,0($v0)		# read the key press status
	andi $t0,$t0,1	
	beq	$t0,$0,poll	# no key pressed
	lw	$t0,4($v0)		# read key value
lkey:	addi	$v0,$t0,-226 # check for left key press
	bne	$v0,$0,rkey
	la $t0, Ppos
	lb $a0,0($t0)
	lb $a1,1($t0)
	addi $a0, $a0,-1
	jal  _getLED
	addi $a0,$a0,1
	beq $v0,1,lose
	beqz $v0,moverl		# goes to moverl
			
	jal	makemovez
	
rkey:	addi	$v0,$t0,-227		# check for right key press
	bne	$v0,$0,ukey
	la $t0, Ppos
	lb $a0,0($t0)
	lb $a1,1($t0)		# if key pressed wasn't 'D'/right on pad tries 'W'/up on pad
	addi $a0, $a0,1
	jal _getLED
	addi $a0,$a0,-1
	beq $v0,1,lose
	beqz $v0,moverr		#goes to moverr
	jal	makemovez
	
bkey:	addi	$v0,$t0,-66
#readies the program for starting Doesn't work :(
	la $t1,start
	li $t0,1
	sb $t0,0($t1)	# check for center key press
	bne	$v0,$0,poll		# invalid key, ignore it
	jal poll
	
ukey:	addi	$v0,$t0,-224		# check for right key press
	bne	$v0,$0,dkey
	la $t0, Ppos
	lb $a0,0($t0)
	lb $a1,1($t0)		# if Key pressed wasn't 'W'/up on pad, tries 'S'/down on pad
	addi $a1, $a1,-1
	jal _getLED
	addi $a1,$a1,1
	beq $v0,1,lose
	beqz $v0,moveru			#Goes to moveru
	jal	makemovez
	
dkey:	addi	$v0,$t0,-225		
	bne	$v0,$0,poll
	la $t0, Ppos
	lb $a0,0($t0)
	lb $a1,1($t0)		
	addi $a1, $a1,1
	jal _getLED
	addi $a1,$a1,-1
	beq $v0,1,lose
	beqz $v0,moverd 		#Goes to moverd
	jal	makemovez
moverl:
li $a2,0
jal _setLED
li $a2,3
addi $a0,$a0,-1
jal _setLED
move $s1,$a0
#increments number of moves made
lw  $a0, moves
addi $a0,$a0,1
sw $a0,moves
move $a0, $s1
beq  $a0,63,win

la $t0, Ppos
sb $a0,0($t0)
jal makemovez

moverr:
li $a2,0
jal _setLED
li $a2,3
addi $a0,$a0,1
jal _setLED
move $s1,$a0
#increments number of moves made
lw $a0, moves
addi $a0,$a0,1
sw $a0,moves
move $a0, $s1
beq $a0,63,checky
la $t0, Ppos
sb $a0,0($t0)
jal makemovez

moveru:
li $a2,0
jal _setLED
li $a2,3
addi $a1,$a1,-1
jal _setLED
move $s1,$a0
#increments number of moves made
lw  $a0, moves
addi $a0,$a0,1
sw $a0,moves
move $a0, $s1
beq  $a0,63,win
la $t0, Ppos
sb $a1,1($t0)
jal makemovez

moverd:
li $a2,0
jal _setLED
li $a2,3
addi $a1,$a1,1
jal _setLED
move $s1,$a0
#increments number of moves made
lw   $a0, moves
addi $a0,$a0,1
sw $a0,moves
move $a0, $s1
beq $a0,63,win
la $t0, Ppos
sb $a1,1($t0)
jal makemovez

#Occurs when player reaches point 63,63 on the maze grid		
win:
li $v0,4
la $a0,winner
syscall
move $t0, $v0
li $v0,1
lw $a0,moves
syscall 
jal end

#Handles Zombie motion every 500ms
makemovez:
li $a0,1
li $a1,5
li $v0,42
syscall
move $t1,$a0

la $t2,Zdir
sb $t1,0($t2)

la $t0,Zpos
lb $a0,1($t0)
lb $a1,2($t0)
move $s0,$a0
move $s1,$a1

beq $t1,1,movezl
beq $t1,2,movezu
beq $t1,3,movezr
beq $t1,4,movezd
j makemovez




movezl:
la $t1,Zdir
lb $t2,0($t1)
beq $t2,3,makemovez
move $a0,$s0
move $a1,$s1
addi $a0,$a0,-1
beq $a0,-1,makemovez
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez
addi $a0,$a0,1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,-1
jal _setLED
la $t0, Zpos
sb $a0,1($t0)
la $t2,Zdir
li $t1,1
sb $t1,1($t2)


jal makemovez2

movezr:
la $t1,Zdir
lb $t2,0($t1)
beq $t2,1,makemovez
move $a0,$s0
move $a1,$s1
addi $a0,$a0,1
beq $a0,64,makemovez
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez
addi $a0,$a0,-1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,1
jal _setLED
la $t0, Zpos
sb $a0,1($t0)

la $t2,Zdir
li $t1,3
sb $t1,0($t2)

jal makemovez2

movezu:
la $t1,Zdir
lb $t2,0($t1)
beq $t2,4,makemovez
move $a0,$s0
move $a1,$s1
addi $a1,$a1,-1
beq $a1,31,makemovez
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez
addi $a1,$a1,1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,-1
jal _setLED
la $t0, Zpos
sb $a1,2($t0)

la $t2,Zdir
li $t1,2
sb $t1,0($t2)
jal makemovez2

movezd:
la $t1,Zdir
lb $t2,0($t1)
beq $t2,2,makemovez
move $a0,$s0
move $a1,$s1
addi $a1,$a1,1
beq $a1,64,makemovez
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez
addi $a1,$a1,-1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,1
jal _setLED
la $t0, Zpos
sb $a1,2($t0)

la $t2,Zdir
li $t1,4
sb $t1,0($t2)

jal makemovez2

makemovez2:
li $a0,1
li $a1,5
li $v0,42
syscall
move $t1,$a0

la $t2,Zdir
sb $t1,1($t2)

la $t0,Zpos
lb $a0,3($t0)
lb $a1,4($t0)
move $s0,$a0
move $s1,$a1

beq $t1,1,movezl2
beq $t1,2,movezu2
beq $t1,3,movezr2
beq $t1,4,movezd2
j makemovez2




movezl2:
la $t1,Zdir
lb $t2,1($t1)
beq $t2,3,makemovez2
move $a0,$s0
move $a1,$s1
addi $a0,$a0,-1
beq $a0,-1,makemovez2
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez2
addi $a0,$a0,1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,-1
jal _setLED
la $t0, Zpos
sb $a0,3($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,1
sb $t1,1($t2)

jal makemovez3

movezr2:
la $t1,Zdir
lb $t2,1($t1)
beq $t2,1,makemovez2
move $a0,$s0
move $a1,$s1
addi $a0,$a0,1
beq $a0,31,makemovez2
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez2
addi $a0,$a0,-1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,1
jal _setLED
la $t0, Zpos
sb $a0,3($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,3
sb $t1,1($t2)
jal makemovez3

#moves second zombie up
movezu2:
la $t1,Zdir
lb $t2,1($t1)
beq $t2,4,makemovez2
move $a0,$s0
move $a1,$s1
addi $a1,$a1,-1
beq $a1,-1,makemovez2
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez2
addi $a1,$a1,1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,-1
jal _setLED
la $t0, Zpos
sb $a1,4($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3
move $a0,$s2
la $t2,Zdir
li $t1,2
sb $t1,1($t2)
jal makemovez3

#Moves second zombie down
movezd2:
la $t1,Zdir
lb $t2,1($t1)
beq $t2,2,makemovez2
move $a0,$s0
move $a1,$s1
addi $a1,$a1,1
beq $a1,31,makemovez2
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez2
addi $a1,$a1,-1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,1
jal _setLED
la $t0, Zpos
sb $a1,4($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3

move $a0,$s2
la $t2,Zdir
li $t1,4
sb $t1,1($t2)
jal makemovez3

#moves 3rd Zombie
makemovez3:
li $a0,1
li $a1,5
li $v0,42
syscall
move $t1,$a0

la $t2,Zdir
sb $t1,2($t2)

la $t0,Zpos
lb $a0,5($t0)
lb $a1,6($t0)
move $s0,$a0
move $s1,$a1

beq $t1,1,movezl3
beq $t1,2,movezu3
beq $t1,3,movezr3
beq $t1,4,movezd3
j makemovez3



#handles Left movement of 3rd zombie
movezl3:
la $t1,Zdir
lb $t2,2($t1)
beq $t2,3,makemovez3
move $a0,$s0
move $a1,$s1
addi $a0,$a0,-1
beq $a0,31,makemovez3
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez3
addi $a0,$a0,1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,-1
jal _setLED
la $t0, Zpos
sb $a0,5($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,1
sb $t1,2($t2)

jal makemovez4

#handles right movement of 3rd zombie
movezr3:
la $t1,Zdir
lb $t2,2($t1)
beq $t2,1,makemovez3
move $a0,$s0
move $a1,$s1
addi $a0,$a0,1
beq $a0,31,makemovez3
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez3
addi $a0,$a0,-1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,1
jal _setLED
la $t0, Zpos
sb $a0,5($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,3
sb $t1,2($t2)
jal makemovez4

#handles upward movement for 3rd Zombie
movezu3:
la $t1,Zdir
lb $t2,2($t1)
beq $t2,4,makemovez3
move $a0,$s0
move $a1,$s1
addi $a1,$a1,-1
beq $a1,-1,makemovez3
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez3
addi $a1,$a1,1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,-1
jal _setLED
la $t0, Zpos
sb $a1,6($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3
move $a0,$s2
la $t2,Zdir
li $t1,2
sb $t1,2($t2)
jal makemovez4

#moves third zombie down
movezd3:
la $t1,Zdir
lb $t2,2($t1)
beq $t2,2,makemovez3
move $a0,$s0
move $a1,$s1
addi $a1,$a1,1
beq $a1,31,makemovez3
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez3
addi $a1,$a1,-1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,1
jal _setLED
la $t0, Zpos
sb $a1,6($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3

move $a0,$s2
la $t2,Zdir
li $t1,4
sb $t1,2($t2)
jal makemovez4

#moves 4th zombie
makemovez4:
li $a0,1
li $a1,4
li $v0,42
syscall
move $t1,$a0

la $t2,Zdir
sb $t1,3($t2)

la $t0,Zpos
lb $a0,7($t0)
lb $a1,8($t0)
move $s0,$a0
move $s1,$a1

beq $t1,1,movezl4
beq $t1,2,movezu4
beq $t1,3,movezr4
beq $t1,4,movezd4
j makemovez4




movezl4:
la $t1,Zdir
lb $t2,3($t1)
beq $t2,3,makemovez4
move $a0,$s0
move $a1,$s1
addi $a0,$a0,-1
beq $a0,31,makemovez4
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez4
addi $a0,$a0,1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,-1
jal _setLED
la $t0, Zpos
sb $a0,7($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,1
sb $t1,3($t2)

jal poll

movezr4:
la $t1,Zdir
lb $t2,3($t1)
beq $t2,1,makemovez3
move $a0,$s0
move $a1,$s1
addi $a0,$a0,1
beq $a0,64,makemovez4
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez4
addi $a0,$a0,-1
li $a2,0
jal _setLED
li $a2,1
addi $a0,$a0,1
jal _setLED
la $t0, Zpos
sb $a0,7($t0)

#Moves Current time to old time
move $s4,$s3
la $t2,Zdir
li $t1,3
sb $t1,3($t2)
jal poll

movezu4:
la $t1,Zdir
lb $t2,3($t1)
beq $t2,4,makemovez4
move $a0,$s0
move $a1,$s1
addi $a1,$a1,-1
beq $a1,31,makemovez4
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez4
addi $a1,$a1,1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,-1
jal _setLED
la $t0, Zpos
sb $a1,8($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3
move $a0,$s2
la $t2,Zdir
li $t1,2
sb $t1,2($t2)
jal poll

movezd4:
la $t1,Zdir
lb $t2,3($t1)
beq $t2,2,makemovez4
move $a0,$s0
move $a1,$s1
addi $a1,$a1,1
beq $a1,31,makemovez4
jal _getLED
beq $v0,3,lose
beq $v0,2,makemovez4
addi $a1,$a1,-1
li $a2,0
jal _setLED
li $a2,1
addi $a1,$a1,1
jal _setLED
la $t0, Zpos
sb $a1,8($t0)

move $s2,$a0
#Moves Current time to old time
move $s4,$s3

move $a0,$s2
la $t2,Zdir
li $t1,4
sb $t1,3($t2)
jal poll




checky:
beq $a1,63,win
jal poll
lose:
li $v0,4
la $a0,loser
syscall

end:

