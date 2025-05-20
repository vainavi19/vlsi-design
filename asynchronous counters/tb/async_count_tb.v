`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 19:28:38
// Design Name: 
// Module Name: async_count_tb
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


// Testbench
module tb_async_counters;
    reg clk, rst, up;
    wire [3:0] q_up, q_down, q_updown;

    async_up_counter up_counter(.clk(clk), .rst(rst), .q(q_up));
    async_down_counter down_counter(.clk(clk), .rst(rst), .q(q_down));
    async_updown_counter updown_counter(.clk(clk), .rst(rst), .up(up), .q(q_updown));

initial begin 
clk = 0;
forever #5 clk=~clk;
end

    initial begin
        rst = 1; up = 1;
        #10 rst = 0;
        #50 up = 0;
        #50 up = 1;
        #50 $finish;
    end

   initial begin
        $monitor("q_up=%4b, q_down=%4b, q_updown=%4b ", q_up, q_down, q_updown);
    end
endmodule
