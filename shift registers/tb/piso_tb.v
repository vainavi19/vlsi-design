`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 19:08:49
// Design Name: 
// Module Name: piso_tb
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


module piso_tb;
  reg clk, rst, ld;
  reg [3:0] pi;
  wire [3:0] rshift;
  wire so;

  piso dut(
    .ld(ld), .clk(clk), .rst(rst), .pi(pi), .so(so), .rshift(rshift)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin 
    $display("Time | clk | rst | ld | pi  | rshift | so");
    $monitor("%4t | %0b | %0b  | %0b | %4b | %4b   | %0b", $time, clk, rst, ld, pi, rshift, so);

    // Apply Reset
    rst = 0; ld = 0; #10;
    rst = 1; #10;
    rst = 0; 
    // Load Parallel Data
    pi = 4'b0000;
    ld = 1; #10;
    ld = 0; #20;

    // Load Parallel Data
    pi = 4'b1001;
    ld = 1; #10;
    ld = 0; #20;

    // Another Load
    pi = 4'b1101;
    ld = 1; #10;
    ld = 0; #20;

    $finish;
  end

endmodule
