`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2025 10:43:53
// Design Name: 
// Module Name: syn_count_struct_tb
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
module tb_sync_counters;
    reg clk, rst, up;
    wire [3:0] q_up, q_down, q_updown;

    sync_up_counter up_counter(.clk(clk), .rst(rst), .q(q_up));
    sync_down_counter down_counter(.clk(clk), .rst(rst), .q(q_down));
    sync_updown_counter updown_counter(.clk(clk), .rst(rst), .up(up), .q(q_updown));

initial begin 
clk=0;
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
        $monitor("q_up=%4b, q_down=%4b, q_updown=%4b", q_up, q_down, q_updown);
    end
endmodule

