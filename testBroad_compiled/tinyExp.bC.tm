* bC compiler version bC-Su23
* File compiled:  tinyExp.bC
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
* FUNCTION ident
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* RETURN
 40:     LD  3,-2(1)	Load variable x
 41:    LDA  2,0(3)	Copy result to return register 
 42:     LD  3,-1(1)	Load return address 
 43:     LD  1,0(1)	Adjust fp 
 44:    JMP  7,0(3)	Return 
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6)	Set return value to 0 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* END FUNCTION ident
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 49:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 50:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
 51:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 52:    LDC  3,111(6)	Load integer constant 
 53:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
 54:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-18(7)	CALL ident
 57:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
 58:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 59:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
 63:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
 64:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 65:    LDC  3,111(6)	Load integer constant 
 66:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
 67:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-31(7)	CALL ident
 70:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
 71:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 72:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
 73:     LD  4,-5(1)	Pop left into ac1 
 74:    MUL  3,4,3	Op * 
 75:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 76:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
 80:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 81:    LDC  3,222(6)	Load integer constant 
 82:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
* CALL ident
 83:     ST  1,-6(1)	Store fp in ghost frame for ident
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 84:    LDC  3,111(6)	Load integer constant 
 85:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end ident
 86:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-50(7)	CALL ident
 89:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -6
* TOFF inc: -5
 90:     LD  4,-5(1)	Pop left into ac1 
 91:    MUL  3,4,3	Op * 
 92:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 93:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 97:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-67(7)	CALL outnl
101:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
102:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
103:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
104:    LDC  3,111(6)	Load integer constant 
105:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
106:    LDA  1,-5(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-70(7)	CALL ident
109:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
110:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
111:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
112:     LD  4,-5(1)	Pop left into ac1 
113:    MUL  3,4,3	Op * 
114:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
115:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
116:     LD  4,-5(1)	Pop left into ac1 
117:    ADD  3,4,3	Op + 
118:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
119:    LDA  1,-3(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
123:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
124:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
125:    LDC  3,111(6)	Load integer constant 
126:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
127:    LDA  1,-5(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-91(7)	CALL ident
130:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
131:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
132:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
133:     LD  4,-5(1)	Pop left into ac1 
134:    ADD  3,4,3	Op + 
135:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
136:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
137:     LD  4,-5(1)	Pop left into ac1 
138:    MUL  3,4,3	Op * 
139:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
140:    LDA  1,-3(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
144:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
145:    LDA  1,-3(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-114(7)	CALL outnl
148:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
149:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
150:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
151:    LDC  3,111(6)	Load integer constant 
152:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
153:    LDA  1,-5(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-117(7)	CALL ident
156:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
157:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
158:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
159:     LD  4,-5(1)	Pop left into ac1 
160:    ADD  3,4,3	Op + 
161:    NEG  3,3,3	Op unary - 
162:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
163:    LDA  1,-3(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-160(7)	CALL output
166:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
167:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
168:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
169:    LDC  3,111(6)	Load integer constant 
170:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
171:    LDA  1,-5(1)	Ghost frame becomes new active frame 
172:    LDA  3,1(7)	Return address in ac 
173:    JMP  7,-135(7)	CALL ident
174:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
175:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
176:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
177:     LD  4,-5(1)	Pop left into ac1 
178:    ADD  3,4,3	Op + 
179:    NEG  3,3,3	Op unary - 
180:    NEG  3,3,3	Op unary - 
181:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
182:    LDA  1,-3(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-179(7)	CALL output
185:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
186:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
187:    LDA  1,-3(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-156(7)	CALL outnl
190:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
191:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
192:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
193:    LDC  3,111(6)	Load integer constant 
194:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
195:    LDA  1,-5(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-159(7)	CALL ident
198:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
199:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
200:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
201:     LD  4,-5(1)	Pop left into ac1 
202:    ADD  3,4,3	Op + 
203:    NEG  3,3,3	Op unary - 
204:    NEG  3,3,3	Op unary - 
205:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
206:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
207:     LD  4,-5(1)	Pop left into ac1 
208:    MUL  3,4,3	Op * 
209:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
210:    LDA  1,-3(1)	Ghost frame becomes new active frame 
211:    LDA  3,1(7)	Return address in ac 
212:    JMP  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
214:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
215:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
216:    LDC  3,111(6)	Load integer constant 
217:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
218:    LDA  1,-5(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Return address in ac 
220:    JMP  7,-182(7)	CALL ident
221:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
222:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
223:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
224:     LD  4,-5(1)	Pop left into ac1 
225:    ADD  3,4,3	Op + 
226:    NEG  3,3,3	Op unary - 
227:    NEG  3,3,3	Op unary - 
228:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
229:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
230:     LD  4,-5(1)	Pop left into ac1 
231:    MUL  3,4,3	Op * 
232:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
233:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
234:     LD  4,-5(1)	Pop left into ac1 
235:    DIV  3,4,3	Op / 
236:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
237:    LDA  1,-3(1)	Ghost frame becomes new active frame 
238:    LDA  3,1(7)	Return address in ac 
239:    JMP  7,-234(7)	CALL output
240:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
241:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
242:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
243:    LDC  3,111(6)	Load integer constant 
244:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
245:    LDA  1,-5(1)	Ghost frame becomes new active frame 
246:    LDA  3,1(7)	Return address in ac 
247:    JMP  7,-209(7)	CALL ident
248:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
249:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
250:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
251:     LD  4,-5(1)	Pop left into ac1 
252:    ADD  3,4,3	Op + 
253:    NEG  3,3,3	Op unary - 
254:    NEG  3,3,3	Op unary - 
255:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
256:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
257:     LD  4,-5(1)	Pop left into ac1 
258:    MUL  3,4,3	Op * 
259:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
260:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
261:     LD  4,-5(1)	Pop left into ac1 
262:    DIV  3,4,3	Op / 
263:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
264:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
265:     LD  4,-5(1)	Pop left into ac1 
266:    MOD  3,4,3	Op % 
267:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
268:    LDA  1,-3(1)	Ghost frame becomes new active frame 
269:    LDA  3,1(7)	Return address in ac 
270:    JMP  7,-265(7)	CALL output
271:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
272:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
273:    LDA  1,-3(1)	Ghost frame becomes new active frame 
274:    LDA  3,1(7)	Return address in ac 
275:    JMP  7,-242(7)	CALL outnl
276:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL outputb
277:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
278:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
279:    LDC  3,111(6)	Load integer constant 
280:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
281:    LDA  1,-5(1)	Ghost frame becomes new active frame 
282:    LDA  3,1(7)	Return address in ac 
283:    JMP  7,-245(7)	CALL ident
284:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
285:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
286:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
287:     LD  4,-5(1)	Pop left into ac1 
288:    ADD  3,4,3	Op + 
289:    NEG  3,3,3	Op unary - 
290:    NEG  3,3,3	Op unary - 
291:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
292:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
293:     LD  4,-5(1)	Pop left into ac1 
294:    MUL  3,4,3	Op * 
295:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
296:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
297:     LD  4,-5(1)	Pop left into ac1 
298:    DIV  3,4,3	Op / 
299:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
300:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
301:     LD  4,-5(1)	Pop left into ac1 
302:    MOD  3,4,3	Op % 
303:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
304:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
305:     LD  4,-5(1)	Pop left into ac1 
306:    ADD  3,4,3	Op + 
307:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
308:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
309:     LD  4,-5(1)	Pop left into ac1 
310:    TLE  3,4,3	Op <= 
311:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
312:    LDA  1,-3(1)	Ghost frame becomes new active frame 
313:    LDA  3,1(7)	Return address in ac 
314:    JMP  7,-298(7)	CALL outputb
315:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outputb
316:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
317:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
318:    LDC  3,111(6)	Load integer constant 
319:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
320:    LDA  1,-5(1)	Ghost frame becomes new active frame 
321:    LDA  3,1(7)	Return address in ac 
322:    JMP  7,-284(7)	CALL ident
323:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
324:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
325:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
326:     LD  4,-5(1)	Pop left into ac1 
327:    ADD  3,4,3	Op + 
328:    NEG  3,3,3	Op unary - 
329:    NEG  3,3,3	Op unary - 
330:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
331:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
332:     LD  4,-5(1)	Pop left into ac1 
333:    MUL  3,4,3	Op * 
334:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
335:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
336:     LD  4,-5(1)	Pop left into ac1 
337:    DIV  3,4,3	Op / 
338:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
339:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
340:     LD  4,-5(1)	Pop left into ac1 
341:    MOD  3,4,3	Op % 
342:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
343:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
344:     LD  4,-5(1)	Pop left into ac1 
345:    ADD  3,4,3	Op + 
346:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
347:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
348:     LD  4,-5(1)	Pop left into ac1 
349:    TGE  3,4,3	Op >= 
350:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
351:    LDA  1,-3(1)	Ghost frame becomes new active frame 
352:    LDA  3,1(7)	Return address in ac 
353:    JMP  7,-337(7)	CALL outputb
354:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
355:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
356:    LDA  1,-3(1)	Ghost frame becomes new active frame 
357:    LDA  3,1(7)	Return address in ac 
358:    JMP  7,-325(7)	CALL outnl
359:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL outputb
360:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
361:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
362:    LDC  3,111(6)	Load integer constant 
363:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
364:    LDA  1,-5(1)	Ghost frame becomes new active frame 
365:    LDA  3,1(7)	Return address in ac 
366:    JMP  7,-328(7)	CALL ident
367:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
368:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
369:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
370:     LD  4,-5(1)	Pop left into ac1 
371:    ADD  3,4,3	Op + 
372:    NEG  3,3,3	Op unary - 
373:    NEG  3,3,3	Op unary - 
374:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
375:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
376:     LD  4,-5(1)	Pop left into ac1 
377:    MUL  3,4,3	Op * 
378:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
379:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
380:     LD  4,-5(1)	Pop left into ac1 
381:    DIV  3,4,3	Op / 
382:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
383:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
384:     LD  4,-5(1)	Pop left into ac1 
385:    MOD  3,4,3	Op % 
386:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
387:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
388:     LD  4,-5(1)	Pop left into ac1 
389:    ADD  3,4,3	Op + 
390:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
391:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
392:     LD  4,-5(1)	Pop left into ac1 
393:    TLE  3,4,3	Op <= 
394:    LDC  4,1(6)	Load 1 
395:    XOR  3,3,4	Op XOR to get logical not 
396:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
397:    LDA  1,-3(1)	Ghost frame becomes new active frame 
398:    LDA  3,1(7)	Return address in ac 
399:    JMP  7,-383(7)	CALL outputb
400:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outputb
401:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
402:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
403:    LDC  3,111(6)	Load integer constant 
404:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
405:    LDA  1,-5(1)	Ghost frame becomes new active frame 
406:    LDA  3,1(7)	Return address in ac 
407:    JMP  7,-369(7)	CALL ident
408:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
409:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
410:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
411:     LD  4,-5(1)	Pop left into ac1 
412:    ADD  3,4,3	Op + 
413:    NEG  3,3,3	Op unary - 
414:    NEG  3,3,3	Op unary - 
415:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
416:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
417:     LD  4,-5(1)	Pop left into ac1 
418:    MUL  3,4,3	Op * 
419:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
420:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
421:     LD  4,-5(1)	Pop left into ac1 
422:    DIV  3,4,3	Op / 
423:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
424:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
425:     LD  4,-5(1)	Pop left into ac1 
426:    MOD  3,4,3	Op % 
427:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
428:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
429:     LD  4,-5(1)	Pop left into ac1 
430:    ADD  3,4,3	Op + 
431:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
432:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
433:     LD  4,-5(1)	Pop left into ac1 
434:    TLE  3,4,3	Op <= 
435:    LDC  4,1(6)	Load 1 
436:    XOR  3,3,4	Op XOR to get logical not 
437:    LDC  4,1(6)	Load 1 
438:    XOR  3,3,4	Op XOR to get logical not 
439:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
440:    LDA  1,-3(1)	Ghost frame becomes new active frame 
441:    LDA  3,1(7)	Return address in ac 
442:    JMP  7,-426(7)	CALL outputb
443:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
444:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
445:    LDA  1,-3(1)	Ghost frame becomes new active frame 
446:    LDA  3,1(7)	Return address in ac 
447:    JMP  7,-414(7)	CALL outnl
448:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL outputb
449:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
450:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
451:    LDC  3,111(6)	Load integer constant 
452:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
453:    LDA  1,-5(1)	Ghost frame becomes new active frame 
454:    LDA  3,1(7)	Return address in ac 
455:    JMP  7,-417(7)	CALL ident
456:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
457:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
458:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
459:     LD  4,-5(1)	Pop left into ac1 
460:    ADD  3,4,3	Op + 
461:    NEG  3,3,3	Op unary - 
462:    NEG  3,3,3	Op unary - 
463:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
464:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
465:     LD  4,-5(1)	Pop left into ac1 
466:    MUL  3,4,3	Op * 
467:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
468:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
469:     LD  4,-5(1)	Pop left into ac1 
470:    DIV  3,4,3	Op / 
471:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
472:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
473:     LD  4,-5(1)	Pop left into ac1 
474:    MOD  3,4,3	Op % 
475:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
476:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
477:     LD  4,-5(1)	Pop left into ac1 
478:    ADD  3,4,3	Op + 
479:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
480:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
481:     LD  4,-5(1)	Pop left into ac1 
482:    TLE  3,4,3	Op <= 
483:    LDC  4,1(6)	Load 1 
484:    XOR  3,3,4	Op XOR to get logical not 
485:    LDC  4,1(6)	Load 1 
486:    XOR  3,3,4	Op XOR to get logical not 
487:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
488:    LDC  3,777(6)	Load integer constant 
489:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
490:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -6
491:     LD  4,-6(1)	Pop left into ac1 
492:    TLT  3,4,3	Op < 
* TOFF inc: -5
493:     LD  4,-5(1)	Pop left into ac1 
494:    AND  3,4,3	Op AND 
495:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
496:    LDA  1,-3(1)	Ghost frame becomes new active frame 
497:    LDA  3,1(7)	Return address in ac 
498:    JMP  7,-482(7)	CALL outputb
499:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outputb
500:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
501:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
502:    LDC  3,111(6)	Load integer constant 
503:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
504:    LDA  1,-5(1)	Ghost frame becomes new active frame 
505:    LDA  3,1(7)	Return address in ac 
506:    JMP  7,-468(7)	CALL ident
507:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
508:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
509:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
510:     LD  4,-5(1)	Pop left into ac1 
511:    ADD  3,4,3	Op + 
512:    NEG  3,3,3	Op unary - 
513:    NEG  3,3,3	Op unary - 
514:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
515:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
516:     LD  4,-5(1)	Pop left into ac1 
517:    MUL  3,4,3	Op * 
518:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
519:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
520:     LD  4,-5(1)	Pop left into ac1 
521:    DIV  3,4,3	Op / 
522:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
523:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
524:     LD  4,-5(1)	Pop left into ac1 
525:    MOD  3,4,3	Op % 
526:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
527:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
528:     LD  4,-5(1)	Pop left into ac1 
529:    ADD  3,4,3	Op + 
530:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
531:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
532:     LD  4,-5(1)	Pop left into ac1 
533:    TLE  3,4,3	Op <= 
534:    LDC  4,1(6)	Load 1 
535:    XOR  3,3,4	Op XOR to get logical not 
536:    LDC  4,1(6)	Load 1 
537:    XOR  3,3,4	Op XOR to get logical not 
538:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
539:    LDC  3,777(6)	Load integer constant 
540:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
541:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -6
542:     LD  4,-6(1)	Pop left into ac1 
543:    TLT  3,4,3	Op < 
* TOFF inc: -5
544:     LD  4,-5(1)	Pop left into ac1 
545:    AND  3,4,3	Op AND 
546:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
547:    LDC  3,999(6)	Load integer constant 
548:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
549:    LDC  3,1000(6)	Load integer constant 
* TOFF inc: -6
550:     LD  4,-6(1)	Pop left into ac1 
551:    TNE  3,4,3	Op != 
* TOFF inc: -5
552:     LD  4,-5(1)	Pop left into ac1 
553:     OR  3,4,3	Op OR 
554:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
555:    LDA  1,-3(1)	Ghost frame becomes new active frame 
556:    LDA  3,1(7)	Return address in ac 
557:    JMP  7,-541(7)	CALL outputb
558:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
559:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
560:    LDA  1,-3(1)	Ghost frame becomes new active frame 
561:    LDA  3,1(7)	Return address in ac 
562:    JMP  7,-529(7)	CALL outnl
563:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL outputb
564:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ident
565:     ST  1,-5(1)	Store fp in ghost frame for ident
* TOFF dec: -6
* TOFF dec: -7
* Param 1
566:    LDC  3,111(6)	Load integer constant 
567:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ident
568:    LDA  1,-5(1)	Ghost frame becomes new active frame 
569:    LDA  3,1(7)	Return address in ac 
570:    JMP  7,-532(7)	CALL ident
571:    LDA  3,0(2)	Save the result in ac 
* Call end ident
* TOFF set: -5
572:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
573:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -5
574:     LD  4,-5(1)	Pop left into ac1 
575:    ADD  3,4,3	Op + 
576:    NEG  3,3,3	Op unary - 
577:    NEG  3,3,3	Op unary - 
578:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
579:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -5
580:     LD  4,-5(1)	Pop left into ac1 
581:    MUL  3,4,3	Op * 
582:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
583:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -5
584:     LD  4,-5(1)	Pop left into ac1 
585:    DIV  3,4,3	Op / 
586:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
587:    LDC  3,42(6)	Load integer constant 
* TOFF inc: -5
588:     LD  4,-5(1)	Pop left into ac1 
589:    MOD  3,4,3	Op % 
590:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
591:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -5
592:     LD  4,-5(1)	Pop left into ac1 
593:    ADD  3,4,3	Op + 
594:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
595:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -5
596:     LD  4,-5(1)	Pop left into ac1 
597:    TLE  3,4,3	Op <= 
598:    LDC  4,1(6)	Load 1 
599:    XOR  3,3,4	Op XOR to get logical not 
600:    LDC  4,1(6)	Load 1 
601:    XOR  3,3,4	Op XOR to get logical not 
602:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
603:    LDC  3,777(6)	Load integer constant 
604:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
605:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -6
606:     LD  4,-6(1)	Pop left into ac1 
607:    TLT  3,4,3	Op < 
* TOFF inc: -5
608:     LD  4,-5(1)	Pop left into ac1 
609:    AND  3,4,3	Op AND 
610:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
611:    LDC  3,999(6)	Load integer constant 
612:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
613:    LDC  3,1000(6)	Load integer constant 
* TOFF inc: -6
614:     LD  4,-6(1)	Pop left into ac1 
615:    TNE  3,4,3	Op != 
* TOFF inc: -5
616:     LD  4,-5(1)	Pop left into ac1 
617:     OR  3,4,3	Op OR 
618:     ST  3,-2(1)	Store variable x
619:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
620:    LDA  1,-3(1)	Ghost frame becomes new active frame 
621:    LDA  3,1(7)	Return address in ac 
622:    JMP  7,-606(7)	CALL outputb
623:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
624:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
625:    LDA  1,-3(1)	Ghost frame becomes new active frame 
626:    LDA  3,1(7)	Return address in ac 
627:    JMP  7,-594(7)	CALL outnl
628:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
629:    LDC  2,0(6)	Set return value to 0 
630:     LD  3,-1(1)	Load return address 
631:     LD  1,0(1)	Adjust fp 
632:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,632(7)	Jump to init [backpatch] 
* INIT
633:    LDA  1,0(0)	set first frame at end of globals 
634:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
635:    LDA  3,1(7)	Return address in ac 
636:    JMP  7,-588(7)	Jump to main 
637:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
