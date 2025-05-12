`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:35:30
// Design Name: 
// Module Name: four_bitcomp
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


module two_bitcomp (
    input wire [1:0] A,
    input wire [1:0] B,
    output reg A_gt_B,
    output reg A_lt_B,
    output reg A_eq_B
);

always @(*) begin
    if (A > B) begin
        A_gt_B = 1;
        A_lt_B = 0;
        A_eq_B = 0;
    end
    else if (A < B) begin
        A_gt_B = 0;
        A_lt_B = 1;
        A_eq_B = 0;
    end
    else begin
        A_gt_B = 0;
        A_lt_B = 0;
        A_eq_B = 1;
    end
end

/*
//data flow
assign A_eq_B = (A[1] ~^ B[1]) & (A[0] ~^ B[0]);
assign A_gt_B = (A[1] & ~B[1]) | ((A[1] ~^ B[1]) & (A[0] & ~B[0]));
assign A_lt_B = (~A[1] & B[1]) | ((A[1] ~^ B[1]) & (~A[0] & B[0]));
*/

endmodule

