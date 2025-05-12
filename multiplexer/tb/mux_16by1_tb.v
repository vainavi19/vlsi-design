`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 22:38:47
// Design Name: 
// Module Name: mux_16by1_tb
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


module mux_16by1_tb;
    reg [15:0] in;
    reg [3:0] sel;

    wire out;

    mux_16by1 uut (
        .in(in), 
        .sel(sel), 
        .out(out)
    );

    integer i;

    initial begin
        // Apply test cases
        for (i = 0; i < 16; i = i + 1) begin
            sel = i;
            in = 16'b1100110011001100;
            #5;
        end

        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0d | sel = %4b | in = %b | out = %b", $time, sel, in, out);
    end

endmodule




