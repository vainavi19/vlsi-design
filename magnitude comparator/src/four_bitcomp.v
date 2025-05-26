`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 13:23:24
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
    input wire [3:0] A,
    input wire [3:0] B,
    //output reg A_gt_B, A_lt_B, A_eq_B //for behavioral
    output wire A_gt_B, A_lt_B, A_eq_B //for data flow 
);
/*
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
*/

//data flow
assign A_eq_B = (A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & (A[0] ~^ B[0]);
assign A_gt_B = (A[3] & ~B[3]) |(A[3] ~^ B[3]) & (A[2] & ~B[2]) | (A[3] ~^ B[3]) & ((A[2] ~^ B[2]) & (A[1] & ~B[1]) | (A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & (A[0] & ~B[0]));
assign A_lt_B = (~A[3] & B[3]) |(~A[3] ~^ B[3]) & (~A[2] & B[2]) |(A[3] ~^ B[3]) & ((A[2] ~^ B[2]) & (~A[1] & B[1]) |(A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & (~A[0] & B[0]));

endmodule
