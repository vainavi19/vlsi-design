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
input in1, in0,
output reg out
//output reg [1:0] cstate, nstate
);

//clock divider 
parameter MAX_COUNT = 49_000_000; // 50 million
reg [26:0] counter;
reg clk_1hz;

//reg rst;    
always @(posedge clk) 
   begin
        if (rst) begin
            counter <= 0;
            clk_1hz <= 0;
        end else begin
            if (counter == MAX_COUNT) begin
                clk_1hz <= ~clk_1hz;  // toggle output every 50 million clocks (0.5s)
                counter <= 0;
            end
             else begin
                counter <= counter + 1;
                
            end
        end
    end
    

//moore machine 
 reg [1:0] cstate, nstate;
//present state - sequential + uses non-blocking assignment 
always @(posedge clk_1hz) begin
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
out=1'b0;
case (cstate)
 2'b00: // S0
 begin
 out= 1'b0; 
 if (in1)  
 nstate=2'b01; 
 else if (in0)
 nstate=2'b00; 
 end
 
 2'b01: // S1
 begin 
 out= 1'b0;
 if (in1)  
 nstate=2'b10; 
 else  if (in0)
 nstate=2'b00; 
 end
 
  2'b10: // S2
 begin 
 out= 1'b0;
 if (in1)  
 nstate=2'b10; 
 else  if (in0)
 nstate=2'b11; 
 end
 
 2'b11: // S3
 begin 
 out= 1'b1;
 if (in1) 
 nstate=2'b01; 
 else if (in0) 
 nstate=2'b00; 
 end
 
endcase
end

endmodule
