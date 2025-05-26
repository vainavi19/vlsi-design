`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 13:56:48
// Design Name: 
// Module Name: decoder_4to2
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


module decoder_4to2(
input [0:1] in,
//output reg [0:3] d //for behavioral
output wire [0:3] d //for data flow
);

/*
//behavioral
always @(*) begin
    case (in)
        2'b00: d = 4'b0001;
        2'b01: d = 4'b0010;
        2'b10: d = 4'b0100;
        2'b11: d = 4'b1000;
        default: d = 4'bxxxx;  // Don't care condition
    endcase
end
*/

//data flow
assign d[0]= (~in[0] & ~in[1]);
assign d[1]= (~in[0] & in[1]);
assign d[2]= (in[0] & ~in[1]);
assign d[3]= (in[0] & in[1]);

/*
//gate level
and (d[0], ~in[0], ~in[1]);
and (d[1], ~in[0], in[1]);
and (d[2], in[0], ~in[1]);
and (d[3], in[0], in[1]);

*/
endmodule
