`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:13:00
// Design Name: 
// Module Name: bidirec
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


module bidirec(
input clk, rst, 
input [3:0] in, 
input [1:0]sel,
output reg [3:0]out
);

always @ (posedge clk)
begin 
 if (rst)
 out <=0;
 else
 begin
  case (sel)
  2'b00: out <= out; //no chnage
  2'b01: out <= {out[2:0], 1'b0}; //left shift
  2'b10: out <= {1'b0, out[3:1]}; //right shift
  2'b11: out <= in; //parallel load
  default out<= 4'bxxxx;
  endcase
 end
end

endmodule
