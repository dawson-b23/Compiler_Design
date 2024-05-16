* bC compiler version bC-Su23
* File compiled:  tinyBreak2.bC
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
 41:     ST  3,-2(1)	Store variable i
* WHILE
 42:    LDC  3,1(6)	Load Boolean constant 
 43:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* WHILE
 45:    LDC  3,1(6)	Load Boolean constant 
 46:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 48:     LD  3,-2(1)	load lhs variable i
 49:    LDA  3,1(3)	increment value of i
 50:     ST  3,-2(1)	Store variable i
* EXPRESSION
* CALL output
 51:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 52:     LD  3,-2(1)	Load variable i
 53:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 54:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* IF
 58:     LD  3,-2(1)	Load variable i
 59:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 60:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
 61:     LD  4,-3(1)	Pop left into ac1 
 62:    TGT  3,4,3	Op > 
* THEN
* BREAK
 64:    JMP  7,-18(7)	break 
 63:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
 65:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 66:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-35(7)	CALL outnl
 69:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
 70:    JMP  7,-26(7)	go to beginning of loop 
 47:    JMP  7,23(7)	Jump past loop [backpatch] 
* END WHILE
* IF
 71:     LD  3,-2(1)	Load variable i
 72:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 73:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
 74:     LD  4,-3(1)	Pop left into ac1 
 75:    TGT  3,4,3	Op > 
* THEN
* BREAK
 77:    JMP  7,-34(7)	break 
 76:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
 78:    JMP  7,-37(7)	go to beginning of loop 
 44:    JMP  7,34(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
 79:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 80:     LD  3,-2(1)	Load variable i
 81:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 82:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 86:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 91:    LDC  2,0(6)	Set return value to 0 
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust fp 
 94:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,94(7)	Jump to init [backpatch] 
* INIT
 95:    LDA  1,0(0)	set first frame at end of globals 
 96:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-60(7)	Jump to main 
 99:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
