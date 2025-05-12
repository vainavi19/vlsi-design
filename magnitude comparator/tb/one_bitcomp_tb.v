`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:55:22
// Design Name: 
// Module Name: one_bitcomp_tb
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


module one_bitcomp_tb;
reg A,B;
wire A_gt_B;
wire A_lt_B;
wire A_eq_B;

one_bitcomp dut(
.A(A),
.B(B),
.A_gt_B(A_gt_B),
.A_lt_B(A_lt_B),
.A_eq_B(A_eq_B)
);


integer k;
initial begin
for (k=0;k<4;k=k+1)
 begin
 {A,B}=k;
 #5;
 end
end


initial begin 
 $monitor("Time = %0d | A = %b| B = %b| A_gt_B = %b | A_lt_B = %b | A_eq_B = %b", 
                 $time, A,B , A_gt_B, A_lt_B, A_eq_B);
end

endmodule
