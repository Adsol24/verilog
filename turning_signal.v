module turning_signal(CLOCK,RESET,L,R,H,Lights);
input CLOCK,RESET,L,R,H;
output [1:6] Lights;
reg [1:6] Lights;
parameter Idle = 6'b000000,
L3 = 6'b111000, 
L2 = 6'b110000,
L1 = 6'b100000,
R1 = 6'b000001,
R2 = 6'b000011,
R3 = 6'b000111,
LR3 = 6'b111111;
always @ (posedge CLOCK) 
if (RESET) Lights <= Idle; 
else
case (Lights)
Idle: if (H || (L && R)) Lights <= LR3;
else if (L) Lights <= L1;
else if (R) Lights <= R1;
else Lights <=Idle;
L1: 
if (H) Lights <= LR3; 
else Lights <= L2;
L2: 
if (H) Lights <= LR3; 
else Lights <= L3;
L3: 
Lights <= Idle;
R1: 
if (H) Lights <= LR3;
else Lights <= R2;
R2: 
if (H) Lights <= LR3; 
else Lights <= R3;
R3: Lights <= Idle;
LR3: Lights <= Idle;
default:;
endcase

endmodule
