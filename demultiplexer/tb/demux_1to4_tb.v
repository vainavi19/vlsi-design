`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 23:19:47
// Design Name: 
// Module Name: demux_1to4_tb
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


`timescale 1ns / 1ps

module demux_1to4_tb;
reg in;
reg [1:0] sel;
wire [3:0] out;

demux_1to4 uut (
        .in(in),
        .sel(sel),
        .out(out)
);


    initial begin
        // Apply test cases
        in = 1'b1;

        // Test each selection line
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Test with input = 0
        in = 1'b0;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Finish simulation
        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0d | in = %b | sel = %2b | out = %4b", $time, in, sel, out);
    end

endmodule
