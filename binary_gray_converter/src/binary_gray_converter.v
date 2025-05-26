`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 12:25:53
// Design Name: 
// Module Name: code_converter
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


module code_converter(
input [3:0]in,
input rst,
);
reg [3:0] out;

always @(*) begin
//binary to gray
//gray to binary
out[0]= in[0]^in[1];
out[1]= in[1]^in[2];
out[2]= in[2]^in[3];
out[3]= in[3];
end


endmodule
