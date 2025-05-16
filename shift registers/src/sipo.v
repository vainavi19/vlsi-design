`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:52:08
// Design Name: 
// Module Name: sipo
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


module sipo(
input si, clk, rst,  
output [3:0]po,
output reg [3:0]rshift
);



always @ (posedge clk or negedge rst)
begin 
 if(rst)
  rshift <= 4'd0;
 else
  rshift<= { rshift[2:0], si}; //performing left shift of reg contents
end

assign po= rshift;
endmodule