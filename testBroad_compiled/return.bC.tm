* bC compiler version bC-Su23
* File compiled:  return.bC
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
* FUNCTION null
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
 40:    LDC  3,107(6)	Load integer constant 
 41:    LDA  2,0(3)	Copy result to return register 
 42:     LD  3,-1(1)	Load return address 
 43:     LD  1,0(1)	Adjust fp 
 44:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6)	Set return value to 0 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* END FUNCTION null
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
* TOFF set: -2
 49:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
* CALL null
 50:     ST  1,-2(1)	Store fp in ghost frame for null
* TOFF dec: -3
* TOFF dec: -4
* Param end null
 51:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-15(7)	CALL null
 54:    LDA  3,0(2)	Save the result in ac 
* Call end null
* TOFF set: -2
 55:    LDA  2,0(3)	Copy result to return register 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 59:    LDC  2,0(6)	Set return value to 0 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 63:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 64:    LDC  3,899(6)	Load integer constant 
* EXPRESSION
* CALL cat
 65:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param end cat
 66:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-20(7)	CALL cat
 69:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
 70:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 71:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 72:     LD  3,-2(1)	Load variable x
 73:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 74:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6)	Set return value to 0 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust fp 
 81:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,81(7)	Jump to init [backpatch] 
* INIT
 82:    LDA  1,0(0)	set first frame at end of globals 
 83:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-23(7)	Jump to main 
 86:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
