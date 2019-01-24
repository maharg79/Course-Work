.data
green: .byte 3
red: .byte 1
yellow: .byte 2
str: .asciiz "Please enter the x coordinate of the position:\n"
str2: .asciiz "Please enter the y coordinate of the position:\n"
str3: .asciiz "Please enter the size:\n"
str4: .asciiz "Please enter the color (g -green, y -yellow and r -red):\n"
.text

la $a0, str
li $v0, 4
syscall
li $v0, 5
syscall
add $s0, $s0, $v0
la $a0, str2
li $v0, 4
syscall
li $v0, 5
syscall
add $s1, $s1, $v0

la $a0, str3
li $v0, 4
syscall
li $v0, 5
syscall
add $s2, $s2, $v0

la $a0, str4
li $v0, 4
syscall
li $v0, 12
syscall
add $s3, $s3, $v0




move $a0, $s0 #x
move $a1, $s1 #y
move $a2, $s2 #size
move $a3, $s3 #color

jal _drawSquare

#jal   _drawVerticalLine
#move $a0, $s0 #x
#move $a1, $s1 #y
#move $a2, $s2 #size
#move $a3, $s3 #color
#jal _drawHoriLine








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
	#arguments: $a0 is x, $a1 is y, $a2 is color
# byte offset into display = y * 16 bytes + (x / 4)
sll $t0,$a1,4 # y * 16 bytes
srl $t1,$a0,2 # x / 4
add $t0,$t0,$t1 # byte offset into display
li $t2,0xffff0008 # base address of LED display
add $t0,$t2,$t0 # address of byte with the LED
# now, compute led position in the byte and the mask for it
andi $t1,$a0,0x3 # remainder is led position in byte
neg $t1,$t1 # negate position for subtraction
addi $t1,$t1,3 # bit positions in reverse order
sll $t1,$t1,1 # led is 2 bits
# compute two masks: one to clear field, one to set new color
li $t2,3
sllv $t2,$t2,$t1
not $t2,$t2 # bit mask for clearing current color
sllv $t1,$a2,$t1 # bit mask for setting color
# get current LED value, set the new field, store it back to LED
lbu $t3,0($t0) # read current LED value
and $t3,$t3,$t2 # clear the field for the color
or $t3,$t3,$t1 # set color field
sb $t3,0($t0) # update display
jr $ra
	
	# int _getLED(int x, int y)
	#   returns the value of the LED at position (x,y)
	#
	#  arguments: $a0 holds x, $a1 holds y
	#  trashes:   $t0-$t2
	#  returns:   $v0 holds the value of the LED (0, 1, 2 or 3)
	#
	
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
# Function: drawVerticalLine
#   $a0 - x position
#   $a1 - y position
#   $a2 - number of spaces to move vertically
#   $a3 - color
_drawVerticalLine:
	# setup
	addi $sp, $sp, -24
	sw   $s0, 0($sp)
	sw   $s1, 4($sp)
	sw   $s2, 8($sp)
	sw   $s3, 12($sp)
	sw   $s4, 16($sp)
	sw   $ra, 20($sp)
		
	# body
	move $s0, $a0	# x
	move $s1, $a1	# y
	move $s2, $a2	# count
	move $s3, $a3	# color
	li   $s4, 0
_dvlLoop: bge $s4, $s2, _dvlExit
	add  $a0, $s0, $zero    # x
	add  $a1, $s1, $s4      # y
	move $a2, $s3   	    # color
	jal _setLED
	addi $s4, $s4, 1        # loop counter
	j _dvlLoop

_dvlExit:
	lw   $s0 0($sp)
	lw   $s1, 4($sp)
	lw   $s2, 8($sp)
	lw   $s3, 12($sp)
	lw   $s4, 16($sp)
	lw   $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	
_drawHoriLine:
	# setup
	addi $sp, $sp, -24
	sw   $s0, 0($sp)
	sw   $s1, 4($sp)
	sw   $s2, 8($sp)
	sw   $s3, 12($sp)
	sw   $s4, 16($sp)
	sw   $ra, 20($sp)
		
	# body
	move $s0, $a0	# x
	move $s1, $a1	# y
	move $s2, $a2	# count
	move $s3, $a3	# color
	li   $s4, 0
_dhlLoop: bge $s4, $s2, _dhlExit
	add  $a0, $s0, $s4    # x
	add  $a1, $s1, $zero     # y
	move $a2, $s3   	    # color
	jal _setLED
	addi $s4, $s4, 1        # loop counter
	j _dhlLoop

_dhlExit:
	lw   $s0 0($sp)
	lw   $s1, 4($sp)
	lw   $s2, 8($sp)
	lw   $s3, 12($sp)
	lw   $s4, 16($sp)
	lw   $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	
_drawSquare:
	addi $sp, $sp, -24
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw   $s4, 16($sp)
	sw   $ra, 20($sp)
	jal   _drawVerticalLine
	
	move $a0, $s0 #x
	move $a1, $s1 #y
	move $a2, $s2 #size
	move $a3, $s3 #color
	
	add $a2,$a2,-1
	add $a0,$a0,$a2
	move $a2, $s2 #size
	#Red line appears I have no idea why or how I can't get rid of it. Doesn't happen on horizontals
	jal   _drawVerticalLine
	move $a0, $s0 #x
	move $a1, $s1 #y
	move $a2, $s2 #size
	move $a3, $s3 #color
	jal   _drawHoriLine
	move $a0, $s0 #x
	move $a1, $s1 #y
	move $a2, $s2 #size
	move $a3, $s3 #color
	add $a1,$a1,$a2
	jal   _drawHoriLine


	jr $ra
	
	
