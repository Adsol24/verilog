module pwm (CLK,RST, CDIR, DUTY, PWM); //pulse width modulator
    input CLK ;       
    input RST ;      
    input CDIR;        
    input [7:0] DUTY;   
    output PWM;         

reg [7:0] count;       
reg PWM_reg;           

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        count <= 3'b0;
        PWM_reg <= 1'b0;
    end else if (CDIR) 
begin
        if (count == 3'b111)
 begin
            count <= 3'b0;
        end else 
begin
            count <= count + 1;
        end
    end else 
begin
        if (count == DUTY) begin
            count <= 3'b0;
            PWM_reg <= ~PWM_reg;
        end else 
begin
            count <= count + 1;
        end
    end
end

assign PWM = PWM_reg;

endmodule

