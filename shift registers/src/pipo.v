`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:57:44
// Design Name: 
// Module Name: pipo
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


module pipo(
input [3:0]pi, 
input clk, rst,  
output reg [3:0]po
);



always @ (posedge clk or negedge rst)
begin 
 if(rst)
  po <= 4'd0;
 else
  po<= pi; //parellel load of ouput 
end

endmodule
