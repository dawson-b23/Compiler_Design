SEMANTIC WARNING(13): Variable 'b' may be uninitialized when used here.
SEMANTIC WARNING(14): Variable 'c' may be uninitialized when used here.
* bC compiler version bC-Su23
* File compiled:  tinyInit2.bC
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
* TOFF set: -61
 40:    LDC  3,22(6)	load size of array b
 41:     ST  3,-2(1)	save size of array b
 42:    LDC  3,777(6)	Load integer constant 
 43:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
 44:    LDC  3,666(6)	Load integer constant 
 45:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
 46:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -62
 47:     LD  4,-62(1)	Pop left into ac1 
 48:    MUL  3,4,3	Op * 
* TOFF inc: -61
 49:     LD  4,-61(1)	Pop left into ac1 
 50:    ADD  3,4,3	Op + 
 51:     ST  3,-25(1)	Store variable y
 52:    LDC  3,33(6)	load size of array c
 53:     ST  3,-26(1)	save size of array c
 54:    LDC  3,888(6)	Load integer constant 
 55:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
 56:    LDC  3,777(6)	Load integer constant 
 57:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
 58:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -62
 59:     LD  4,-62(1)	Pop left into ac1 
 60:    MUL  3,4,3	Op * 
* TOFF inc: -61
 61:     LD  4,-61(1)	Pop left into ac1 
 62:    ADD  3,4,3	Op + 
 63:     ST  3,-60(1)	Store variable z
* Compound Body
* EXPRESSION
* CALL output
 64:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 65:    LDA  3,-1(0)	Load address of base of array a
 66:     LD  3,1(3)	Load array size 
 67:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 68:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 72:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 73:    LDA  3,-3(1)	Load address of base of array b
 74:     LD  3,1(3)	Load array size 
 75:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 76:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 80:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 81:    LDA  3,-27(1)	Load address of base of array c
 82:     LD  3,1(3)	Load array size 
 83:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 84:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL outnl
 88:     ST  1,-61(1)	Store fp in ghost frame for outnl
* TOFF dec: -62
* TOFF dec: -63
* Param end outnl
 89:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-58(7)	CALL outnl
 92:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -61
* EXPRESSION
* CALL output
 93:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 94:     LD  3,-12(0)	Load variable x
 95:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 96:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-93(7)	CALL output
 99:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
100:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
101:     LD  3,-25(1)	Load variable y
102:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
103:    LDA  1,-61(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
107:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
108:     LD  3,-60(1)	Load variable z
109:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
110:    LDA  1,-61(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL outnl
114:     ST  1,-61(1)	Store fp in ghost frame for outnl
* TOFF dec: -62
* TOFF dec: -63
* Param end outnl
115:    LDA  1,-61(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-84(7)	CALL outnl
118:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -61
* EXPRESSION
119:    LDC  3,999(6)	Load integer constant 
120:     ST  3,-60(1)	Store variable z
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
121:    LDC  2,0(6)	Set return value to 0 
122:     LD  3,-1(1)	Load return address 
123:     LD  1,0(1)	Adjust fp 
124:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,124(7)	Jump to init [backpatch] 
* INIT
125:    LDA  1,-13(0)	set first frame at end of globals 
126:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
127:    LDC  3,11(6)	load size of array a
128:     ST  3,0(0)	save size of array a
129:    LDC  3,666(6)	Load integer constant 
130:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
131:    LDC  3,777(6)	Load integer constant 
132:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
133:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -3
134:     LD  4,-3(1)	Pop left into ac1 
135:    MUL  3,4,3	Op * 
* TOFF inc: -2
136:     LD  4,-2(1)	Pop left into ac1 
137:    ADD  3,4,3	Op + 
138:     ST  3,-12(0)	Store variable x
* END INIT GLOBALS AND STATICS
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-102(7)	Jump to main 
141:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 2
Number of errors: 0
