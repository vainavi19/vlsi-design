`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 18:30:44
// Design Name: 
// Module Name: async_count_struct
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


// 4-bit Asynchronous Up Counter
module async_up_counter(input clk, rst, output [3:0] q);
    wire [3:0] j, k;

    assign j = 4'b1111;
    assign k = 4'b1111;

    jk_ff_async FF0(j[0], k[0], clk, rst, q[0]);
    jk_ff_async FF1(j[1], k[1], ~q[0], rst, q[1]);
    jk_ff_async FF2(j[2], k[2], ~q[1], rst, q[2]);
    jk_ff_async FF3(j[3], k[3], ~q[2], rst, q[3]);
endmodule

// 4-bit Asynchronous Down Counter
module async_down_counter(input clk, rst, output [3:0] q);
    wire [3:0] j, k;

    assign j = 4'b1111;
    assign k = 4'b1111;

    jk_ff_async FF0(j[0], k[0], clk, rst, q[0]);
    jk_ff_async FF1(j[1], k[1], q[0], rst, q[1]);
    jk_ff_async FF2(j[2], k[2], q[1], rst, q[2]);
    jk_ff_async FF3(j[3], k[3], q[2], rst, q[3]);
endmodule

// 4-bit Asynchronous Up-Down Counter
module async_updown_counter(input clk, rst, up, output [3:0] q);
    wire [3:0] j, k;
    wire tc0, tc1, tc2;

    assign j = 4'b1111;
    assign k = 4'b1111;
    assign tc0 = (up) ? ~q[0] : q[0];
     assign tc1 = (up) ? ~q[1] : q[1];
      assign tc2 = (up) ? ~q[2] : q[2];


    jk_ff_async FF0(j[0], k[0], clk, rst, q[0]);
    jk_ff_async FF1(j[1], k[1], tc0, rst, q[1]);
    jk_ff_async FF2(j[2], k[2], tc1, rst, q[2]);
    jk_ff_async FF3(j[3], k[3], tc2, rst, q[3]);
endmodule



module jk_ff_async(
    input j, k, clk, rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
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


module d_ff_sync(
    input d, clk, rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule