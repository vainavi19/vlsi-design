`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2025 10:42:53
// Design Name: 
// Module Name: syn_count_struct
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


//STRUCTURAL 
// 4-bit Synchronous Up Counter
module sync_up_counter(input clk, rst, output [3:0] q);
    wire [3:0] j, k;

    assign j = 1'b1;
    assign k = 1'b1;
    
    assign w1= q[0]&q[1];
    assign w2= w1&q[2];
    
    jk_ff FF0(j, k, clk, rst, q[0]);
    jk_ff FF1(q[0], q[0], clk, rst, q[1]);
    jk_ff FF2(w1, w1, clk, rst, q[2]);
    jk_ff FF3(w2, w2, clk, rst, q[3]);
endmodule

// 4-bit Synchronous Down Counter
module sync_down_counter(input clk, rst, output [3:0] q);
    wire [3:0] j, k;

    assign j = 1'b1;
    assign k = 1'b1;
    assign w1= ~q[0] & ~q[1];
    assign w2= w1 & ~q[2];
    
    jk_ff FF0(j, k, clk, rst, q[0]);
    jk_ff FF1(~q[0], ~q[0], clk, rst, q[1]);
    jk_ff FF2(w1, w1, clk, rst, q[2]);
    jk_ff FF3(w2, w2, clk, rst, q[3]);
endmodule

// 4-bit Synchronous Up-Down Counter
module sync_updown_counter(input clk, rst, up, output [3:0] q);
    wire [3:0] j, k;
    wire tc0, tc1, tc2;

    assign j = 1'b1;
    assign k = 1'b1;

    assign tc0 = (up) ? q[0] : ~q[0];
    assign tc1 = (up) ? q[1] & q[0] : ~q[1] & ~q[0];
    assign tc2 = (up) ? q[2] & q[1] & q[0]  : ~q[2] & ~q[1] & ~q[0] ;

    jk_ff FF0(j, k, clk, rst, q[0]);
    jk_ff FF1(tc0, tc0, clk, rst, q[1]);
    jk_ff FF2(tc1, tc1, clk, rst, q[2]);
    jk_ff FF3(tc2, tc2, clk, rst, q[3]);
endmodule

module jk_ff(
    input j, k, clk, rst,
    output reg q
);
    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;    // No change
                2'b01: q <= 0;    // Reset
                2'b10: q <= 1;    // Set
                2'b11: q <= ~q;   // Toggle
            endcase
        end
    end
endmodule