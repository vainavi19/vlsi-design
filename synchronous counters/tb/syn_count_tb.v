`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:03:09
// Design Name: 
// Module Name: syn_count_tb
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


//BEHAVIORAL
module syn_count_tb;

    reg clk, rst;
    reg [1:0] sel;
    wire [3:0] out_up;
    wire [3:0] out_down;
    wire [3:0] out_updown;

    // Instantiate the module under test (MUT)
    syn_count dut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .out_up(out_up),
        .out_down(out_down),
        .out_updown(out_updown)
    );

    // Clock generation: toggle every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $monitor("Time=%0t | clk=%b rst=%b sel=%b | out_up=%b out_down=%b out_updown=%b", 
                 $time, clk, rst, sel, out_up, out_down, out_updown);

        // Reset everything first
        rst = 1;
        sel = 2'b00;   // Hold state for updown counter
        #10;

        rst = 0;       // Release reset

        // Test up counter
        sel = 2'b01;   // Up counting for updown counter
        #40;

        // Test down counter
        sel = 2'b10;   // Down counting for updown counter
        #40;

        // Hold state
        sel = 2'b00;
        #20;

        // Test sel = 2'b11 (up count again)
        sel = 2'b11;
        #20;

        $finish;
    end

endmodule






