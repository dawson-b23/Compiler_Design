* bC compiler version bC-Su23
* File compiled:  tinyOps.bC
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
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 42:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -6
 43:     LD  4,-6(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array y
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable y
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 49:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 50:     LD  4,-6(1)	Pop index 
 51:    LDA  5,-1(0)	Load address of base of array y
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable y
* EXPRESSION
 54:    LDC  3,8(6)	Load integer constant 
 55:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 56:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 57:     LD  4,-6(1)	Pop index 
 58:    LDA  5,-1(0)	Load address of base of array y
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable y
* EXPRESSION
 61:    LDC  3,50(6)	Load integer constant 
 62:     ST  3,-2(1)	Store variable a
* EXPRESSION
 63:    LDC  3,1(6)	Load integer constant 
 64:     ST  3,-3(1)	Store variable b
* EXPRESSION
 65:    LDC  3,8(6)	Load integer constant 
 66:     ST  3,-4(1)	Store variable c
* EXPRESSION
 67:    LDC  3,0(6)	Load Boolean constant 
 68:     ST  3,-11(0)	Store variable x
* EXPRESSION
 69:    LDC  3,1(6)	Load Boolean constant 
 70:     ST  3,-5(1)	Store variable z
* EXPRESSION
* CALL outputb
 71:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 72:     LD  3,-2(1)	Load variable a
 73:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 74:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
 75:     LD  4,-8(1)	Pop left into ac1 
 76:    TLE  3,4,3	Op <= 
 77:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 78:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-64(7)	CALL outputb
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
 82:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 83:     LD  3,-3(1)	Load variable b
 84:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 85:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
 86:     LD  4,-8(1)	Pop left into ac1 
 87:    TLE  3,4,3	Op <= 
 88:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 89:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-75(7)	CALL outputb
 92:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
 93:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 94:    LDC  3,50(6)	Load integer constant 
 95:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 96:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
 97:     LD  4,-8(1)	Pop left into ac1 
 98:    TLE  3,4,3	Op <= 
 99:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
100:    LDA  1,-6(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-86(7)	CALL outputb
103:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
104:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
105:    LDA  1,-6(1)	Ghost frame becomes new active frame 
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-74(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
109:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
110:    LDC  3,50(6)	Load integer constant 
111:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
112:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
113:     LD  4,-8(1)	Pop left into ac1 
114:    TLT  3,4,3	Op < 
115:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
116:    LDA  1,-6(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-102(7)	CALL outputb
119:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
120:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
121:     LD  3,-3(1)	Load variable b
122:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
123:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
124:     LD  4,-8(1)	Pop left into ac1 
125:    TLT  3,4,3	Op < 
126:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
127:    LDA  1,-6(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-113(7)	CALL outputb
130:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
131:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
132:     LD  3,-2(1)	Load variable a
133:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
134:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
135:     LD  4,-8(1)	Pop left into ac1 
136:    TLT  3,4,3	Op < 
137:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
138:    LDA  1,-6(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-124(7)	CALL outputb
141:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
142:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
143:    LDA  1,-6(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-112(7)	CALL outnl
146:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
147:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
148:    LDC  3,50(6)	Load integer constant 
149:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
150:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
151:     LD  4,-8(1)	Pop left into ac1 
152:    TGT  3,4,3	Op > 
153:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
154:    LDA  1,-6(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-140(7)	CALL outputb
157:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
158:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
159:    LDC  3,1(6)	Load integer constant 
160:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
161:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
162:     LD  4,-8(1)	Pop left into ac1 
163:    TGT  3,4,3	Op > 
164:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
165:    LDA  1,-6(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-151(7)	CALL outputb
168:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
169:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
170:    LDC  3,50(6)	Load integer constant 
171:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
172:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
173:     LD  4,-8(1)	Pop left into ac1 
174:    TGT  3,4,3	Op > 
175:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
176:    LDA  1,-6(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-162(7)	CALL outputb
179:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
180:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
181:    LDA  1,-6(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-150(7)	CALL outnl
184:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
185:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
186:    LDC  3,50(6)	Load integer constant 
187:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
188:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
189:     LD  4,-8(1)	Pop left into ac1 
190:    TGE  3,4,3	Op >= 
191:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
192:    LDA  1,-6(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-178(7)	CALL outputb
195:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
196:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
197:    LDC  3,1(6)	Load integer constant 
198:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
199:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
200:     LD  4,-8(1)	Pop left into ac1 
201:    TGE  3,4,3	Op >= 
202:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
203:    LDA  1,-6(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-189(7)	CALL outputb
206:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
207:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
208:    LDC  3,50(6)	Load integer constant 
209:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
210:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
211:     LD  4,-8(1)	Pop left into ac1 
212:    TGE  3,4,3	Op >= 
213:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
214:    LDA  1,-6(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-200(7)	CALL outputb
217:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
218:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
219:    LDA  1,-6(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-188(7)	CALL outnl
222:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
223:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
224:    LDA  3,-1(0)	Load address of base of array y
225:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
226:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
227:     LD  4,-8(1)	Pop left into ac1 
228:    SUB  3,4,3	compute location from index 
229:     LD  3,0(3)	Load array element 
230:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
231:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
232:     LD  4,-8(1)	Pop left into ac1 
233:    TEQ  3,4,3	Op == 
234:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
235:    LDA  1,-6(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-221(7)	CALL outputb
238:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
239:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
240:     LD  3,-2(1)	Load variable a
241:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
242:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
243:     LD  4,-8(1)	Pop left into ac1 
244:    TEQ  3,4,3	Op == 
245:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
246:    LDA  1,-6(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-232(7)	CALL outputb
249:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
250:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
251:     LD  3,-3(1)	Load variable b
252:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
253:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
254:     LD  4,-8(1)	Pop left into ac1 
255:    TEQ  3,4,3	Op == 
256:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
257:    LDA  1,-6(1)	Ghost frame becomes new active frame 
258:    LDA  3,1(7)	Return address in ac 
259:    JMP  7,-243(7)	CALL outputb
260:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
261:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
262:    LDA  1,-6(1)	Ghost frame becomes new active frame 
263:    LDA  3,1(7)	Return address in ac 
264:    JMP  7,-231(7)	CALL outnl
265:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
266:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
267:    LDA  3,-1(0)	Load address of base of array y
268:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
269:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
270:     LD  4,-8(1)	Pop left into ac1 
271:    SUB  3,4,3	compute location from index 
272:     LD  3,0(3)	Load array element 
273:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
274:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
275:     LD  4,-8(1)	Pop left into ac1 
276:    TNE  3,4,3	Op != 
277:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
278:    LDA  1,-6(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-264(7)	CALL outputb
281:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
282:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
283:    LDA  3,-1(0)	Load address of base of array y
284:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
285:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
286:     LD  4,-8(1)	Pop left into ac1 
287:    SUB  3,4,3	compute location from index 
288:     LD  3,0(3)	Load array element 
289:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
290:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
291:     LD  4,-8(1)	Pop left into ac1 
292:    TNE  3,4,3	Op != 
293:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
294:    LDA  1,-6(1)	Ghost frame becomes new active frame 
295:    LDA  3,1(7)	Return address in ac 
296:    JMP  7,-280(7)	CALL outputb
297:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
298:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
299:     LD  3,-2(1)	Load variable a
300:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
301:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
302:     LD  4,-8(1)	Pop left into ac1 
303:    TNE  3,4,3	Op != 
304:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
305:    LDA  1,-6(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-291(7)	CALL outputb
308:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
309:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
310:     LD  3,-3(1)	Load variable b
311:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
312:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
313:     LD  4,-8(1)	Pop left into ac1 
314:    TNE  3,4,3	Op != 
315:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
316:    LDA  1,-6(1)	Ghost frame becomes new active frame 
317:    LDA  3,1(7)	Return address in ac 
318:    JMP  7,-302(7)	CALL outputb
319:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
320:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
321:    LDA  1,-6(1)	Ghost frame becomes new active frame 
322:    LDA  3,1(7)	Return address in ac 
323:    JMP  7,-290(7)	CALL outnl
324:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
325:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
326:    LDC  3,1(6)	Load Boolean constant 
327:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
328:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
329:     LD  4,-8(1)	Pop left into ac1 
330:    AND  3,4,3	Op AND 
331:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
332:    LDA  1,-6(1)	Ghost frame becomes new active frame 
333:    LDA  3,1(7)	Return address in ac 
334:    JMP  7,-318(7)	CALL outputb
335:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
336:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
337:    LDC  3,1(6)	Load Boolean constant 
338:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
339:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
340:     LD  4,-8(1)	Pop left into ac1 
341:    AND  3,4,3	Op AND 
342:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
343:    LDA  1,-6(1)	Ghost frame becomes new active frame 
344:    LDA  3,1(7)	Return address in ac 
345:    JMP  7,-329(7)	CALL outputb
346:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
347:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
348:    LDC  3,0(6)	Load Boolean constant 
349:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
350:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
351:     LD  4,-8(1)	Pop left into ac1 
352:    AND  3,4,3	Op AND 
353:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
354:    LDA  1,-6(1)	Ghost frame becomes new active frame 
355:    LDA  3,1(7)	Return address in ac 
356:    JMP  7,-340(7)	CALL outputb
357:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
358:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
359:    LDC  3,0(6)	Load Boolean constant 
360:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
361:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
362:     LD  4,-8(1)	Pop left into ac1 
363:    AND  3,4,3	Op AND 
364:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
365:    LDA  1,-6(1)	Ghost frame becomes new active frame 
366:    LDA  3,1(7)	Return address in ac 
367:    JMP  7,-351(7)	CALL outputb
368:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
369:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
370:    LDA  1,-6(1)	Ghost frame becomes new active frame 
371:    LDA  3,1(7)	Return address in ac 
372:    JMP  7,-339(7)	CALL outnl
373:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
374:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
375:    LDC  3,1(6)	Load Boolean constant 
376:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
377:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
378:     LD  4,-8(1)	Pop left into ac1 
379:     OR  3,4,3	Op OR 
380:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
381:    LDA  1,-6(1)	Ghost frame becomes new active frame 
382:    LDA  3,1(7)	Return address in ac 
383:    JMP  7,-367(7)	CALL outputb
384:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
385:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
386:     LD  3,-5(1)	Load variable z
387:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
388:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
389:     LD  4,-8(1)	Pop left into ac1 
390:     OR  3,4,3	Op OR 
391:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
392:    LDA  1,-6(1)	Ghost frame becomes new active frame 
393:    LDA  3,1(7)	Return address in ac 
394:    JMP  7,-378(7)	CALL outputb
395:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
396:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
397:    LDC  3,0(6)	Load Boolean constant 
398:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
399:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
400:     LD  4,-8(1)	Pop left into ac1 
401:     OR  3,4,3	Op OR 
402:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
403:    LDA  1,-6(1)	Ghost frame becomes new active frame 
404:    LDA  3,1(7)	Return address in ac 
405:    JMP  7,-389(7)	CALL outputb
406:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
407:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
408:    LDC  3,0(6)	Load Boolean constant 
409:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
410:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
411:     LD  4,-8(1)	Pop left into ac1 
412:     OR  3,4,3	Op OR 
413:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
414:    LDA  1,-6(1)	Ghost frame becomes new active frame 
415:    LDA  3,1(7)	Return address in ac 
416:    JMP  7,-400(7)	CALL outputb
417:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
418:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
419:    LDA  1,-6(1)	Ghost frame becomes new active frame 
420:    LDA  3,1(7)	Return address in ac 
421:    JMP  7,-388(7)	CALL outnl
422:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
423:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
424:    LDC  3,1(6)	Load Boolean constant 
425:    LDC  4,1(6)	Load 1 
426:    XOR  3,3,4	Op XOR to get logical not 
427:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
428:    LDA  1,-6(1)	Ghost frame becomes new active frame 
429:    LDA  3,1(7)	Return address in ac 
430:    JMP  7,-414(7)	CALL outputb
431:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
432:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
433:    LDC  3,0(6)	Load Boolean constant 
434:    LDC  4,1(6)	Load 1 
435:    XOR  3,3,4	Op XOR to get logical not 
436:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
437:    LDA  1,-6(1)	Ghost frame becomes new active frame 
438:    LDA  3,1(7)	Return address in ac 
439:    JMP  7,-423(7)	CALL outputb
440:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
441:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
442:     LD  3,-11(0)	Load variable x
443:    LDC  4,1(6)	Load 1 
444:    XOR  3,3,4	Op XOR to get logical not 
445:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
446:    LDA  1,-6(1)	Ghost frame becomes new active frame 
447:    LDA  3,1(7)	Return address in ac 
448:    JMP  7,-432(7)	CALL outputb
449:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
450:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
451:     LD  3,-11(0)	Load variable x
452:    LDC  4,1(6)	Load 1 
453:    XOR  3,3,4	Op XOR to get logical not 
454:    LDC  4,1(6)	Load 1 
455:    XOR  3,3,4	Op XOR to get logical not 
456:    LDC  4,1(6)	Load 1 
457:    XOR  3,3,4	Op XOR to get logical not 
458:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
459:    LDA  1,-6(1)	Ghost frame becomes new active frame 
460:    LDA  3,1(7)	Return address in ac 
461:    JMP  7,-445(7)	CALL outputb
462:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
463:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
464:    LDA  1,-6(1)	Ghost frame becomes new active frame 
465:    LDA  3,1(7)	Return address in ac 
466:    JMP  7,-433(7)	CALL outnl
467:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
468:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
469:    LDC  3,5(6)	Load integer constant 
470:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
471:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
472:     LD  4,-8(1)	Pop left into ac1 
473:    ADD  3,4,3	Op + 
474:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
475:    LDA  1,-6(1)	Ghost frame becomes new active frame 
476:    LDA  3,1(7)	Return address in ac 
477:    JMP  7,-472(7)	CALL output
478:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
479:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
480:    LDA  3,-1(0)	Load address of base of array y
481:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
482:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
483:     LD  4,-8(1)	Pop left into ac1 
484:    SUB  3,4,3	compute location from index 
485:     LD  3,0(3)	Load array element 
486:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
487:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
488:     LD  4,-8(1)	Pop left into ac1 
489:    ADD  3,4,3	Op + 
490:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
491:    LDA  1,-6(1)	Ghost frame becomes new active frame 
492:    LDA  3,1(7)	Return address in ac 
493:    JMP  7,-488(7)	CALL output
494:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
495:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
496:    LDA  1,-6(1)	Ghost frame becomes new active frame 
497:    LDA  3,1(7)	Return address in ac 
498:    JMP  7,-465(7)	CALL outnl
499:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
500:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
501:    LDC  3,5(6)	Load integer constant 
502:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
503:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
504:     LD  4,-8(1)	Pop left into ac1 
505:    SUB  3,4,3	Op - 
506:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
507:    LDA  1,-6(1)	Ghost frame becomes new active frame 
508:    LDA  3,1(7)	Return address in ac 
509:    JMP  7,-504(7)	CALL output
510:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
511:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
512:    LDC  3,30(6)	Load integer constant 
513:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
514:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
515:     LD  4,-8(1)	Pop left into ac1 
516:    SUB  3,4,3	Op - 
517:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
518:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
519:     LD  4,-8(1)	Pop left into ac1 
520:    SUB  3,4,3	Op - 
521:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
522:    LDA  1,-6(1)	Ghost frame becomes new active frame 
523:    LDA  3,1(7)	Return address in ac 
524:    JMP  7,-519(7)	CALL output
525:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
526:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
527:    LDA  1,-6(1)	Ghost frame becomes new active frame 
528:    LDA  3,1(7)	Return address in ac 
529:    JMP  7,-496(7)	CALL outnl
530:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
531:    LDC  3,50(6)	Load integer constant 
532:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL output
533:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
534:     LD  3,-2(1)	Load variable a
535:    NEG  3,3,3	Op unary - 
536:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
537:    LDA  1,-6(1)	Ghost frame becomes new active frame 
538:    LDA  3,1(7)	Return address in ac 
539:    JMP  7,-534(7)	CALL output
540:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
541:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
542:     LD  3,-2(1)	Load variable a
543:    NEG  3,3,3	Op unary - 
544:    NEG  3,3,3	Op unary - 
545:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
546:    LDA  1,-6(1)	Ghost frame becomes new active frame 
547:    LDA  3,1(7)	Return address in ac 
548:    JMP  7,-543(7)	CALL output
549:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
550:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
551:     LD  3,-2(1)	Load variable a
552:    NEG  3,3,3	Op unary - 
553:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
554:    LDA  1,-6(1)	Ghost frame becomes new active frame 
555:    LDA  3,1(7)	Return address in ac 
556:    JMP  7,-551(7)	CALL output
557:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
558:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
559:    LDC  3,0(6)	Load integer constant 
560:    NEG  3,3,3	Op unary - 
561:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
562:    LDA  1,-6(1)	Ghost frame becomes new active frame 
563:    LDA  3,1(7)	Return address in ac 
564:    JMP  7,-559(7)	CALL output
565:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
566:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
567:    LDC  3,1(6)	Load integer constant 
568:    NEG  3,3,3	Op unary - 
569:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
570:    LDA  1,-6(1)	Ghost frame becomes new active frame 
571:    LDA  3,1(7)	Return address in ac 
572:    JMP  7,-567(7)	CALL output
573:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
574:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
575:    LDA  1,-6(1)	Ghost frame becomes new active frame 
576:    LDA  3,1(7)	Return address in ac 
577:    JMP  7,-544(7)	CALL outnl
578:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
579:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
580:    LDC  3,2(6)	Load integer constant 
581:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
582:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
583:     LD  4,-8(1)	Pop left into ac1 
584:    MUL  3,4,3	Op * 
585:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
586:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
587:     LD  4,-8(1)	Pop left into ac1 
588:    MUL  3,4,3	Op * 
589:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
590:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
591:     LD  4,-8(1)	Pop left into ac1 
592:    MUL  3,4,3	Op * 
593:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
594:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -8
595:     LD  4,-8(1)	Pop left into ac1 
596:    MUL  3,4,3	Op * 
597:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
598:    LDA  1,-6(1)	Ghost frame becomes new active frame 
599:    LDA  3,1(7)	Return address in ac 
600:    JMP  7,-595(7)	CALL output
601:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
602:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
603:    LDC  3,50(6)	Load integer constant 
604:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
605:    LDA  3,-1(0)	Load address of base of array y
606:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
607:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -9
608:     LD  4,-9(1)	Pop left into ac1 
609:    SUB  3,4,3	compute location from index 
610:     LD  3,0(3)	Load array element 
* TOFF inc: -8
611:     LD  4,-8(1)	Pop left into ac1 
612:    MUL  3,4,3	Op * 
613:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
614:    LDA  1,-6(1)	Ghost frame becomes new active frame 
615:    LDA  3,1(7)	Return address in ac 
616:    JMP  7,-611(7)	CALL output
617:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
618:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
619:    LDA  3,-1(0)	Load address of base of array y
620:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
621:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
622:     LD  4,-8(1)	Pop left into ac1 
623:    SUB  3,4,3	compute location from index 
624:     LD  3,0(3)	Load array element 
625:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
626:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
627:     LD  4,-8(1)	Pop left into ac1 
628:    MUL  3,4,3	Op * 
629:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
630:    LDA  1,-6(1)	Ghost frame becomes new active frame 
631:    LDA  3,1(7)	Return address in ac 
632:    JMP  7,-627(7)	CALL output
633:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
634:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
635:    LDA  1,-6(1)	Ghost frame becomes new active frame 
636:    LDA  3,1(7)	Return address in ac 
637:    JMP  7,-604(7)	CALL outnl
638:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
639:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
640:    LDC  3,50(6)	Load integer constant 
641:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
642:    LDA  3,-1(0)	Load address of base of array y
643:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
644:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -9
645:     LD  4,-9(1)	Pop left into ac1 
646:    SUB  3,4,3	compute location from index 
647:     LD  3,0(3)	Load array element 
* TOFF inc: -8
648:     LD  4,-8(1)	Pop left into ac1 
649:    DIV  3,4,3	Op / 
650:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
651:    LDA  1,-6(1)	Ghost frame becomes new active frame 
652:    LDA  3,1(7)	Return address in ac 
653:    JMP  7,-648(7)	CALL output
654:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
655:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
656:    LDA  3,-1(0)	Load address of base of array y
657:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
658:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
659:     LD  4,-8(1)	Pop left into ac1 
660:    SUB  3,4,3	compute location from index 
661:     LD  3,0(3)	Load array element 
662:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
663:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
664:     LD  4,-8(1)	Pop left into ac1 
665:    DIV  3,4,3	Op / 
666:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
667:    LDA  1,-6(1)	Ghost frame becomes new active frame 
668:    LDA  3,1(7)	Return address in ac 
669:    JMP  7,-664(7)	CALL output
670:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
671:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
672:    LDA  3,-1(0)	Load address of base of array y
673:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
674:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
675:     LD  4,-8(1)	Pop left into ac1 
676:    SUB  3,4,3	compute location from index 
677:     LD  3,0(3)	Load array element 
678:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
679:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
680:     LD  4,-8(1)	Pop left into ac1 
681:    DIV  3,4,3	Op / 
682:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
683:    LDA  1,-6(1)	Ghost frame becomes new active frame 
684:    LDA  3,1(7)	Return address in ac 
685:    JMP  7,-680(7)	CALL output
686:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
687:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
688:    LDC  3,210(6)	Load integer constant 
689:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
690:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
691:     LD  4,-8(1)	Pop left into ac1 
692:    DIV  3,4,3	Op / 
693:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
694:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
695:     LD  4,-8(1)	Pop left into ac1 
696:    DIV  3,4,3	Op / 
697:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
698:    LDA  1,-6(1)	Ghost frame becomes new active frame 
699:    LDA  3,1(7)	Return address in ac 
700:    JMP  7,-695(7)	CALL output
701:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
702:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
703:    LDA  1,-6(1)	Ghost frame becomes new active frame 
704:    LDA  3,1(7)	Return address in ac 
705:    JMP  7,-672(7)	CALL outnl
706:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
707:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
708:    LDC  3,211(6)	Load integer constant 
709:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
710:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
711:     LD  4,-8(1)	Pop left into ac1 
712:    MOD  3,4,3	Op % 
713:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
714:    LDA  1,-6(1)	Ghost frame becomes new active frame 
715:    LDA  3,1(7)	Return address in ac 
716:    JMP  7,-711(7)	CALL output
717:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
718:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
719:    LDC  3,211(6)	Load integer constant 
720:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
721:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -8
722:     LD  4,-8(1)	Pop left into ac1 
723:    MOD  3,4,3	Op % 
724:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
725:    LDA  1,-6(1)	Ghost frame becomes new active frame 
726:    LDA  3,1(7)	Return address in ac 
727:    JMP  7,-722(7)	CALL output
728:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
729:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
730:    LDC  3,211(6)	Load integer constant 
731:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
732:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
733:     LD  4,-8(1)	Pop left into ac1 
734:    MOD  3,4,3	Op % 
735:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
736:    LDA  1,-6(1)	Ghost frame becomes new active frame 
737:    LDA  3,1(7)	Return address in ac 
738:    JMP  7,-733(7)	CALL output
739:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
740:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
741:    LDC  3,211(6)	Load integer constant 
742:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
743:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -8
744:     LD  4,-8(1)	Pop left into ac1 
745:    MOD  3,4,3	Op % 
746:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
747:    LDA  1,-6(1)	Ghost frame becomes new active frame 
748:    LDA  3,1(7)	Return address in ac 
749:    JMP  7,-744(7)	CALL output
750:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
751:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
752:    LDC  3,211(6)	Load integer constant 
753:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
754:    LDC  3,211(6)	Load integer constant 
755:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
756:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -9
757:     LD  4,-9(1)	Pop left into ac1 
758:    DIV  3,4,3	Op / 
759:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
760:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -9
761:     LD  4,-9(1)	Pop left into ac1 
762:    MUL  3,4,3	Op * 
* TOFF inc: -8
763:     LD  4,-8(1)	Pop left into ac1 
764:    SUB  3,4,3	Op - 
765:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
766:    LDA  1,-6(1)	Ghost frame becomes new active frame 
767:    LDA  3,1(7)	Return address in ac 
768:    JMP  7,-763(7)	CALL output
769:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
770:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
771:    LDC  3,211(6)	Load integer constant 
772:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
773:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -8
774:     LD  4,-8(1)	Pop left into ac1 
775:    MOD  3,4,3	Op % 
776:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
777:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
778:     LD  4,-8(1)	Pop left into ac1 
779:    MOD  3,4,3	Op % 
780:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
781:    LDA  1,-6(1)	Ghost frame becomes new active frame 
782:    LDA  3,1(7)	Return address in ac 
783:    JMP  7,-778(7)	CALL output
784:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
785:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
786:    LDA  1,-6(1)	Ghost frame becomes new active frame 
787:    LDA  3,1(7)	Return address in ac 
788:    JMP  7,-755(7)	CALL outnl
789:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
790:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
791:    LDC  3,43(6)	Load integer constant 
792:     ST  3,-4(1)	Store variable c
793:     ST  3,-3(1)	Store variable b
794:     ST  3,-2(1)	Store variable a
795:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
796:    LDA  1,-6(1)	Ghost frame becomes new active frame 
797:    LDA  3,1(7)	Return address in ac 
798:    JMP  7,-793(7)	CALL output
799:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
800:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
801:     LD  3,-2(1)	Load variable a
802:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
803:    LDA  1,-6(1)	Ghost frame becomes new active frame 
804:    LDA  3,1(7)	Return address in ac 
805:    JMP  7,-800(7)	CALL output
806:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
807:    LDC  3,3(6)	Load integer constant 
808:     ST  3,-3(1)	Store variable b
809:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
810:    LDC  3,4(6)	Load integer constant 
811:     ST  3,-4(1)	Store variable c
* TOFF inc: -6
812:     LD  4,-6(1)	Pop left into ac1 
813:    MUL  3,4,3	Op * 
814:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL output
815:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
816:     LD  3,-2(1)	Load variable a
817:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
818:    LDA  1,-6(1)	Ghost frame becomes new active frame 
819:    LDA  3,1(7)	Return address in ac 
820:    JMP  7,-815(7)	CALL output
821:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
822:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
823:    LDA  1,-6(1)	Ghost frame becomes new active frame 
824:    LDA  3,1(7)	Return address in ac 
825:    JMP  7,-792(7)	CALL outnl
826:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
827:    LDC  3,44(6)	Load integer constant 
828:     ST  3,-2(1)	Store variable a
* EXPRESSION
829:    LDC  3,2(6)	Load integer constant 
830:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
831:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
832:     LD  3,-3(1)	Load variable b
833:     LD  4,-2(1)	load lhs variable a
834:    ADD  3,4,3	op += 
835:     ST  3,-2(1)	Store variable a
836:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
837:    LDA  1,-6(1)	Ghost frame becomes new active frame 
838:    LDA  3,1(7)	Return address in ac 
839:    JMP  7,-834(7)	CALL output
840:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
841:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
842:     LD  3,-3(1)	Load variable b
843:     LD  4,-2(1)	load lhs variable a
844:    SUB  3,4,3	op -= 
845:     ST  3,-2(1)	Store variable a
846:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
847:    LDA  1,-6(1)	Ghost frame becomes new active frame 
848:    LDA  3,1(7)	Return address in ac 
849:    JMP  7,-844(7)	CALL output
850:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
851:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
852:     LD  3,-2(1)	Load variable a
853:     LD  4,-2(1)	load lhs variable a
854:    SUB  3,4,3	op -= 
855:     ST  3,-2(1)	Store variable a
856:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
857:    LDA  1,-6(1)	Ghost frame becomes new active frame 
858:    LDA  3,1(7)	Return address in ac 
859:    JMP  7,-854(7)	CALL output
860:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
861:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
862:    LDC  3,10(6)	Load integer constant 
863:     LD  4,-3(1)	load lhs variable b
864:    ADD  3,4,3	op += 
865:     ST  3,-3(1)	Store variable b
866:     LD  4,-2(1)	load lhs variable a
867:    ADD  3,4,3	op += 
868:     ST  3,-2(1)	Store variable a
869:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
870:    LDA  1,-6(1)	Ghost frame becomes new active frame 
871:    LDA  3,1(7)	Return address in ac 
872:    JMP  7,-867(7)	CALL output
873:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
874:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
875:    LDA  1,-6(1)	Ghost frame becomes new active frame 
876:    LDA  3,1(7)	Return address in ac 
877:    JMP  7,-844(7)	CALL outnl
878:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
879:    LDC  3,44(6)	Load integer constant 
880:     ST  3,-2(1)	Store variable a
* EXPRESSION
881:    LDC  3,2(6)	Load integer constant 
882:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
883:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
884:     LD  3,-3(1)	Load variable b
885:     LD  4,-2(1)	load lhs variable a
886:    MUL  3,4,3	op *= 
887:     ST  3,-2(1)	Store variable a
888:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
889:    LDA  1,-6(1)	Ghost frame becomes new active frame 
890:    LDA  3,1(7)	Return address in ac 
891:    JMP  7,-886(7)	CALL output
892:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
893:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
894:     LD  3,-3(1)	Load variable b
895:     LD  4,-2(1)	load lhs variable a
896:    DIV  3,4,3	op /= 
897:     ST  3,-2(1)	Store variable a
898:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
899:    LDA  1,-6(1)	Ghost frame becomes new active frame 
900:    LDA  3,1(7)	Return address in ac 
901:    JMP  7,-896(7)	CALL output
902:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
903:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
904:    LDC  3,2(6)	Load integer constant 
905:     LD  4,-2(1)	load lhs variable a
906:    DIV  3,4,3	op /= 
907:     ST  3,-2(1)	Store variable a
908:     LD  4,-2(1)	load lhs variable a
909:    DIV  3,4,3	op /= 
910:     ST  3,-2(1)	Store variable a
911:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
912:    LDA  1,-6(1)	Ghost frame becomes new active frame 
913:    LDA  3,1(7)	Return address in ac 
914:    JMP  7,-909(7)	CALL output
915:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
916:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
917:    LDC  3,10(6)	Load integer constant 
918:     LD  4,-3(1)	load lhs variable b
919:    MUL  3,4,3	op *= 
920:     ST  3,-3(1)	Store variable b
921:     LD  4,-2(1)	load lhs variable a
922:    MUL  3,4,3	op *= 
923:     ST  3,-2(1)	Store variable a
924:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
925:    LDA  1,-6(1)	Ghost frame becomes new active frame 
926:    LDA  3,1(7)	Return address in ac 
927:    JMP  7,-922(7)	CALL output
928:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
929:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
930:    LDA  1,-6(1)	Ghost frame becomes new active frame 
931:    LDA  3,1(7)	Return address in ac 
932:    JMP  7,-899(7)	CALL outnl
933:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
934:    LDC  3,44(6)	Load integer constant 
935:     ST  3,-2(1)	Store variable a
* EXPRESSION
936:    LDC  3,2(6)	Load integer constant 
937:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
938:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
939:     LD  3,-2(1)	load lhs variable a
940:    LDA  3,1(3)	increment value of a
941:     ST  3,-2(1)	Store variable a
942:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
943:    LDA  1,-6(1)	Ghost frame becomes new active frame 
944:    LDA  3,1(7)	Return address in ac 
945:    JMP  7,-940(7)	CALL output
946:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
947:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
948:     LD  3,-3(1)	load lhs variable b
949:    LDA  3,-1(3)	decrement value of b
950:     ST  3,-3(1)	Store variable b
951:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
952:    LDA  1,-6(1)	Ghost frame becomes new active frame 
953:    LDA  3,1(7)	Return address in ac 
954:    JMP  7,-949(7)	CALL output
955:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
956:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
957:    LDA  1,-6(1)	Ghost frame becomes new active frame 
958:    LDA  3,1(7)	Return address in ac 
959:    JMP  7,-926(7)	CALL outnl
960:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
961:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
962:    LDC  3,3(6)	Load integer constant 
963:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
964:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -8
965:     LD  4,-8(1)	Pop left into ac1 
966:    SUB  3,4,3	Op - 
967:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
968:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
969:     LD  4,-8(1)	Pop left into ac1 
970:    SUB  3,4,3	Op - 
971:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
972:    LDA  1,-6(1)	Ghost frame becomes new active frame 
973:    LDA  3,1(7)	Return address in ac 
974:    JMP  7,-969(7)	CALL output
975:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
976:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
977:    LDC  3,211(6)	Load integer constant 
978:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
979:    LDC  3,17(6)	Load integer constant 
* TOFF inc: -8
980:     LD  4,-8(1)	Pop left into ac1 
981:    DIV  3,4,3	Op / 
982:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
983:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
984:     LD  4,-8(1)	Pop left into ac1 
985:    DIV  3,4,3	Op / 
986:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
987:    LDA  1,-6(1)	Ghost frame becomes new active frame 
988:    LDA  3,1(7)	Return address in ac 
989:    JMP  7,-984(7)	CALL output
990:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
991:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
992:    LDC  3,211(6)	Load integer constant 
993:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
994:    LDC  3,17(6)	Load integer constant 
995:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
996:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -9
997:     LD  4,-9(1)	Pop left into ac1 
998:    DIV  3,4,3	Op / 
* TOFF inc: -8
999:     LD  4,-8(1)	Pop left into ac1 
1000:    DIV  3,4,3	Op / 
1001:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
1002:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1003:    LDA  3,1(7)	Return address in ac 
1004:    JMP  7,-999(7)	CALL output
1005:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
1006:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
1007:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1008:    LDA  3,1(7)	Return address in ac 
1009:    JMP  7,-976(7)	CALL outnl
1010:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
1011:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1012:    LDC  3,1(6)	Load Boolean constant 
1013:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1014:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
1015:     LD  4,-8(1)	Pop left into ac1 
1016:     OR  3,4,3	Op OR 
1017:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1018:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
1019:     LD  4,-8(1)	Pop left into ac1 
1020:    AND  3,4,3	Op AND 
1021:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1022:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1023:    LDA  3,1(7)	Return address in ac 
1024:    JMP  7,-1008(7)	CALL outputb
1025:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1026:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1027:    LDC  3,1(6)	Load Boolean constant 
1028:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1029:    LDC  3,0(6)	Load Boolean constant 
1030:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
1031:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -9
1032:     LD  4,-9(1)	Pop left into ac1 
1033:    AND  3,4,3	Op AND 
* TOFF inc: -8
1034:     LD  4,-8(1)	Pop left into ac1 
1035:     OR  3,4,3	Op OR 
1036:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1037:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1038:    LDA  3,1(7)	Return address in ac 
1039:    JMP  7,-1023(7)	CALL outputb
1040:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1041:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1042:    LDC  3,1(6)	Load Boolean constant 
1043:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1044:    LDC  3,0(6)	Load Boolean constant 
1045:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
1046:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -9
1047:     LD  4,-9(1)	Pop left into ac1 
1048:    AND  3,4,3	Op AND 
* TOFF inc: -8
1049:     LD  4,-8(1)	Pop left into ac1 
1050:     OR  3,4,3	Op OR 
1051:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1052:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1053:    LDA  3,1(7)	Return address in ac 
1054:    JMP  7,-1038(7)	CALL outputb
1055:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
1056:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
1057:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1058:    LDA  3,1(7)	Return address in ac 
1059:    JMP  7,-1026(7)	CALL outnl
1060:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
1061:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1062:    LDC  3,3(6)	Load integer constant 
1063:    RND  3,3,6	Op ? 
1064:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1065:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1066:     LD  4,-8(1)	Pop left into ac1 
1067:    TLT  3,4,3	Op < 
1068:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1069:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1070:    LDA  3,1(7)	Return address in ac 
1071:    JMP  7,-1055(7)	CALL outputb
1072:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1073:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1074:    LDC  3,3(6)	Load integer constant 
1075:    RND  3,3,6	Op ? 
1076:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1077:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1078:     LD  4,-8(1)	Pop left into ac1 
1079:    TLT  3,4,3	Op < 
1080:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1081:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1082:    LDA  3,1(7)	Return address in ac 
1083:    JMP  7,-1067(7)	CALL outputb
1084:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1085:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1086:    LDC  3,3(6)	Load integer constant 
1087:    RND  3,3,6	Op ? 
1088:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1089:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1090:     LD  4,-8(1)	Pop left into ac1 
1091:    TLT  3,4,3	Op < 
1092:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1093:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1094:    LDA  3,1(7)	Return address in ac 
1095:    JMP  7,-1079(7)	CALL outputb
1096:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1097:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1098:    LDC  3,3(6)	Load integer constant 
1099:    RND  3,3,6	Op ? 
1100:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1101:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1102:     LD  4,-8(1)	Pop left into ac1 
1103:    TLT  3,4,3	Op < 
1104:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1105:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1106:    LDA  3,1(7)	Return address in ac 
1107:    JMP  7,-1091(7)	CALL outputb
1108:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1109:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1110:    LDC  3,3(6)	Load integer constant 
1111:    RND  3,3,6	Op ? 
1112:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1113:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1114:     LD  4,-8(1)	Pop left into ac1 
1115:    TLT  3,4,3	Op < 
1116:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1117:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1118:    LDA  3,1(7)	Return address in ac 
1119:    JMP  7,-1103(7)	CALL outputb
1120:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1121:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1122:    LDC  3,3(6)	Load integer constant 
1123:    RND  3,3,6	Op ? 
1124:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1125:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1126:     LD  4,-8(1)	Pop left into ac1 
1127:    TLT  3,4,3	Op < 
1128:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1129:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1130:    LDA  3,1(7)	Return address in ac 
1131:    JMP  7,-1115(7)	CALL outputb
1132:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1133:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1134:    LDC  3,3(6)	Load integer constant 
1135:    RND  3,3,6	Op ? 
1136:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1137:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1138:     LD  4,-8(1)	Pop left into ac1 
1139:    TLT  3,4,3	Op < 
1140:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1141:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1142:    LDA  3,1(7)	Return address in ac 
1143:    JMP  7,-1127(7)	CALL outputb
1144:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1145:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1146:    LDC  3,3(6)	Load integer constant 
1147:    RND  3,3,6	Op ? 
1148:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1149:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1150:     LD  4,-8(1)	Pop left into ac1 
1151:    TLT  3,4,3	Op < 
1152:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1153:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1154:    LDA  3,1(7)	Return address in ac 
1155:    JMP  7,-1139(7)	CALL outputb
1156:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1157:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1158:    LDC  3,3(6)	Load integer constant 
1159:    RND  3,3,6	Op ? 
1160:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1161:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1162:     LD  4,-8(1)	Pop left into ac1 
1163:    TLT  3,4,3	Op < 
1164:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1165:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1166:    LDA  3,1(7)	Return address in ac 
1167:    JMP  7,-1151(7)	CALL outputb
1168:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1169:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1170:    LDC  3,3(6)	Load integer constant 
1171:    RND  3,3,6	Op ? 
1172:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1173:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1174:     LD  4,-8(1)	Pop left into ac1 
1175:    TLT  3,4,3	Op < 
1176:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1177:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1178:    LDA  3,1(7)	Return address in ac 
1179:    JMP  7,-1163(7)	CALL outputb
1180:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1181:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1182:    LDC  3,3(6)	Load integer constant 
1183:    RND  3,3,6	Op ? 
1184:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1185:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1186:     LD  4,-8(1)	Pop left into ac1 
1187:    TLT  3,4,3	Op < 
1188:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1189:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1190:    LDA  3,1(7)	Return address in ac 
1191:    JMP  7,-1175(7)	CALL outputb
1192:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1193:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1194:    LDC  3,3(6)	Load integer constant 
1195:    RND  3,3,6	Op ? 
1196:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1197:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
1198:     LD  4,-8(1)	Pop left into ac1 
1199:    TLT  3,4,3	Op < 
1200:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1201:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1202:    LDA  3,1(7)	Return address in ac 
1203:    JMP  7,-1187(7)	CALL outputb
1204:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1205:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1206:    LDC  3,1(6)	Load integer constant 
1207:    RND  3,3,6	Op ? 
1208:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1209:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
1210:     LD  4,-8(1)	Pop left into ac1 
1211:    TEQ  3,4,3	Op == 
1212:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1213:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1214:    LDA  3,1(7)	Return address in ac 
1215:    JMP  7,-1199(7)	CALL outputb
1216:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
1217:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
1218:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1219:    LDA  3,1(7)	Return address in ac 
1220:    JMP  7,-1187(7)	CALL outnl
1221:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
1222:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1223:    LDC  3,10000(6)	Load integer constant 
1224:    RND  3,3,6	Op ? 
1225:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1226:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
1227:     LD  4,-8(1)	Pop left into ac1 
1228:    TGT  3,4,3	Op > 
1229:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1230:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1231:    LDA  3,1(7)	Return address in ac 
1232:    JMP  7,-1216(7)	CALL outputb
1233:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
1234:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
1235:    LDC  3,10000(6)	Load integer constant 
1236:    RND  3,3,6	Op ? 
1237:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
1238:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
1239:     LD  4,-8(1)	Pop left into ac1 
1240:    TGT  3,4,3	Op > 
1241:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
1242:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1243:    LDA  3,1(7)	Return address in ac 
1244:    JMP  7,-1228(7)	CALL outputb
1245:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
1246:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
1247:    LDA  1,-6(1)	Ghost frame becomes new active frame 
1248:    LDA  3,1(7)	Return address in ac 
1249:    JMP  7,-1216(7)	CALL outnl
1250:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
1251:    LDC  2,0(6)	Set return value to 0 
1252:     LD  3,-1(1)	Load return address 
1253:     LD  1,0(1)	Adjust fp 
1254:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,1254(7)	Jump to init [backpatch] 
* INIT
1255:    LDA  1,-12(0)	set first frame at end of globals 
1256:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
1257:    LDC  3,10(6)	load size of array y
1258:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
1259:    LDA  3,1(7)	Return address in ac 
1260:    JMP  7,-1222(7)	Jump to main 
1261:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
