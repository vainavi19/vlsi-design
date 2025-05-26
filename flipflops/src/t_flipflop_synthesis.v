`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 17:56:07
// Design Name: 
// Module Name: t_flipflop
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

module t_ff(
input t,clk,rst_ff,
output reg q,
output wire qB
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

//non blocking assignments
always @ (posedge clk_1hz)
 begin
   if (rst_ff)
     q <=0; 
   else 
 begin
    if (t)
      q<= ~q;
    else 
      q <= q;
   end
end
assign qB=~q;
endmodule 
