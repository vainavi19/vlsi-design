`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:10:10
// Design Name: 
// Module Name: clk_div
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


/*
module clk_div2(
    input clk, rst, 
    output reg clko
);

always @ (posedge clk) begin 
    if (rst)
        clko <= 1'b0;
    else 
        clko <= ~clko;
end

endmodule
*/


//**********************************************************
module clk_div4(
    input clk, rst,
    output reg clko
);

reg [1:0] counter;

always @(posedge clk) begin
    if (rst) begin
        counter <= 2'b00;
        clko <= 1'b0;
    end 
    else begin
        counter <= counter + 1'b1;
        
        // Toggle clko on every complete count of 4 cycles
        if (counter == 2'b11)
            clko <= ~clko;
    end
end

endmodule
