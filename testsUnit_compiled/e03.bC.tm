* bC compiler version bC-Su23
* File compiled:  e03.bC
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
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* WHILE
 42:     LD  3,-2(1)	Load variable x
 43:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 44:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
 45:     LD  4,-3(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 49:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* BREAK
 56:    JMP  7,-9(7)	break 
* EXPRESSION
 57:     LD  3,-2(1)	Load variable x
 58:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 59:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 60:     LD  4,-3(1)	Pop left into ac1 
 61:    ADD  3,4,3	Op + 
 62:     ST  3,-2(1)	Store variable x
* TOFF set: -3
* END COMPOUND
 63:    JMP  7,-22(7)	go to beginning of loop 
 48:    JMP  7,15(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
 64:    LDC  3,30(6)	Load integer constant 
 65:     ST  3,-2(1)	Store variable x
* WHILE
 66:     LD  3,-2(1)	Load variable x
 67:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 68:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
 69:     LD  4,-3(1)	Pop left into ac1 
 70:    TLT  3,4,3	Op < 
 71:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 73:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 74:     LD  3,-2(1)	Load variable x
 75:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 76:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* BREAK
 80:    JMP  7,-9(7)	break 
* EXPRESSION
 81:     LD  3,-2(1)	Load variable x
 82:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 83:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 84:     LD  4,-3(1)	Pop left into ac1 
 85:    ADD  3,4,3	Op + 
 86:     ST  3,-2(1)	Store variable x
* TOFF set: -3
* END COMPOUND
 87:    JMP  7,-22(7)	go to beginning of loop 
 72:    JMP  7,15(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,91(7)	Jump to init [backpatch] 
* INIT
 92:    LDA  1,0(0)	set first frame at end of globals 
 93:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-57(7)	Jump to main 
 96:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
