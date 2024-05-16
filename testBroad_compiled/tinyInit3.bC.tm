* bC compiler version bC-Su23
* File compiled:  tinyInit3.bC
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
* TOFF set: -6
 40:    LDC  3,222(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable y
 42:    LDC  3,333(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable z
 44:    LDC  3,1(6)	Load Boolean constant 
 45:     ST  3,-4(1)	Store variable b
 46:    LDC  3,90(6)	Load char constant 
 47:     ST  3,-5(1)	Store variable c
* Compound Body
* EXPRESSION
* CALL output
 48:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 49:     LD  3,0(0)	Load variable x
 50:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 51:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 55:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 56:     LD  3,-2(1)	Load variable y
 57:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 58:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 62:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 63:     LD  3,-3(1)	Load variable z
 64:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 65:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outputb
 69:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 70:     LD  3,-4(1)	Load variable b
 71:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 72:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-58(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputc
 76:     ST  1,-6(1)	Store fp in ghost frame for outputc
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 77:     LD  3,-5(1)	Load variable c
 78:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputc
 79:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-54(7)	CALL outputc
 82:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -6
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 83:    LDC  2,0(6)	Set return value to 0 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,86(7)	Jump to init [backpatch] 
* INIT
 87:    LDA  1,-1(0)	set first frame at end of globals 
 88:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 89:    LDC  3,111(6)	Load integer constant 
 90:     ST  3,0(0)	Store variable x
* END INIT GLOBALS AND STATICS
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-54(7)	Jump to main 
 93:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
