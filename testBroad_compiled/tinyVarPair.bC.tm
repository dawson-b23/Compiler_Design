* bC compiler version bC-Su23
* File compiled:  tinyVarPair.bC
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
* FUNCTION fred
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
 44:    LDC  3,111(6)	Load integer constant 
 45:     ST  3,0(0)	Store variable gx
* EXPRESSION
 46:     LD  3,0(0)	Load variable gx
 47:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 48:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 49:     LD  3,0(0)	Load variable gx
 50:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
 51:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
 55:    LDC  3,9(6)	Load integer constant 
 56:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 57:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -28
 58:     LD  4,-28(1)	Pop index 
 59:    LDA  5,-2(0)	Load address of base of array gy
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable gy
* EXPRESSION
 62:    LDC  3,9(6)	Load integer constant 
 63:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 64:    LDA  3,-2(0)	Load address of base of array gy
 65:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
 66:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
 67:     LD  4,-29(1)	Pop left into ac1 
 68:    SUB  3,4,3	compute location from index 
 69:     LD  3,0(3)	Load array element 
* TOFF inc: -28
 70:     LD  4,-28(1)	Pop index 
 71:    LDA  5,-2(0)	Load address of base of array gy
 72:    SUB  5,5,4	Compute offset of value 
 73:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 74:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 75:    LDA  3,-2(0)	Load address of base of array gy
 76:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
 77:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
 78:     LD  4,-30(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
 82:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
 86:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
 87:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
 91:    LDC  3,333(6)	Load integer constant 
 92:     ST  3,-4(1)	Store variable x
* EXPRESSION
 93:     LD  3,-4(1)	Load variable x
 94:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL output
 95:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 96:     LD  3,-4(1)	Load variable x
 97:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
 98:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
102:    LDC  3,9(6)	Load integer constant 
103:     ST  3,-28(1)	Push index 
* TOFF dec: -29
104:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -28
105:     LD  4,-28(1)	Pop index 
106:    LDA  5,-6(1)	Load address of base of array y
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable y
* EXPRESSION
109:    LDC  3,9(6)	Load integer constant 
110:     ST  3,-28(1)	Push index 
* TOFF dec: -29
111:    LDA  3,-6(1)	Load address of base of array y
112:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
113:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
114:     LD  4,-29(1)	Pop left into ac1 
115:    SUB  3,4,3	compute location from index 
116:     LD  3,0(3)	Load array element 
* TOFF inc: -28
117:     LD  4,-28(1)	Pop index 
118:    LDA  5,-6(1)	Load address of base of array y
119:    SUB  5,5,4	Compute offset of value 
120:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
121:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
122:    LDA  3,-6(1)	Load address of base of array y
123:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
124:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
125:     LD  4,-30(1)	Pop left into ac1 
126:    SUB  3,4,3	compute location from index 
127:     LD  3,0(3)	Load array element 
128:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
129:    LDA  1,-28(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-126(7)	CALL output
132:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
133:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
134:    LDA  1,-28(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-103(7)	CALL outnl
137:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
138:    LDC  3,555(6)	Load integer constant 
139:     ST  3,-2(1)	Store variable px
* EXPRESSION
140:     LD  3,-2(1)	Load variable px
141:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL output
142:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
143:     LD  3,-2(1)	Load variable px
144:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
145:    LDA  1,-28(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-142(7)	CALL output
148:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
149:    LDC  3,9(6)	Load integer constant 
150:     ST  3,-28(1)	Push index 
* TOFF dec: -29
151:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -28
152:     LD  4,-28(1)	Pop index 
153:     LD  5,-3(1)	Load address of base of array py
154:    SUB  5,5,4	Compute offset of value 
155:     ST  3,0(5)	Store variable py
* EXPRESSION
156:    LDC  3,9(6)	Load integer constant 
157:     ST  3,-28(1)	Push index 
* TOFF dec: -29
158:     LD  3,-3(1)	Load address of base of array py
159:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
160:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
161:     LD  4,-29(1)	Pop left into ac1 
162:    SUB  3,4,3	compute location from index 
163:     LD  3,0(3)	Load array element 
* TOFF inc: -28
164:     LD  4,-28(1)	Pop index 
165:     LD  5,-3(1)	Load address of base of array py
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
168:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
169:     LD  3,-3(1)	Load address of base of array py
170:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
171:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
172:     LD  4,-30(1)	Pop left into ac1 
173:    SUB  3,4,3	compute location from index 
174:     LD  3,0(3)	Load array element 
175:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
176:    LDA  1,-28(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
180:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
181:    LDA  1,-28(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-150(7)	CALL outnl
184:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
185:    LDC  3,777(6)	Load integer constant 
186:     ST  3,-16(1)	Store variable sx
* EXPRESSION
187:     LD  3,-16(1)	Load variable sx
188:     ST  3,-16(1)	Store variable sx
* EXPRESSION
* CALL output
189:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
190:     LD  3,-16(1)	Load variable sx
191:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
192:    LDA  1,-28(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
196:    LDC  3,9(6)	Load integer constant 
197:     ST  3,-28(1)	Push index 
* TOFF dec: -29
198:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -28
199:     LD  4,-28(1)	Pop index 
200:    LDA  5,-18(1)	Load address of base of array sy
201:    SUB  5,5,4	Compute offset of value 
202:     ST  3,0(5)	Store variable sy
* EXPRESSION
203:    LDC  3,9(6)	Load integer constant 
204:     ST  3,-28(1)	Push index 
* TOFF dec: -29
205:    LDA  3,-18(1)	Load address of base of array sy
206:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
207:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
208:     LD  4,-29(1)	Pop left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
* TOFF inc: -28
211:     LD  4,-28(1)	Pop index 
212:    LDA  5,-18(1)	Load address of base of array sy
213:    SUB  5,5,4	Compute offset of value 
214:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
215:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
216:    LDA  3,-18(1)	Load address of base of array sy
217:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
218:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
219:     LD  4,-30(1)	Pop left into ac1 
220:    SUB  3,4,3	compute location from index 
221:     LD  3,0(3)	Load array element 
222:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
223:    LDA  1,-28(1)	Ghost frame becomes new active frame 
224:    LDA  3,1(7)	Return address in ac 
225:    JMP  7,-220(7)	CALL output
226:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
227:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
228:    LDA  1,-28(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-197(7)	CALL outnl
231:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
232:    LDC  2,0(6)	Set return value to 0 
233:     LD  3,-1(1)	Load return address 
234:     LD  1,0(1)	Adjust fp 
235:    JMP  7,0(3)	Return 
* END FUNCTION fred
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
236:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
237:    LDC  3,10(6)	load size of array ly
238:     ST  3,-3(1)	save size of array ly
* Compound Body
* EXPRESSION
239:    LDC  3,0(6)	Load integer constant 
240:     ST  3,-14(1)	Push index 
* TOFF dec: -15
241:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -14
242:     LD  4,-14(1)	Pop index 
243:    LDA  5,-4(1)	Load address of base of array ly
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable ly
246:     ST  3,-2(1)	Store variable lx
* EXPRESSION
* CALL fred
247:     ST  1,-14(1)	Store fp in ghost frame for fred
* TOFF dec: -15
* TOFF dec: -16
* Param 1
248:     LD  3,0(0)	Load variable gx
249:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
250:    LDA  3,-2(0)	Load address of base of array gy
251:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end fred
252:    LDA  1,-14(1)	Ghost frame becomes new active frame 
253:    LDA  3,1(7)	Return address in ac 
254:    JMP  7,-216(7)	CALL fred
255:    LDA  3,0(2)	Save the result in ac 
* Call end fred
* TOFF set: -14
* EXPRESSION
* CALL fred
256:     ST  1,-14(1)	Store fp in ghost frame for fred
* TOFF dec: -15
* TOFF dec: -16
* Param 1
257:     LD  3,-2(1)	Load variable lx
258:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
259:    LDA  3,-4(1)	Load address of base of array ly
260:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end fred
261:    LDA  1,-14(1)	Ghost frame becomes new active frame 
262:    LDA  3,1(7)	Return address in ac 
263:    JMP  7,-225(7)	CALL fred
264:    LDA  3,0(2)	Save the result in ac 
* Call end fred
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
265:    LDC  2,0(6)	Set return value to 0 
266:     LD  3,-1(1)	Load return address 
267:     LD  1,0(1)	Adjust fp 
268:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,268(7)	Jump to init [backpatch] 
* INIT
269:    LDA  1,-12(0)	set first frame at end of globals 
270:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
271:    LDC  3,10(6)	load size of array gy
272:     ST  3,-1(0)	save size of array gy
* END INIT GLOBALS AND STATICS
273:    LDA  3,1(7)	Return address in ac 
274:    JMP  7,-39(7)	Jump to main 
275:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
