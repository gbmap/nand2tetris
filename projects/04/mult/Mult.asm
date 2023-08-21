// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


// initialize counter


@i // A = i, M = RAM[i]
M=0 // RAM[i] = 0

// initialize R2 to 0
@R2 // A = 2, M = RAM[2]
M=0 // RAM[2] = 0

(LOOP)
    //
    // loop end condition, if (i == r1, or i-r1 == 0), jmp to END
    //

    // send R1 to memory register M (and A) 
    @R1 // A = 1, M = RAM[1]

    // send R1 value to M, then to data register 
    D=M // D = RAM[1]

    // subtract
    @i // A = i, M = RAM[i]
    D=D-M // copy of value at RAM[1] = RAM[1] - RAM[i]
    @END
    D;JEQ

    // add R0 to R2
    @R0 // A = 0, M = RAM[0]
    D=M // D = RAM[0]

    @R2 // A = 2, M = RAM[2]
    M=M+D // M (RAM[2]) = D (RAM[0]) + RAM[2]

    //
    // increment i 
    //
    @i
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
