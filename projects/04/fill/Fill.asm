// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// R0 = value to set (0/1)

@R0
M=0

@SCREEN
M=1

(LOOP)
    @KBD // A=KBD, M=RAM[KBD]
    D=M

    @R0
    M=-1
    @SETSCREEN
    D;JNE

    @R0
    M=0
    @SETSCREEN
    D;JMP

(SETSCREEN)
    @i // A = i, M=RAM[i]
    M=0

    //
    // set upper to number of bits in screen (8k) - 1 
    //
    @16 // D = 8191
    D=A
    @upper // A = upper  M=RAM[upper]
    M=D // RAM[upper] = 8191

    (SSCRNLOOP)
        // quit loop
        @upper // A = upper, M=RAM[upper]
        D=M
        @i // A = i, M=RAM[i]
        D=D-M
        @LOOP
        D;JEQ

        //
        // set pixel at i to value at R0
        //

        // calc pixel adress (screen+i)
        @SCREEN // A = SCREEN, M=RAM[SCREEN]
        D=A

        @i
        D=D+M // SCREEN + i

        @scrncrd // save screen coord (ram address) to RAM[scrncrd]
        M=D

        // get target value for screen bits
        @R0 
        D=M 

        @scrncrd // A=scrncrd, M=RAM[scrncrd]
        A=M // get ram address to write to and point A to it
        M=D // RAM[scrncrd] = R0

        // increment i
        @i
        M=M+1

        @SSCRNLOOP
        0;JMP



