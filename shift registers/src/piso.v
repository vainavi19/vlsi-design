`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 19:04:32
// Design Name: 
// Module Name: piso
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


module piso(
input [3:0]pi, 
input clk, rst, ld,  
output reg so,
output reg [3:0]rshift
);



always @ (posedge clk or negedge rst)
begin 
 if(rst)
  rshift <= 4'd0;
 else if (ld)
  rshift <= pi; //parellel load of ouput 
 else 
  begin 
  rshift <= {rshift[2:0], 1'b0};
  so <= rshift[3];
  end
end



endmodule
