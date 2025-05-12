`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 19:49:00
// Design Name: 
// Module Name: decoder_8to3_tb
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


module decoder_8to3_tb;

reg [2:0] in;
wire [7:0] d;

// Instantiate the DUT
decoder_8to3 dut (
  .in(in),
  .d(d)
);

integer k;
initial begin
  $display("in  |   d");
  $display("-----------------");
  for (k = 0; k < 8; k = k + 1) begin
    in = k; #5;
    $display("%b | %b", in, d);
  end
end

endmodule
