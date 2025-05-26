`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 10:31:11
// Design Name: 
// Module Name: counter
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


module counter(
input clk,rst_counter,
//output reg clk_1hz,
output reg [3:0]out
);

//clock divider 
parameter MAX_COUNT = 49_000_000; // 50 million
reg [26:0] counter;
reg clk_1hz;

reg rst;   
always @(posedge clk) 
   begin
        if (rst) begin
            counter <= 0;
            clk_1hz <= 0;
        end else begin
            if (counter == MAX_COUNT) begin
                clk_1hz <= ~clk_1hz;  // toggle output every 50 million clocks (0.5s)
                counter <= 0;
            end
             else begin
                counter <= counter + 1;
            end
        end
    end

/*
//ring counter logic 
always @ (posedge clk_1hz) begin
if (rst_counter)
 out<=4'b1000;
else if (out == 4'b0001)
 out<=4'b1000;
else 
 out<= {1'b0, out[3:1]};
end
*/

//jhonson counter logic
always @ (posedge clk_1hz) begin
if (rst_counter)
 out<=4'b0000;
else if (out == 4'b1111)
 out<=4'b0000;
else 
 out<= {1'b1, out[3:1]};
end

endmodule

