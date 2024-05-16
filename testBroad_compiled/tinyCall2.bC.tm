* bC compiler version bC-Su23
* File compiled:  tinyCall2.bC
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
* FUNCTION three
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 41:     LD  3,-2(1)	Load address of base of array z
 42:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 43:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
 44:     LD  4,-5(1)	Pop left into ac1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
 52:    LDC  3,7(6)	Load integer constant 
 53:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 54:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -3
 55:     LD  4,-3(1)	Pop index 
 56:     LD  5,-2(1)	Load address of base of array z
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL outnl
 59:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 60:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    JMP  7,0(3)	Return 
* END FUNCTION three
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION two
* TOFF set: -3
 68:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 69:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 70:     LD  3,-2(1)	Load address of base of array y
 71:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 72:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
 73:     LD  4,-5(1)	Pop left into ac1 
 74:    SUB  3,4,3	compute location from index 
 75:     LD  3,0(3)	Load array element 
 76:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 77:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL three
 81:     ST  1,-3(1)	Store fp in ghost frame for three
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 82:     LD  3,-2(1)	Load address of base of array y
 83:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end three
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-48(7)	CALL three
 87:    LDA  3,0(2)	Save the result in ac 
* Call end three
* TOFF set: -3
* EXPRESSION
* CALL output
 88:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 89:     LD  3,-2(1)	Load address of base of array y
 90:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 91:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
 92:     LD  4,-5(1)	Pop left into ac1 
 93:    SUB  3,4,3	compute location from index 
 94:     LD  3,0(3)	Load array element 
 95:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 96:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-93(7)	CALL output
 99:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
100:    LDC  2,0(6)	Set return value to 0 
101:     LD  3,-1(1)	Load return address 
102:     LD  1,0(1)	Adjust fp 
103:    JMP  7,0(3)	Return 
* END FUNCTION two
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION one
* TOFF set: -3
104:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
105:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
106:     LD  3,-2(1)	Load address of base of array x
107:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
108:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
109:     LD  4,-5(1)	Pop left into ac1 
110:    SUB  3,4,3	compute location from index 
111:     LD  3,0(3)	Load array element 
112:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
113:    LDA  1,-3(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL two
117:     ST  1,-3(1)	Store fp in ghost frame for two
* TOFF dec: -4
* TOFF dec: -5
* Param 1
118:     LD  3,-2(1)	Load address of base of array x
119:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end two
120:    LDA  1,-3(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-55(7)	CALL two
123:    LDA  3,0(2)	Save the result in ac 
* Call end two
* TOFF set: -3
* EXPRESSION
* CALL output
124:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
125:     LD  3,-2(1)	Load address of base of array x
126:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
127:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
128:     LD  4,-5(1)	Pop left into ac1 
129:    SUB  3,4,3	compute location from index 
130:     LD  3,0(3)	Load array element 
131:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
132:    LDA  1,-3(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
136:    LDC  2,0(6)	Set return value to 0 
137:     LD  3,-1(1)	Load return address 
138:     LD  1,0(1)	Adjust fp 
139:    JMP  7,0(3)	Return 
* END FUNCTION one
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
140:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -13
141:    LDC  3,10(6)	load size of array w
142:     ST  3,-2(1)	save size of array w
* Compound Body
* EXPRESSION
143:    LDC  3,7(6)	Load integer constant 
144:     ST  3,-13(1)	Push index 
* TOFF dec: -14
145:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -13
146:     LD  4,-13(1)	Pop index 
147:    LDA  5,-3(1)	Load address of base of array w
148:    SUB  5,5,4	Compute offset of value 
149:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL one
150:     ST  1,-13(1)	Store fp in ghost frame for one
* TOFF dec: -14
* TOFF dec: -15
* Param 1
151:    LDA  3,-3(1)	Load address of base of array w
152:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end one
153:    LDA  1,-13(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-52(7)	CALL one
156:    LDA  3,0(2)	Save the result in ac 
* Call end one
* TOFF set: -13
* EXPRESSION
* CALL output
157:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
158:    LDA  3,-3(1)	Load address of base of array w
159:     ST  3,-15(1)	Push left side 
* TOFF dec: -16
160:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -15
161:     LD  4,-15(1)	Pop left into ac1 
162:    SUB  3,4,3	compute location from index 
163:     LD  3,0(3)	Load array element 
164:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
165:    LDA  1,-13(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL outnl
169:     ST  1,-13(1)	Store fp in ghost frame for outnl
* TOFF dec: -14
* TOFF dec: -15
* Param end outnl
170:    LDA  1,-13(1)	Ghost frame becomes new active frame 
171:    LDA  3,1(7)	Return address in ac 
172:    JMP  7,-139(7)	CALL outnl
173:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -13
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
174:    LDC  2,0(6)	Set return value to 0 
175:     LD  3,-1(1)	Load return address 
176:     LD  1,0(1)	Adjust fp 
177:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,177(7)	Jump to init [backpatch] 
* INIT
178:    LDA  1,0(0)	set first frame at end of globals 
179:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-42(7)	Jump to main 
182:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
