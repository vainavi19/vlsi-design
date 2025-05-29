`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 14:54:45
// Design Name: 
// Module Name: seq_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// "110" - overlapping sequence detector 
module seq_detector(
input clk, rst,
input in,
output reg out_mo, out_me,
output reg [1:0] cstate, nstate, cstate1, nstate1
);

//moore machine 
 //reg [1:0] cstate, nstate;
//present state - sequential + uses non-blocking assignment 
always @(posedge clk) begin
if (rst) begin
cstate<= 2'b00;
end 
else 
cstate<= nstate;
end

//next state - combinational + uses blocking assignment 
always @(*) 
begin
nstate=2'b00;
out_mo=1'b0;
case (cstate)
 2'b00: // S0
 begin
 out_mo= 1'b0; 
 if (in)  
 nstate=2'b01; 
 else
 nstate=2'b00; 
 end
 
 2'b01: // S1
 begin 
 out_mo= 1'b0;
 if (in)  
 nstate=2'b10; 
 else
 nstate=2'b00; 
 end
 
  2'b10: // S2
 begin 
 out_mo= 1'b0;
 if (in)  
 nstate=2'b10; 
 else  
 nstate=2'b11; 
 end
 
 2'b11: // S3
 begin 
 out_mo= 1'b1;
 if (in) 
 nstate=2'b01; 
 else
 nstate=2'b00; 
 end
 
endcase
end



//mealy machine
always @(posedge clk) begin
if (rst) begin
cstate1<= 2'b00;
end 
else 
cstate1<= nstate1;
end

always @(*) 
begin
nstate1=2'b00;
out_me=1'b0;

case (cstate1)
 2'b00: // S0
 begin
 out_me= 1'b0; 
 if (in)  
 nstate1=2'b01; 
 else
 nstate1=2'b00; 
 end
 
 2'b01: // S1
 begin 
 out_me= 1'b0;
 if (in)  
 nstate1=2'b10; 
 else 
 nstate1=2'b00; 
 end
 
  2'b10: // S2
 begin 
 if (in)  begin 
 nstate1=2'b10; 
 out_me=1'b0;
 end 
 else begin 
 nstate1=2'b00; 
 out_me=1'b1;
 end
 end 
endcase

end

endmodule
