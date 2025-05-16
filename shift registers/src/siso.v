`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:48:43
// Design Name: 
// Module Name: siso
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


module siso(
input si, clk, rst,  
output reg so,
output reg [3:0]rshift
);



always @ (posedge clk or negedge rst)
begin 
 if(rst)
  rshift <= 4'd0;
 else
  rshift<= { rshift[2:0], si}; //performing left shift of reg contents
  so <= rshift[3];
end

//assign so = rshift[3];
endmodule
