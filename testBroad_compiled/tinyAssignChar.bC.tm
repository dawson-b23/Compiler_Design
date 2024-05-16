SEMANTIC WARNING(33): Variable 'zx' may be uninitialized when used here.
SEMANTIC WARNING(33): Variable 'zy' may be uninitialized when used here.
* bC compiler version bC-Su23
* File compiled:  tinyAssignChar.bC
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
* FUNCTION esperanza
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -28
 40:    LDC  3,10(6)	load size of array y
 41:     ST  3,-5(1)	save size of array y
 42:    LDC  3,10(6)	load size of array sy
 43:     ST  3,-17(1)	save size of array sy
* Compound Body
* EXPRESSION
 44:    LDC  3,97(6)	Load char constant 
 45:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL outputc
 46:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 47:     LD  3,0(0)	Load variable gx
 48:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
 49:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    JMP  7,-24(7)	CALL outputc
 52:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
 53:    LDC  3,9(6)	Load integer constant 
 54:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 55:    LDC  3,98(6)	Load char constant 
* TOFF inc: -28
 56:     LD  4,-28(1)	Pop index 
 57:    LDA  5,-2(0)	Load address of base of array gy
 58:    SUB  5,5,4	Compute offset of value 
 59:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL outputc
 60:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 61:    LDA  3,-2(0)	Load address of base of array gy
 62:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
 63:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
 64:     LD  4,-30(1)	Pop left into ac1 
 65:    SUB  3,4,3	compute location from index 
 66:     LD  3,0(3)	Load array element 
 67:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
 68:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-43(7)	CALL outputc
 71:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
 72:    LDC  3,99(6)	Load char constant 
 73:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL outputc
 74:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 75:     LD  3,-4(1)	Load variable x
 76:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
 77:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-52(7)	CALL outputc
 80:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
 81:    LDC  3,9(6)	Load integer constant 
 82:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 83:    LDC  3,100(6)	Load char constant 
* TOFF inc: -28
 84:     LD  4,-28(1)	Pop index 
 85:    LDA  5,-6(1)	Load address of base of array y
 86:    SUB  5,5,4	Compute offset of value 
 87:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL outputc
 88:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 89:    LDA  3,-6(1)	Load address of base of array y
 90:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
 91:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
 92:     LD  4,-30(1)	Pop left into ac1 
 93:    SUB  3,4,3	compute location from index 
 94:     LD  3,0(3)	Load array element 
 95:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
 96:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-71(7)	CALL outputc
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
* CALL outnl
100:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
101:    LDA  1,-28(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-70(7)	CALL outnl
104:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
105:    LDC  3,101(6)	Load char constant 
106:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL outputc
107:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
108:     LD  3,-2(1)	Load variable px
109:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
110:    LDA  1,-28(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-85(7)	CALL outputc
113:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
114:    LDC  3,9(6)	Load integer constant 
115:     ST  3,-28(1)	Push index 
* TOFF dec: -29
116:    LDC  3,102(6)	Load char constant 
* TOFF inc: -28
117:     LD  4,-28(1)	Pop index 
118:     LD  5,-3(1)	Load address of base of array py
119:    SUB  5,5,4	Compute offset of value 
120:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL outputc
121:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
122:     LD  3,-3(1)	Load address of base of array py
123:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
124:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
125:     LD  4,-30(1)	Pop left into ac1 
126:    SUB  3,4,3	compute location from index 
127:     LD  3,0(3)	Load array element 
128:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
129:    LDA  1,-28(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-104(7)	CALL outputc
132:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
133:    LDC  3,102(6)	Load char constant 
134:     ST  3,-16(1)	Store variable sx
* EXPRESSION
* CALL outputc
135:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
136:     LD  3,-16(1)	Load variable sx
137:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
138:    LDA  1,-28(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-113(7)	CALL outputc
141:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
142:    LDC  3,9(6)	Load integer constant 
143:     ST  3,-28(1)	Push index 
* TOFF dec: -29
144:    LDC  3,104(6)	Load char constant 
* TOFF inc: -28
145:     LD  4,-28(1)	Pop index 
146:    LDA  5,-18(1)	Load address of base of array sy
147:    SUB  5,5,4	Compute offset of value 
148:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL outputc
149:     ST  1,-28(1)	Store fp in ghost frame for outputc
* TOFF dec: -29
* TOFF dec: -30
* Param 1
150:    LDA  3,-18(1)	Load address of base of array sy
151:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
152:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
153:     LD  4,-30(1)	Pop left into ac1 
154:    SUB  3,4,3	compute location from index 
155:     LD  3,0(3)	Load array element 
156:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end outputc
157:    LDA  1,-28(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-132(7)	CALL outputc
160:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -28
* EXPRESSION
* CALL outnl
161:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
162:    LDA  1,-28(1)	Ghost frame becomes new active frame 
163:    LDA  3,1(7)	Return address in ac 
164:    JMP  7,-131(7)	CALL outnl
165:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
166:    LDC  2,0(6)	Set return value to 0 
167:     LD  3,-1(1)	Load return address 
168:     LD  1,0(1)	Adjust fp 
169:    JMP  7,0(3)	Return 
* END FUNCTION esperanza
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
170:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
171:    LDC  3,10(6)	load size of array zy
172:     ST  3,-3(1)	save size of array zy
* Compound Body
* EXPRESSION
* CALL esperanza
173:     ST  1,-14(1)	Store fp in ghost frame for esperanza
* TOFF dec: -15
* TOFF dec: -16
* Param 1
174:     LD  3,-2(1)	Load variable zx
175:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
176:    LDA  3,-4(1)	Load address of base of array zy
177:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end esperanza
178:    LDA  1,-14(1)	Ghost frame becomes new active frame 
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-142(7)	CALL esperanza
181:    LDA  3,0(2)	Save the result in ac 
* Call end esperanza
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
182:    LDC  2,0(6)	Set return value to 0 
183:     LD  3,-1(1)	Load return address 
184:     LD  1,0(1)	Adjust fp 
185:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,185(7)	Jump to init [backpatch] 
* INIT
186:    LDA  1,-12(0)	set first frame at end of globals 
187:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
188:    LDC  3,10(6)	load size of array gy
189:     ST  3,-1(0)	save size of array gy
* END INIT GLOBALS AND STATICS
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-22(7)	Jump to main 
192:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 2
Number of errors: 0
