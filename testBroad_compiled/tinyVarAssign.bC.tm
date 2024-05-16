* bC compiler version bC-Su23
* File compiled:  tinyVarAssign.bC
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
 44:    LDC  3,444(6)	Load integer constant 
 45:     ST  3,0(0)	Store variable gx
* EXPRESSION
 46:    LDC  3,555(6)	Load integer constant 
 47:     ST  3,-4(1)	Store variable x
* EXPRESSION
 48:    LDC  3,666(6)	Load integer constant 
 49:     ST  3,-16(1)	Store variable sx
* EXPRESSION
 50:    LDC  3,9(6)	Load integer constant 
 51:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 52:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -28
 53:     LD  4,-28(1)	Pop index 
 54:    LDA  5,-2(0)	Load address of base of array gy
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 57:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 58:    LDA  3,-2(0)	Load address of base of array gy
 59:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
 60:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
 61:     LD  4,-30(1)	Pop left into ac1 
 62:    SUB  3,4,3	compute location from index 
 63:     LD  3,0(3)	Load array element 
 64:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
 65:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
 69:     LD  3,0(0)	Load variable gx
 70:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 71:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 72:     LD  3,0(0)	Load variable gx
 73:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
 74:    LDA  1,-28(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
 78:    LDC  3,8(6)	Load integer constant 
 79:     ST  3,-28(1)	Push index 
* TOFF dec: -29
 80:    LDA  3,-2(0)	Load address of base of array gy
 81:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
 82:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
 83:     LD  4,-29(1)	Pop left into ac1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
* TOFF inc: -28
 86:     LD  4,-28(1)	Pop index 
 87:    LDA  5,-2(0)	Load address of base of array gy
 88:    SUB  5,5,4	Compute offset of value 
 89:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
 90:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
 91:    LDA  3,-2(0)	Load address of base of array gy
 92:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
 93:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -30
 94:     LD  4,-30(1)	Pop left into ac1 
 95:    SUB  3,4,3	compute location from index 
 96:     LD  3,0(3)	Load array element 
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
* CALL outnl
102:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
103:    LDA  1,-28(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-72(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
107:    LDC  3,9(6)	Load integer constant 
108:     ST  3,-28(1)	Push index 
* TOFF dec: -29
109:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -28
110:     LD  4,-28(1)	Pop index 
111:    LDA  5,-6(1)	Load address of base of array y
112:    SUB  5,5,4	Compute offset of value 
113:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
114:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
115:    LDA  3,-6(1)	Load address of base of array y
116:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
117:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
118:     LD  4,-30(1)	Pop left into ac1 
119:    SUB  3,4,3	compute location from index 
120:     LD  3,0(3)	Load array element 
121:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
122:    LDA  1,-28(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
126:     LD  3,-4(1)	Load variable x
127:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL output
128:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
129:     LD  3,-4(1)	Load variable x
130:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
131:    LDA  1,-28(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
135:    LDC  3,7(6)	Load integer constant 
136:     ST  3,-28(1)	Push index 
* TOFF dec: -29
137:    LDA  3,-6(1)	Load address of base of array y
138:     LD  3,1(3)	Load array size 
* TOFF inc: -28
139:     LD  4,-28(1)	Pop index 
140:    LDA  5,-6(1)	Load address of base of array y
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
143:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
144:    LDA  3,-6(1)	Load address of base of array y
145:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
146:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -30
147:     LD  4,-30(1)	Pop left into ac1 
148:    SUB  3,4,3	compute location from index 
149:     LD  3,0(3)	Load array element 
150:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
151:    LDA  1,-28(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
155:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
156:    LDA  1,-28(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-125(7)	CALL outnl
159:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
160:     LD  3,-2(1)	Load variable px
161:     ST  3,-2(1)	Store variable px
* EXPRESSION
* CALL output
162:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
163:     LD  3,-2(1)	Load variable px
164:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
165:    LDA  1,-28(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
169:    LDC  3,101(6)	Load integer constant 
170:     ST  3,-2(1)	Store variable px
* EXPRESSION
171:    LDC  3,8(6)	Load integer constant 
172:     ST  3,-28(1)	Push index 
* TOFF dec: -29
173:     LD  3,-3(1)	Load address of base of array py
174:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
175:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -29
176:     LD  4,-29(1)	Pop left into ac1 
177:    SUB  3,4,3	compute location from index 
178:     LD  3,0(3)	Load array element 
* TOFF inc: -28
179:     LD  4,-28(1)	Pop index 
180:     LD  5,-3(1)	Load address of base of array py
181:    SUB  5,5,4	Compute offset of value 
182:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
183:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
184:     LD  3,-3(1)	Load address of base of array py
185:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
186:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -30
187:     LD  4,-30(1)	Pop left into ac1 
188:    SUB  3,4,3	compute location from index 
189:     LD  3,0(3)	Load array element 
190:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
191:    LDA  1,-28(1)	Ghost frame becomes new active frame 
192:    LDA  3,1(7)	Return address in ac 
193:    JMP  7,-188(7)	CALL output
194:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
195:    LDC  3,8(6)	Load integer constant 
196:     ST  3,-28(1)	Push index 
* TOFF dec: -29
197:    LDC  3,102(6)	Load integer constant 
* TOFF inc: -28
198:     LD  4,-28(1)	Pop index 
199:     LD  5,-3(1)	Load address of base of array py
200:    SUB  5,5,4	Compute offset of value 
201:     ST  3,0(5)	Store variable py
* EXPRESSION
202:    LDC  3,7(6)	Load integer constant 
203:     ST  3,-28(1)	Push index 
* TOFF dec: -29
204:     LD  3,-3(1)	Load address of base of array py
205:     LD  3,1(3)	Load array size 
* TOFF inc: -28
206:     LD  4,-28(1)	Pop index 
207:     LD  5,-3(1)	Load address of base of array py
208:    SUB  5,5,4	Compute offset of value 
209:     ST  3,0(5)	Store variable py
* EXPRESSION
* CALL output
210:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
211:     LD  3,-3(1)	Load address of base of array py
212:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
213:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -30
214:     LD  4,-30(1)	Pop left into ac1 
215:    SUB  3,4,3	compute location from index 
216:     LD  3,0(3)	Load array element 
217:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
218:    LDA  1,-28(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Return address in ac 
220:    JMP  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
222:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
223:    LDA  1,-28(1)	Ghost frame becomes new active frame 
224:    LDA  3,1(7)	Return address in ac 
225:    JMP  7,-192(7)	CALL outnl
226:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* EXPRESSION
227:    LDC  3,9(6)	Load integer constant 
228:     ST  3,-28(1)	Push index 
* TOFF dec: -29
229:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -28
230:     LD  4,-28(1)	Pop index 
231:    LDA  5,-18(1)	Load address of base of array sy
232:    SUB  5,5,4	Compute offset of value 
233:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
234:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
235:    LDA  3,-18(1)	Load address of base of array sy
236:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
237:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -30
238:     LD  4,-30(1)	Pop left into ac1 
239:    SUB  3,4,3	compute location from index 
240:     LD  3,0(3)	Load array element 
241:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
242:    LDA  1,-28(1)	Ghost frame becomes new active frame 
243:    LDA  3,1(7)	Return address in ac 
244:    JMP  7,-239(7)	CALL output
245:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
246:     LD  3,-16(1)	Load variable sx
247:     ST  3,-16(1)	Store variable sx
* EXPRESSION
* CALL output
248:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
249:     LD  3,-16(1)	Load variable sx
250:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
251:    LDA  1,-28(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-248(7)	CALL output
254:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
255:    LDC  3,7(6)	Load integer constant 
256:     ST  3,-28(1)	Push index 
* TOFF dec: -29
257:    LDA  3,-18(1)	Load address of base of array sy
258:     LD  3,1(3)	Load array size 
* TOFF inc: -28
259:     LD  4,-28(1)	Pop index 
260:    LDA  5,-18(1)	Load address of base of array sy
261:    SUB  5,5,4	Compute offset of value 
262:     ST  3,0(5)	Store variable sy
* EXPRESSION
* CALL output
263:     ST  1,-28(1)	Store fp in ghost frame for output
* TOFF dec: -29
* TOFF dec: -30
* Param 1
264:    LDA  3,-18(1)	Load address of base of array sy
265:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
266:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -30
267:     LD  4,-30(1)	Pop left into ac1 
268:    SUB  3,4,3	compute location from index 
269:     LD  3,0(3)	Load array element 
270:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end output
271:    LDA  1,-28(1)	Ghost frame becomes new active frame 
272:    LDA  3,1(7)	Return address in ac 
273:    JMP  7,-268(7)	CALL output
274:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -28
* EXPRESSION
* CALL outnl
275:     ST  1,-28(1)	Store fp in ghost frame for outnl
* TOFF dec: -29
* TOFF dec: -30
* Param end outnl
276:    LDA  1,-28(1)	Ghost frame becomes new active frame 
277:    LDA  3,1(7)	Return address in ac 
278:    JMP  7,-245(7)	CALL outnl
279:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -28
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
280:    LDC  2,0(6)	Set return value to 0 
281:     LD  3,-1(1)	Load return address 
282:     LD  1,0(1)	Adjust fp 
283:    JMP  7,0(3)	Return 
* END FUNCTION esperanza
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
284:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
285:    LDC  3,10(6)	load size of array zy
286:     ST  3,-3(1)	save size of array zy
* Compound Body
* EXPRESSION
287:    LDC  3,999(6)	Load integer constant 
288:     ST  3,-2(1)	Store variable zx
* EXPRESSION
289:    LDC  3,9(6)	Load integer constant 
290:     ST  3,-14(1)	Push index 
* TOFF dec: -15
291:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -14
292:     LD  4,-14(1)	Pop index 
293:    LDA  5,-4(1)	Load address of base of array zy
294:    SUB  5,5,4	Compute offset of value 
295:     ST  3,0(5)	Store variable zy
* EXPRESSION
* CALL output
296:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
297:     LD  3,-2(1)	Load variable zx
298:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
299:    LDA  1,-14(1)	Ghost frame becomes new active frame 
300:    LDA  3,1(7)	Return address in ac 
301:    JMP  7,-296(7)	CALL output
302:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
303:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
304:    LDA  3,-4(1)	Load address of base of array zy
305:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
306:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -16
307:     LD  4,-16(1)	Pop left into ac1 
308:    SUB  3,4,3	compute location from index 
309:     LD  3,0(3)	Load array element 
310:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
311:    LDA  1,-14(1)	Ghost frame becomes new active frame 
312:    LDA  3,1(7)	Return address in ac 
313:    JMP  7,-308(7)	CALL output
314:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
315:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
316:    LDA  1,-14(1)	Ghost frame becomes new active frame 
317:    LDA  3,1(7)	Return address in ac 
318:    JMP  7,-285(7)	CALL outnl
319:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL esperanza
320:     ST  1,-14(1)	Store fp in ghost frame for esperanza
* TOFF dec: -15
* TOFF dec: -16
* Param 1
321:     LD  3,-2(1)	Load variable zx
322:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
323:    LDA  3,-4(1)	Load address of base of array zy
324:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end esperanza
325:    LDA  1,-14(1)	Ghost frame becomes new active frame 
326:    LDA  3,1(7)	Return address in ac 
327:    JMP  7,-289(7)	CALL esperanza
328:    LDA  3,0(2)	Save the result in ac 
* Call end esperanza
* TOFF set: -14
* EXPRESSION
* CALL output
329:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
330:     LD  3,-2(1)	Load variable zx
331:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
332:    LDA  1,-14(1)	Ghost frame becomes new active frame 
333:    LDA  3,1(7)	Return address in ac 
334:    JMP  7,-329(7)	CALL output
335:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
336:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
337:    LDA  3,-4(1)	Load address of base of array zy
338:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
339:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -16
340:     LD  4,-16(1)	Pop left into ac1 
341:    SUB  3,4,3	compute location from index 
342:     LD  3,0(3)	Load array element 
343:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
344:    LDA  1,-14(1)	Ghost frame becomes new active frame 
345:    LDA  3,1(7)	Return address in ac 
346:    JMP  7,-341(7)	CALL output
347:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
348:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
349:    LDA  1,-14(1)	Ghost frame becomes new active frame 
350:    LDA  3,1(7)	Return address in ac 
351:    JMP  7,-318(7)	CALL outnl
352:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
353:    LDC  2,0(6)	Set return value to 0 
354:     LD  3,-1(1)	Load return address 
355:     LD  1,0(1)	Adjust fp 
356:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,356(7)	Jump to init [backpatch] 
* INIT
357:    LDA  1,-12(0)	set first frame at end of globals 
358:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
359:    LDC  3,10(6)	load size of array gy
360:     ST  3,-1(0)	save size of array gy
* END INIT GLOBALS AND STATICS
361:    LDA  3,1(7)	Return address in ac 
362:    JMP  7,-79(7)	Jump to main 
363:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
