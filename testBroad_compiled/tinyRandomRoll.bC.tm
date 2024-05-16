* bC compiler version bC-Su23
* File compiled:  tinyRandomRoll.bC
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
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable sum
 42:     ST  3,-2(1)	Store variable i
* WHILE
 43:     LD  3,-2(1)	Load variable i
 44:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 45:    LDC  3,1000(6)	Load integer constant 
* TOFF inc: -4
 46:     LD  4,-4(1)	Pop left into ac1 
 47:    TLT  3,4,3	Op < 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 50:    LDC  3,6(6)	Load integer constant 
 51:    RND  3,3,6	Op ? 
 52:     LD  4,-3(1)	load lhs variable sum
 53:    ADD  3,4,3	op += 
 54:     ST  3,-3(1)	Store variable sum
* EXPRESSION
 55:     LD  3,-2(1)	load lhs variable i
 56:    LDA  3,1(3)	increment value of i
 57:     ST  3,-2(1)	Store variable i
* TOFF set: -4
* END COMPOUND
 58:    JMP  7,-16(7)	go to beginning of loop 
 49:    JMP  7,9(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outputb
 59:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 60:    LDC  3,1(6)	Load Boolean constant 
 61:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 62:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-48(7)	CALL outputb
 65:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
 66:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 67:    LDC  3,2300(6)	Load integer constant 
 68:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 69:     LD  3,-3(1)	Load variable sum
* TOFF inc: -6
 70:     LD  4,-6(1)	Pop left into ac1 
 71:    TLT  3,4,3	Op < 
 72:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 73:     LD  3,-3(1)	Load variable sum
 74:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 75:    LDC  3,2700(6)	Load integer constant 
* TOFF inc: -7
 76:     LD  4,-7(1)	Pop left into ac1 
 77:    TLT  3,4,3	Op < 
* TOFF inc: -6
 78:     LD  4,-6(1)	Pop left into ac1 
 79:    AND  3,4,3	Op AND 
 80:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 81:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-67(7)	CALL outputb
 84:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
 85:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 86:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-55(7)	CALL outnl
 89:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL outputb
 90:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 91:    LDC  3,3(6)	Load integer constant 
 92:    RND  3,3,6	Op ? 
 93:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 94:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
 95:     LD  4,-6(1)	Pop left into ac1 
 96:    TLT  3,4,3	Op < 
 97:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 98:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-84(7)	CALL outputb
101:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
102:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
103:    LDC  3,3(6)	Load integer constant 
104:    RND  3,3,6	Op ? 
105:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
106:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
107:     LD  4,-6(1)	Pop left into ac1 
108:    TLT  3,4,3	Op < 
109:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
110:    LDA  1,-4(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-96(7)	CALL outputb
113:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
114:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
115:    LDC  3,3(6)	Load integer constant 
116:    RND  3,3,6	Op ? 
117:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
118:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
119:     LD  4,-6(1)	Pop left into ac1 
120:    TLT  3,4,3	Op < 
121:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
122:    LDA  1,-4(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-108(7)	CALL outputb
125:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
126:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
127:    LDC  3,3(6)	Load integer constant 
128:    RND  3,3,6	Op ? 
129:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
130:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
131:     LD  4,-6(1)	Pop left into ac1 
132:    TLT  3,4,3	Op < 
133:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
134:    LDA  1,-4(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-120(7)	CALL outputb
137:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
138:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
139:    LDC  3,3(6)	Load integer constant 
140:    RND  3,3,6	Op ? 
141:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
142:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
143:     LD  4,-6(1)	Pop left into ac1 
144:    TLT  3,4,3	Op < 
145:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
146:    LDA  1,-4(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-132(7)	CALL outputb
149:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
150:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
151:    LDC  3,3(6)	Load integer constant 
152:    RND  3,3,6	Op ? 
153:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
154:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
155:     LD  4,-6(1)	Pop left into ac1 
156:    TLT  3,4,3	Op < 
157:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
158:    LDA  1,-4(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-144(7)	CALL outputb
161:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
162:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
163:    LDA  1,-4(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-132(7)	CALL outnl
166:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
167:    LDC  2,0(6)	Set return value to 0 
168:     LD  3,-1(1)	Load return address 
169:     LD  1,0(1)	Adjust fp 
170:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,170(7)	Jump to init [backpatch] 
* INIT
171:    LDA  1,0(0)	set first frame at end of globals 
172:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-136(7)	Jump to main 
175:   HALT  0,0,0	DONE! 
* END INIT
Number of warnings: 0
Number of errors: 0
