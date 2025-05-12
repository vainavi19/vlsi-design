`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:07:18
// Design Name: 
// Module Name: demux_1to4
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


module demux_1to4(
input wire in,
input wire [1:0] sel,
output reg [3:0] out //for behavioral
//output wire [3:0] out //for data flow
);

//behavioral
always @(*) begin
out =4'b0000;
case (sel)
        2'b00: out[0] = in;
        2'b01: out[1] = in;
        2'b10: out[2] = in;
        2'b11: out[3] = in;
        default: out = 4'b0000;
        endcase
end

//data flow
//assign out[sel]=in;

endmodule

