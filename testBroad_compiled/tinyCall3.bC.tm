* bC compiler version bC-Su23
* File compiled:  tinyCall3.bC
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
* RETURN
 64:     LD  3,-2(1)	Load address of base of array z
 65:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 66:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
 67:     LD  4,-3(1)	Pop left into ac1 
 68:    SUB  3,4,3	compute location from index 
 69:     LD  3,0(3)	Load array element 
 70:    LDA  2,0(3)	Copy result to return register 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    JMP  7,0(3)	Return 
* END FUNCTION three
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION two
* TOFF set: -3
 78:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 79:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 80:     LD  3,-2(1)	Load address of base of array y
 81:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 82:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
 83:     LD  4,-5(1)	Pop left into ac1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
 86:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL three
 91:     ST  1,-3(1)	Store fp in ghost frame for three
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 92:     LD  3,-2(1)	Load address of base of array y
 93:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end three
 94:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-58(7)	CALL three
 97:    LDA  3,0(2)	Save the result in ac 
* Call end three
* TOFF set: -3
* EXPRESSION
* CALL output
 98:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 99:     LD  3,-2(1)	Load address of base of array y
100:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
101:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
102:     LD  4,-5(1)	Pop left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
106:    LDA  1,-3(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* RETURN
110:     LD  3,-2(1)	Load address of base of array y
111:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
112:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
113:     LD  4,-3(1)	Pop left into ac1 
114:    SUB  3,4,3	compute location from index 
115:     LD  3,0(3)	Load array element 
116:    LDA  2,0(3)	Copy result to return register 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    JMP  7,0(3)	Return 
* END FUNCTION two
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION one
* TOFF set: -3
124:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
125:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
126:     LD  3,-2(1)	Load address of base of array x
127:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
128:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
129:     LD  4,-5(1)	Pop left into ac1 
130:    SUB  3,4,3	compute location from index 
131:     LD  3,0(3)	Load array element 
132:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
133:    LDA  1,-3(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL two
137:     ST  1,-3(1)	Store fp in ghost frame for two
* TOFF dec: -4
* TOFF dec: -5
* Param 1
138:     LD  3,-2(1)	Load address of base of array x
139:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end two
140:    LDA  1,-3(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-65(7)	CALL two
143:    LDA  3,0(2)	Save the result in ac 
* Call end two
* TOFF set: -3
* EXPRESSION
* CALL output
144:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
145:     LD  3,-2(1)	Load address of base of array x
146:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
147:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
148:     LD  4,-5(1)	Pop left into ac1 
149:    SUB  3,4,3	compute location from index 
150:     LD  3,0(3)	Load array element 
151:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
152:    LDA  1,-3(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* RETURN
156:     LD  3,-2(1)	Load address of base of array x
157:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
158:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
159:     LD  4,-3(1)	Pop left into ac1 
160:    SUB  3,4,3	compute location from index 
161:     LD  3,0(3)	Load array element 
162:    LDA  2,0(3)	Copy result to return register 
163:     LD  3,-1(1)	Load return address 
164:     LD  1,0(1)	Adjust fp 
165:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
166:    LDC  2,0(6)	Set return value to 0 
167:     LD  3,-1(1)	Load return address 
168:     LD  1,0(1)	Adjust fp 
169:    JMP  7,0(3)	Return 
* END FUNCTION one
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
170:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -13
171:    LDC  3,10(6)	load size of array w
172:     ST  3,-2(1)	save size of array w
* Compound Body
* EXPRESSION
173:    LDC  3,7(6)	Load integer constant 
174:     ST  3,-13(1)	Push index 
* TOFF dec: -14
175:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -13
176:     LD  4,-13(1)	Pop index 
177:    LDA  5,-3(1)	Load address of base of array w
178:    SUB  5,5,4	Compute offset of value 
179:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL output
180:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
* CALL one
181:     ST  1,-15(1)	Store fp in ghost frame for one
* TOFF dec: -16
* TOFF dec: -17
* Param 1
182:    LDA  3,-3(1)	Load address of base of array w
183:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end one
184:    LDA  1,-15(1)	Ghost frame becomes new active frame 
185:    LDA  3,1(7)	Return address in ac 
186:    JMP  7,-63(7)	CALL one
187:    LDA  3,0(2)	Save the result in ac 
* Call end one
* TOFF set: -15
188:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
189:    LDA  1,-13(1)	Ghost frame becomes new active frame 
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL output
193:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
194:    LDA  3,-3(1)	Load address of base of array w
195:     ST  3,-15(1)	Push left side 
* TOFF dec: -16
196:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -15
197:     LD  4,-15(1)	Pop left into ac1 
198:    SUB  3,4,3	compute location from index 
199:     LD  3,0(3)	Load array element 
200:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
201:    LDA  1,-13(1)	Ghost frame becomes new active frame 
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-198(7)	CALL output
204:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL outnl
205:     ST  1,-13(1)	Store fp in ghost frame for outnl
* TOFF dec: -14
* TOFF dec: -15
* Param end outnl
206:    LDA  1,-13(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-175(7)	CALL outnl
209:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -13
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
210:    LDC  2,0(6)	Set return value to 0 
211:     LD  3,-1(1)	Load return address 
212:     LD  1,0(1)	Adjust fp 
213:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,213(7)	Jump to init [backpatch] 
* INIT
214:    LDA  1,0(0)	set first frame at end of globals 
215:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
216:    LDA  3,1(7)	Return address in ac 
217:    JMP  7,-48(7)	Jump to main 
218:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
