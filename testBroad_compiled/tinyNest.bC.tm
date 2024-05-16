* bC compiler version bC-Su23
* File compiled:  tinyNest.bC
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
* FUNCTION agamemnon
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,666(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,666(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable b
* EXPRESSION
 44:    LDC  3,666(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable x
* EXPRESSION
 46:    LDC  3,666(6)	Load integer constant 
 47:     ST  3,-2(0)	Store variable z
* EXPRESSION
* CALL output
 48:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 49:     LD  3,-2(1)	Load variable a
 50:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 51:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 55:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 56:     LD  3,-3(1)	Load variable b
 57:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 58:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 62:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 63:     LD  3,-4(1)	Load variable x
 64:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 65:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 69:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 70:     LD  3,-1(0)	Load variable y
 71:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 72:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 76:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 77:     LD  3,-2(0)	Load variable z
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
* CALL outnl
 83:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
 84:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-53(7)	CALL outnl
 87:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
 88:    LDC  3,1(6)	Load integer constant 
 89:     ST  3,-2(1)	Store variable a
* EXPRESSION
 90:    LDC  3,2(6)	Load integer constant 
 91:     ST  3,-3(1)	Store variable b
* EXPRESSION
 92:    LDC  3,3(6)	Load integer constant 
 93:     ST  3,-4(1)	Store variable x
* EXPRESSION
 94:    LDC  3,4(6)	Load integer constant 
 95:     ST  3,-1(0)	Store variable y
* EXPRESSION
 96:    LDC  3,5(6)	Load integer constant 
 97:     ST  3,-2(0)	Store variable z
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 98:    LDC  2,0(6)	Set return value to 0 
 99:     LD  3,-1(1)	Load return address 
100:     LD  1,0(1)	Adjust fp 
101:    JMP  7,0(3)	Return 
* END FUNCTION agamemnon
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
102:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
103:    LDC  3,6(6)	Load integer constant 
104:     ST  3,-2(1)	Store variable a
* EXPRESSION
105:    LDC  3,7(6)	Load integer constant 
106:     ST  3,-3(1)	Store variable b
* EXPRESSION
107:    LDC  3,8(6)	Load integer constant 
108:     ST  3,0(0)	Store variable x
* EXPRESSION
109:    LDC  3,9(6)	Load integer constant 
110:     ST  3,-1(0)	Store variable y
* EXPRESSION
111:    LDC  3,10(6)	Load integer constant 
112:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
113:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
114:     LD  3,-2(1)	Load variable a
115:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
116:    LDA  1,-5(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
120:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
121:     LD  3,-3(1)	Load variable b
122:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
123:    LDA  1,-5(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
127:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
128:     LD  3,0(0)	Load variable x
129:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
130:    LDA  1,-5(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
134:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
135:     LD  3,-1(0)	Load variable y
136:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
137:    LDA  1,-5(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
141:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
142:     LD  3,-4(1)	Load variable z
143:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
144:    LDA  1,-5(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
148:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
149:    LDA  1,-5(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-118(7)	CALL outnl
152:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
153:    LDC  3,666(6)	Load integer constant 
154:     ST  3,-5(1)	Store variable a
* EXPRESSION
155:    LDC  3,666(6)	Load integer constant 
156:     ST  3,-6(1)	Store variable b
* EXPRESSION
157:    LDC  3,666(6)	Load integer constant 
158:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
159:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
160:     LD  3,-5(1)	Load variable a
161:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
162:    LDA  1,-8(1)	Ghost frame becomes new active frame 
163:    LDA  3,1(7)	Return address in ac 
164:    JMP  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
166:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
167:     LD  3,-6(1)	Load variable b
168:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
169:    LDA  1,-8(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-166(7)	CALL output
172:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
173:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
174:     LD  3,0(0)	Load variable x
175:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
176:    LDA  1,-8(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
180:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
181:     LD  3,-1(0)	Load variable y
182:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
183:    LDA  1,-8(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
187:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
188:     LD  3,-7(1)	Load variable z
189:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
190:    LDA  1,-8(1)	Ghost frame becomes new active frame 
191:    LDA  3,1(7)	Return address in ac 
192:    JMP  7,-187(7)	CALL output
193:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
194:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
195:    LDA  1,-8(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-164(7)	CALL outnl
198:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
199:    LDC  3,11(6)	Load integer constant 
200:     ST  3,-5(1)	Store variable a
* EXPRESSION
201:    LDC  3,12(6)	Load integer constant 
202:     ST  3,-6(1)	Store variable b
* EXPRESSION
203:    LDC  3,13(6)	Load integer constant 
204:     ST  3,0(0)	Store variable x
* EXPRESSION
205:    LDC  3,14(6)	Load integer constant 
206:     ST  3,-1(0)	Store variable y
* EXPRESSION
207:    LDC  3,15(6)	Load integer constant 
208:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
209:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
210:     LD  3,-5(1)	Load variable a
211:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
212:    LDA  1,-8(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-209(7)	CALL output
215:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
216:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
217:     LD  3,-6(1)	Load variable b
218:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
219:    LDA  1,-8(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-216(7)	CALL output
222:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
223:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
224:     LD  3,0(0)	Load variable x
225:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
226:    LDA  1,-8(1)	Ghost frame becomes new active frame 
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-223(7)	CALL output
229:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
230:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
231:     LD  3,-1(0)	Load variable y
232:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
233:    LDA  1,-8(1)	Ghost frame becomes new active frame 
234:    LDA  3,1(7)	Return address in ac 
235:    JMP  7,-230(7)	CALL output
236:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
237:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
238:     LD  3,-7(1)	Load variable z
239:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
240:    LDA  1,-8(1)	Ghost frame becomes new active frame 
241:    LDA  3,1(7)	Return address in ac 
242:    JMP  7,-237(7)	CALL output
243:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
244:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
245:    LDA  1,-8(1)	Ghost frame becomes new active frame 
246:    LDA  3,1(7)	Return address in ac 
247:    JMP  7,-214(7)	CALL outnl
248:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL output
249:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
250:     LD  3,-5(1)	Load variable a
251:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
252:    LDA  1,-8(1)	Ghost frame becomes new active frame 
253:    LDA  3,1(7)	Return address in ac 
254:    JMP  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
256:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
257:     LD  3,-6(1)	Load variable b
258:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
259:    LDA  1,-8(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-256(7)	CALL output
262:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
263:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
264:     LD  3,0(0)	Load variable x
265:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
266:    LDA  1,-8(1)	Ghost frame becomes new active frame 
267:    LDA  3,1(7)	Return address in ac 
268:    JMP  7,-263(7)	CALL output
269:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
270:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
271:     LD  3,-1(0)	Load variable y
272:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
273:    LDA  1,-8(1)	Ghost frame becomes new active frame 
274:    LDA  3,1(7)	Return address in ac 
275:    JMP  7,-270(7)	CALL output
276:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
277:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
278:     LD  3,-7(1)	Load variable z
279:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
280:    LDA  1,-8(1)	Ghost frame becomes new active frame 
281:    LDA  3,1(7)	Return address in ac 
282:    JMP  7,-277(7)	CALL output
283:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
284:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
285:    LDA  1,-8(1)	Ghost frame becomes new active frame 
286:    LDA  3,1(7)	Return address in ac 
287:    JMP  7,-254(7)	CALL outnl
288:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
289:    LDC  3,16(6)	Load integer constant 
290:     ST  3,-5(1)	Store variable a
* EXPRESSION
291:    LDC  3,17(6)	Load integer constant 
292:     ST  3,-6(1)	Store variable b
* EXPRESSION
293:    LDC  3,18(6)	Load integer constant 
294:     ST  3,0(0)	Store variable x
* EXPRESSION
295:    LDC  3,19(6)	Load integer constant 
296:     ST  3,-1(0)	Store variable y
* EXPRESSION
297:    LDC  3,20(6)	Load integer constant 
298:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
299:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
300:     LD  3,-5(1)	Load variable a
301:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
302:    LDA  1,-8(1)	Ghost frame becomes new active frame 
303:    LDA  3,1(7)	Return address in ac 
304:    JMP  7,-299(7)	CALL output
305:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
306:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
307:     LD  3,-6(1)	Load variable b
308:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
309:    LDA  1,-8(1)	Ghost frame becomes new active frame 
310:    LDA  3,1(7)	Return address in ac 
311:    JMP  7,-306(7)	CALL output
312:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
313:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
314:     LD  3,0(0)	Load variable x
315:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
316:    LDA  1,-8(1)	Ghost frame becomes new active frame 
317:    LDA  3,1(7)	Return address in ac 
318:    JMP  7,-313(7)	CALL output
319:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
320:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
321:     LD  3,-1(0)	Load variable y
322:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
323:    LDA  1,-8(1)	Ghost frame becomes new active frame 
324:    LDA  3,1(7)	Return address in ac 
325:    JMP  7,-320(7)	CALL output
326:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
327:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
328:     LD  3,-7(1)	Load variable z
329:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
330:    LDA  1,-8(1)	Ghost frame becomes new active frame 
331:    LDA  3,1(7)	Return address in ac 
332:    JMP  7,-327(7)	CALL output
333:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
334:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
335:    LDA  1,-8(1)	Ghost frame becomes new active frame 
336:    LDA  3,1(7)	Return address in ac 
337:    JMP  7,-304(7)	CALL outnl
338:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
* EXPRESSION
* CALL output
339:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
340:     LD  3,-5(1)	Load variable a
341:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
342:    LDA  1,-8(1)	Ghost frame becomes new active frame 
343:    LDA  3,1(7)	Return address in ac 
344:    JMP  7,-339(7)	CALL output
345:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
346:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
347:     LD  3,-6(1)	Load variable b
348:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
349:    LDA  1,-8(1)	Ghost frame becomes new active frame 
350:    LDA  3,1(7)	Return address in ac 
351:    JMP  7,-346(7)	CALL output
352:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
353:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
354:     LD  3,0(0)	Load variable x
355:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
356:    LDA  1,-8(1)	Ghost frame becomes new active frame 
357:    LDA  3,1(7)	Return address in ac 
358:    JMP  7,-353(7)	CALL output
359:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
360:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
361:     LD  3,-1(0)	Load variable y
362:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
363:    LDA  1,-8(1)	Ghost frame becomes new active frame 
364:    LDA  3,1(7)	Return address in ac 
365:    JMP  7,-360(7)	CALL output
366:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
367:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
368:     LD  3,-7(1)	Load variable z
369:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
370:    LDA  1,-8(1)	Ghost frame becomes new active frame 
371:    LDA  3,1(7)	Return address in ac 
372:    JMP  7,-367(7)	CALL output
373:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
374:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
375:    LDA  1,-8(1)	Ghost frame becomes new active frame 
376:    LDA  3,1(7)	Return address in ac 
377:    JMP  7,-344(7)	CALL outnl
378:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
* CALL agamemnon
379:     ST  1,-8(1)	Store fp in ghost frame for agamemnon
* TOFF dec: -9
* TOFF dec: -10
* Param end agamemnon
380:    LDA  1,-8(1)	Ghost frame becomes new active frame 
381:    LDA  3,1(7)	Return address in ac 
382:    JMP  7,-344(7)	CALL agamemnon
383:    LDA  3,0(2)	Save the result in ac 
* Call end agamemnon
* TOFF set: -8
* EXPRESSION
* CALL output
384:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
385:     LD  3,-5(1)	Load variable a
386:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
387:    LDA  1,-8(1)	Ghost frame becomes new active frame 
388:    LDA  3,1(7)	Return address in ac 
389:    JMP  7,-384(7)	CALL output
390:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
391:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
392:     LD  3,-6(1)	Load variable b
393:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
394:    LDA  1,-8(1)	Ghost frame becomes new active frame 
395:    LDA  3,1(7)	Return address in ac 
396:    JMP  7,-391(7)	CALL output
397:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
398:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
399:     LD  3,0(0)	Load variable x
400:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
401:    LDA  1,-8(1)	Ghost frame becomes new active frame 
402:    LDA  3,1(7)	Return address in ac 
403:    JMP  7,-398(7)	CALL output
404:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
405:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
406:     LD  3,-1(0)	Load variable y
407:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
408:    LDA  1,-8(1)	Ghost frame becomes new active frame 
409:    LDA  3,1(7)	Return address in ac 
410:    JMP  7,-405(7)	CALL output
411:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
412:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
413:     LD  3,-7(1)	Load variable z
414:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
415:    LDA  1,-8(1)	Ghost frame becomes new active frame 
416:    LDA  3,1(7)	Return address in ac 
417:    JMP  7,-412(7)	CALL output
418:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
419:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
420:    LDA  1,-8(1)	Ghost frame becomes new active frame 
421:    LDA  3,1(7)	Return address in ac 
422:    JMP  7,-389(7)	CALL outnl
423:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -5
* END COMPOUND
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
424:    LDC  2,0(6)	Set return value to 0 
425:     LD  3,-1(1)	Load return address 
426:     LD  1,0(1)	Adjust fp 
427:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,427(7)	Jump to init [backpatch] 
* INIT
428:    LDA  1,-3(0)	set first frame at end of globals 
429:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
430:    LDA  3,1(7)	Return address in ac 
431:    JMP  7,-330(7)	Jump to main 
432:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
