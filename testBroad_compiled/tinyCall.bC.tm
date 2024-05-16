* bC compiler version bC-Su23
* File compiled:  tinyCall.bC
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
* FUNCTION cheyenne
* TOFF set: -5
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 41:     LD  3,-2(1)	Load variable a
 42:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 43:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	CALL output
 46:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outputb
 47:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 48:     LD  3,-3(1)	Load variable b
 49:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 50:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-36(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputc
 54:     ST  1,-5(1)	Store fp in ghost frame for outputc
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 55:     LD  3,-4(1)	Load variable c
 56:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputc
 57:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-32(7)	CALL outputc
 60:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -5
* EXPRESSION
* CALL outnl
 61:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
 62:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-31(7)	CALL outnl
 65:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    JMP  7,0(3)	Return 
* END FUNCTION cheyenne
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sioux
* TOFF set: -5
 70:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
 71:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 72:     LD  3,-2(1)	Load address of base of array a
 73:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 74:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 75:     LD  4,-7(1)	Pop left into ac1 
 76:    SUB  3,4,3	compute location from index 
 77:     LD  3,0(3)	Load array element 
 78:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 79:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outputb
 83:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 84:     LD  3,-3(1)	Load address of base of array b
 85:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 86:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -7
 87:     LD  4,-7(1)	Pop left into ac1 
 88:    SUB  3,4,3	compute location from index 
 89:     LD  3,0(3)	Load array element 
 90:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 91:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-77(7)	CALL outputb
 94:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputc
 95:     ST  1,-5(1)	Store fp in ghost frame for outputc
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 96:     LD  3,-4(1)	Load address of base of array c
 97:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 98:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -7
 99:     LD  4,-7(1)	Pop left into ac1 
100:    SUB  3,4,3	compute location from index 
101:     LD  3,0(3)	Load array element 
102:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputc
103:    LDA  1,-5(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-78(7)	CALL outputc
106:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -5
* EXPRESSION
* CALL outnl
107:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
108:    LDA  1,-5(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-77(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
112:    LDC  2,0(6)	Set return value to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust fp 
115:    JMP  7,0(3)	Return 
* END FUNCTION sioux
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION comanche
* TOFF set: -3
116:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -15
117:    LDC  3,5(6)	load size of array b
118:     ST  3,-3(1)	save size of array b
119:    LDC  3,5(6)	load size of array c
120:     ST  3,-9(1)	save size of array c
* Compound Body
* EXPRESSION
121:    LDC  3,2(6)	Load integer constant 
122:     ST  3,-15(1)	Push index 
* TOFF dec: -16
123:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -15
124:     LD  4,-15(1)	Pop index 
125:    LDA  5,-4(1)	Load address of base of array b
126:    SUB  5,5,4	Compute offset of value 
127:     ST  3,0(5)	Store variable b
* EXPRESSION
128:    LDC  3,3(6)	Load integer constant 
129:     ST  3,-15(1)	Push index 
* TOFF dec: -16
130:    LDC  3,122(6)	Load char constant 
* TOFF inc: -15
131:     LD  4,-15(1)	Pop index 
132:    LDA  5,-10(1)	Load address of base of array c
133:    SUB  5,5,4	Compute offset of value 
134:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL sioux
135:     ST  1,-15(1)	Store fp in ghost frame for sioux
* TOFF dec: -16
* TOFF dec: -17
* Param 1
136:     LD  3,-2(1)	Load address of base of array z
137:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param 2
138:    LDA  3,-4(1)	Load address of base of array b
139:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 3
140:    LDA  3,-10(1)	Load address of base of array c
141:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end sioux
142:    LDA  1,-15(1)	Ghost frame becomes new active frame 
143:    LDA  3,1(7)	Return address in ac 
144:    JMP  7,-75(7)	CALL sioux
145:    LDA  3,0(2)	Save the result in ac 
* Call end sioux
* TOFF set: -15
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
146:    LDC  2,0(6)	Set return value to 0 
147:     LD  3,-1(1)	Load return address 
148:     LD  1,0(1)	Adjust fp 
149:    JMP  7,0(3)	Return 
* END FUNCTION comanche
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
150:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -23
151:    LDC  3,5(6)	load size of array a
152:     ST  3,-2(1)	save size of array a
153:    LDC  3,6(6)	load size of array b
154:     ST  3,-8(1)	save size of array b
155:    LDC  3,7(6)	load size of array c
156:     ST  3,-15(1)	save size of array c
* Compound Body
* EXPRESSION
157:    LDC  3,1(6)	Load integer constant 
158:     ST  3,-23(1)	Push index 
* TOFF dec: -24
159:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -23
160:     LD  4,-23(1)	Pop index 
161:    LDA  5,-3(1)	Load address of base of array a
162:    SUB  5,5,4	Compute offset of value 
163:     ST  3,0(5)	Store variable a
* EXPRESSION
164:    LDC  3,2(6)	Load integer constant 
165:     ST  3,-23(1)	Push index 
* TOFF dec: -24
166:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -23
167:     LD  4,-23(1)	Pop index 
168:    LDA  5,-9(1)	Load address of base of array b
169:    SUB  5,5,4	Compute offset of value 
170:     ST  3,0(5)	Store variable b
* EXPRESSION
171:    LDC  3,3(6)	Load integer constant 
172:     ST  3,-23(1)	Push index 
* TOFF dec: -24
173:    LDC  3,122(6)	Load char constant 
* TOFF inc: -23
174:     LD  4,-23(1)	Pop index 
175:    LDA  5,-16(1)	Load address of base of array c
176:    SUB  5,5,4	Compute offset of value 
177:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL cheyenne
178:     ST  1,-23(1)	Store fp in ghost frame for cheyenne
* TOFF dec: -24
* TOFF dec: -25
* Param 1
179:    LDC  3,666(6)	Load integer constant 
180:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param 2
181:    LDC  3,1(6)	Load Boolean constant 
182:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 3
183:    LDC  3,99(6)	Load char constant 
184:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end cheyenne
185:    LDA  1,-23(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-149(7)	CALL cheyenne
188:    LDA  3,0(2)	Save the result in ac 
* Call end cheyenne
* TOFF set: -23
* EXPRESSION
* CALL cheyenne
189:     ST  1,-23(1)	Store fp in ghost frame for cheyenne
* TOFF dec: -24
* TOFF dec: -25
* Param 1
190:    LDC  3,777(6)	Load integer constant 
191:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param 2
192:    LDC  3,0(6)	Load Boolean constant 
193:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 3
194:    LDC  3,100(6)	Load char constant 
195:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end cheyenne
196:    LDA  1,-23(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-160(7)	CALL cheyenne
199:    LDA  3,0(2)	Save the result in ac 
* Call end cheyenne
* TOFF set: -23
* EXPRESSION
* CALL sioux
200:     ST  1,-23(1)	Store fp in ghost frame for sioux
* TOFF dec: -24
* TOFF dec: -25
* Param 1
201:    LDA  3,-3(1)	Load address of base of array a
202:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param 2
203:    LDA  3,-9(1)	Load address of base of array b
204:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 3
205:    LDA  3,-16(1)	Load address of base of array c
206:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end sioux
207:    LDA  1,-23(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-140(7)	CALL sioux
210:    LDA  3,0(2)	Save the result in ac 
* Call end sioux
* TOFF set: -23
* EXPRESSION
* CALL comanche
211:     ST  1,-23(1)	Store fp in ghost frame for comanche
* TOFF dec: -24
* TOFF dec: -25
* Param 1
212:    LDA  3,-3(1)	Load address of base of array a
213:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param end comanche
214:    LDA  1,-23(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-101(7)	CALL comanche
217:    LDA  3,0(2)	Save the result in ac 
* Call end comanche
* TOFF set: -23
* EXPRESSION
218:    LDC  3,1(6)	Load integer constant 
219:     ST  3,-23(1)	Push index 
* TOFF dec: -24
220:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -23
221:     LD  4,-23(1)	Pop index 
222:    LDA  5,-1(0)	Load address of base of array ga
223:    SUB  5,5,4	Compute offset of value 
224:     ST  3,0(5)	Store variable ga
* EXPRESSION
225:    LDC  3,2(6)	Load integer constant 
226:     ST  3,-23(1)	Push index 
* TOFF dec: -24
227:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -23
228:     LD  4,-23(1)	Pop index 
229:    LDA  5,-7(0)	Load address of base of array gb
230:    SUB  5,5,4	Compute offset of value 
231:     ST  3,0(5)	Store variable gb
* EXPRESSION
232:    LDC  3,3(6)	Load integer constant 
233:     ST  3,-23(1)	Push index 
* TOFF dec: -24
234:    LDC  3,103(6)	Load char constant 
* TOFF inc: -23
235:     LD  4,-23(1)	Pop index 
236:    LDA  5,-14(0)	Load address of base of array gc
237:    SUB  5,5,4	Compute offset of value 
238:     ST  3,0(5)	Store variable gc
* EXPRESSION
* CALL sioux
239:     ST  1,-23(1)	Store fp in ghost frame for sioux
* TOFF dec: -24
* TOFF dec: -25
* Param 1
240:    LDA  3,-1(0)	Load address of base of array ga
241:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param 2
242:    LDA  3,-7(0)	Load address of base of array gb
243:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 3
244:    LDA  3,-14(0)	Load address of base of array gc
245:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end sioux
246:    LDA  1,-23(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-179(7)	CALL sioux
249:    LDA  3,0(2)	Save the result in ac 
* Call end sioux
* TOFF set: -23
* EXPRESSION
* CALL comanche
250:     ST  1,-23(1)	Store fp in ghost frame for comanche
* TOFF dec: -24
* TOFF dec: -25
* Param 1
251:    LDA  3,-1(0)	Load address of base of array ga
252:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param end comanche
253:    LDA  1,-23(1)	Ghost frame becomes new active frame 
254:    LDA  3,1(7)	Return address in ac 
255:    JMP  7,-140(7)	CALL comanche
256:    LDA  3,0(2)	Save the result in ac 
* Call end comanche
* TOFF set: -23
* COMPOUND
* TOFF set: -44
257:    LDC  3,5(6)	load size of array ga
258:     ST  3,-23(1)	save size of array ga
259:    LDC  3,6(6)	load size of array gb
260:     ST  3,-29(1)	save size of array gb
261:    LDC  3,7(6)	load size of array gc
262:     ST  3,-36(1)	save size of array gc
* Compound Body
* EXPRESSION
263:    LDC  3,1(6)	Load integer constant 
264:     ST  3,-44(1)	Push index 
* TOFF dec: -45
265:    LDC  3,999(6)	Load integer constant 
* TOFF inc: -44
266:     LD  4,-44(1)	Pop index 
267:    LDA  5,-24(1)	Load address of base of array ga
268:    SUB  5,5,4	Compute offset of value 
269:     ST  3,0(5)	Store variable ga
* EXPRESSION
270:    LDC  3,2(6)	Load integer constant 
271:     ST  3,-44(1)	Push index 
* TOFF dec: -45
272:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -44
273:     LD  4,-44(1)	Pop index 
274:    LDA  5,-30(1)	Load address of base of array gb
275:    SUB  5,5,4	Compute offset of value 
276:     ST  3,0(5)	Store variable gb
* EXPRESSION
277:    LDC  3,3(6)	Load integer constant 
278:     ST  3,-44(1)	Push index 
* TOFF dec: -45
279:    LDC  3,115(6)	Load char constant 
* TOFF inc: -44
280:     LD  4,-44(1)	Pop index 
281:    LDA  5,-37(1)	Load address of base of array gc
282:    SUB  5,5,4	Compute offset of value 
283:     ST  3,0(5)	Store variable gc
* EXPRESSION
* CALL sioux
284:     ST  1,-44(1)	Store fp in ghost frame for sioux
* TOFF dec: -45
* TOFF dec: -46
* Param 1
285:    LDA  3,-24(1)	Load address of base of array ga
286:     ST  3,-46(1)	Push parameter 
* TOFF dec: -47
* Param 2
287:    LDA  3,-30(1)	Load address of base of array gb
288:     ST  3,-47(1)	Push parameter 
* TOFF dec: -48
* Param 3
289:    LDA  3,-37(1)	Load address of base of array gc
290:     ST  3,-48(1)	Push parameter 
* TOFF dec: -49
* Param end sioux
291:    LDA  1,-44(1)	Ghost frame becomes new active frame 
292:    LDA  3,1(7)	Return address in ac 
293:    JMP  7,-224(7)	CALL sioux
294:    LDA  3,0(2)	Save the result in ac 
* Call end sioux
* TOFF set: -44
* EXPRESSION
* CALL comanche
295:     ST  1,-44(1)	Store fp in ghost frame for comanche
* TOFF dec: -45
* TOFF dec: -46
* Param 1
296:    LDA  3,-24(1)	Load address of base of array ga
297:     ST  3,-46(1)	Push parameter 
* TOFF dec: -47
* Param end comanche
298:    LDA  1,-44(1)	Ghost frame becomes new active frame 
299:    LDA  3,1(7)	Return address in ac 
300:    JMP  7,-185(7)	CALL comanche
301:    LDA  3,0(2)	Save the result in ac 
* Call end comanche
* TOFF set: -44
* TOFF set: -23
* END COMPOUND
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
302:    LDC  2,0(6)	Set return value to 0 
303:     LD  3,-1(1)	Load return address 
304:     LD  1,0(1)	Adjust fp 
305:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,305(7)	Jump to init [backpatch] 
* INIT
306:    LDA  1,-21(0)	set first frame at end of globals 
307:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
308:    LDC  3,5(6)	load size of array ga
309:     ST  3,0(0)	save size of array ga
310:    LDC  3,6(6)	load size of array gb
311:     ST  3,-6(0)	save size of array gb
312:    LDC  3,7(6)	load size of array gc
313:     ST  3,-13(0)	save size of array gc
* END INIT GLOBALS AND STATICS
314:    LDA  3,1(7)	Return address in ac 
315:    JMP  7,-166(7)	Jump to main 
316:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
