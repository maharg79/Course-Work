Graham Hoehing, gjh32@pitt.edu, Peoplesoft #:4108720 
CS447 Dr.Childers M/W 4:30-5:45 Rectation Pamela M: 10:00-10:50

Project 2 JrMips with Logisism.

What Works:
And, Nor, Add, Addi, Addui, and sub all work as expected.
sllv and srlv work as expected.
Put and halt work as expected.
Mul and div work as expected*.
bx,bz,bp and bn work as expected.
j, jr and jal work in MOST situations.

*: For Div and Mul the secondary output has no real usage, meaning the ALU will output the product or quoient. But  the remainder, though outputted is never used elsewhere.


How it works:
My circuit works by sending the data from a data file from the ROM into the field subscircuit which
divides the 16-bit input into subOp, immediate, RS, RT and OPcode. From there, the OPcode is decoded
by my many different decoder subcircuits which determine many different aspects of how to handle the input
the ALU decoder decides what operation if any to use in the ALU, the Branch decoder decides whether or not 
the code branches, the mem decoder decides if we need to store anything to RAM, the jump decoder decides if
a jump has occured. After Decoding, Values are sent where they need to be (ALU etc) and then stored in the register.A few multiplexers
decide whether the data going into the register will be from 'Value' or 'Write Data', this is governed by Imm, Addi and branching.
The circuit also checks if the immediate is being used if so acts accordingly. All of this happens each clock cycle
until the Halt control detects the Opcode corresponding to Halt, then the program stops. Also the counter on the PC register
increments each clock cycle or when a branch occurs.


Known Errors/Problems:
Mul and Div secondary output, labled ALUOut2 have no use.
There are sometimes issues when Jumping, where the circuit does not register the jump.
There may be issues with the register when using Addui though this is not 100% confirmed


