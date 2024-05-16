* bC compiler version bC-Su23
* File compiled:  k08.bC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    JMP  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:     LD  3,-1(1)	Load return address 
 10:     LD  1,0(1)	Adjust fp 
 11:    JMP  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 12:     ST  3,-1(1)	Store return address 
 13:    INB  2,2,2	Grab bool input 
 14:     LD  3,-1(1)	Load return address 
 15:     LD  1,0(1)	Adjust fp 
 16:    JMP  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 17:     ST  3,-1(1)	Store return address 
 18:     LD  3,-2(1)	Load parameter 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return address 
 21:     LD  1,0(1)	Adjust fp 
 22:    JMP  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 23:     ST  3,-1(1)	Store return address 
 24:    INC  2,2,2	Grab char input 
 25:     LD  3,-1(1)	Load return address 
 26:     LD  1,0(1)	Adjust fp 
 27:    JMP  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 28:     ST  3,-1(1)	Store return address 
 29:     LD  3,-2(1)	Load parameter 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return address 
 32:     LD  1,0(1)	Adjust fp 
 33:    JMP  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 34:     ST  3,-1(1)	Store return address 
 35:  OUTNL  3,3,3	Output a newline 
 36:     LD  3,-1(1)	Load return address 
 37:     LD  1,0(1)	Adjust fp 
 38:    JMP  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,37(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable i
* EXPRESSION
 42:    LDC  3,0(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable sum
* TOFF set: -7
* FOR
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-4(1)	save starting value in index variable 
 46:    LDC  3,10(6)	Load integer constant 
 47:     ST  3,-5(1)	save stop value 
 48:    LDC  3,1(6)	default increment by 1 
 49:     ST  3,-6(1)	save step value 
 50:     LD  4,-4(1)	loop index 
 51:     LD  5,-5(1)	stop value 
 52:     LD  3,-6(1)	step value 
 53:    SLT  3,4,5	Op < 
 54:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
 56:     LD  3,-4(1)	Load variable i
 57:     LD  4,-3(1)	load lhs variable sum
 58:    ADD  3,4,3	op += 
 59:     ST  3,-3(1)	Store variable sum
* Bottom of loop increment and jump
 60:     LD  3,-4(1)	Load index 
 61:     LD  5,-6(1)	Load step 
 62:    ADD  3,3,5	increment 
 63:     ST  3,-4(1)	store back to index 
 64:    JMP  7,-15(7)	go to beginning of loop 
 55:    JMP  7,9(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL output
 65:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 66:     LD  3,-2(1)	Load variable i
 67:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 68:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 72:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 73:     LD  3,-3(1)	Load variable sum
 74:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 75:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 79:    LDC  2,0(6)	Set return value to 0 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust fp 
 82:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,82(7)	Jump to init [backpatch] 
* INIT
 83:    LDA  1,0(0)	set first frame at end of globals 
 84:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-48(7)	Jump to main 
 87:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
