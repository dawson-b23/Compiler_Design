SEMANTIC WARNING(9): Variable 'c' may be uninitialized when used here.
SEMANTIC WARNING(12): Variable 'b' may be uninitialized when used here.
* bC compiler version bC-Su23
* File compiled:  tinyArray.bC
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
* TOFF set: -59
 40:    LDC  3,22(6)	load size of array b
 41:     ST  3,-2(1)	save size of array b
 42:    LDC  3,33(6)	load size of array c
 43:     ST  3,-25(1)	save size of array c
* Compound Body
* EXPRESSION
 44:    LDA  3,-26(1)	Load address of base of array c
 45:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
 46:    LDC  3,22(6)	Load integer constant 
* TOFF inc: -59
 47:     LD  4,-59(1)	Pop left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
* EXPRESSION
 50:    LDC  3,999(6)	Load integer constant 
* EXPRESSION
* CALL output
 51:     ST  1,-59(1)	Store fp in ghost frame for output
* TOFF dec: -60
* TOFF dec: -61
* Param 1
 52:    LDA  3,-1(0)	Load address of base of array a
 53:     LD  3,1(3)	Load array size 
 54:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end output
 55:    LDA  1,-59(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -59
* EXPRESSION
* CALL output
 59:     ST  1,-59(1)	Store fp in ghost frame for output
* TOFF dec: -60
* TOFF dec: -61
* Param 1
 60:    LDA  3,-3(1)	Load address of base of array b
 61:     LD  3,1(3)	Load array size 
 62:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end output
 63:    LDA  1,-59(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -59
* EXPRESSION
* CALL output
 67:     ST  1,-59(1)	Store fp in ghost frame for output
* TOFF dec: -60
* TOFF dec: -61
* Param 1
 68:    LDA  3,-26(1)	Load address of base of array c
 69:     LD  3,1(3)	Load array size 
 70:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end output
 71:    LDA  1,-59(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -59
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 75:    LDC  2,0(6)	Set return value to 0 
 76:     LD  3,-1(1)	Load return address 
 77:     LD  1,0(1)	Adjust fp 
 78:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,78(7)	Jump to init [backpatch] 
* INIT
 79:    LDA  1,-12(0)	set first frame at end of globals 
 80:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 81:    LDC  3,11(6)	load size of array a
 82:     ST  3,0(0)	save size of array a
* END INIT GLOBALS AND STATICS
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-46(7)	Jump to main 
 85:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 2
Number of errors: 0
