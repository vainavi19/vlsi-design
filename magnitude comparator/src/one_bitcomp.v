`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:48:26
// Design Name: 
// Module Name: one_bitcomp
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


module one_bitcomp(
input A,B,
output reg A_gt_B, 
output reg A_lt_B,
output reg A_eq_B  //behavioral\
//output wire A_gt_B, 
//output wire A_lt_B,
//output wire A_eq_B  //dataflow
);

//behavioral
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
assign A_eq_B= (~A & ~B) | (A&B);
assign A_lt_B= (~A & B);
assign A_gt_B= (A & ~B);
*/
endmodule
