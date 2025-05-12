`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:53:39
// Design Name: 
// Module Name: two_bitcomp_tb
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


module two_bitcomp_tb;
reg [1:0] A;
reg [1:0] B;
wire A_gt_B;
wire A_lt_B;
wire A_eq_B;

two_bitcomp dut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
);

initial begin
        // Apply test cases
        A = 2'b00; B = 2'b00; #10;
        A = 2'b01; B = 2'b00; #10;
        A = 2'b10; B = 2'b00; #10;
        A = 2'b10; B = 2'b01; #10;
        A = 2'b11; B = 2'b10; #10;
        A = 2'b01; B = 2'b11; #10;
        A = 2'b10; B = 2'b10; #10;
        A = 2'b11; B = 2'b11; #10;

        #10 $finish;
 end

initial begin
        $monitor("Time = %0d | A = %2b | B = %2b | A_gt_B = %b | A_lt_B = %b | A_eq_B = %b", 
                 $time, A, B, A_gt_B, A_lt_B, A_eq_B);
end

endmodule

