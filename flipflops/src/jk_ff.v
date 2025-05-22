`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:38:15
// Design Name: 
// Module Name: jk_ff
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


module jk_ff (
input j,k,clk,rst,
output reg q_bl, q_nbl
);

//non blocking assignment
always @ (posedge clk)
begin
 if (rst)
  q_nbl <=0;
 else
  begin 
   case ({j,k})
    2'b 00: q_nbl<= q_nbl;
    2'b 01: q_nbl<= 1'b0;
    2'b 10: q_nbl<= 1'b1;
    2'b 11: q_nbl<= ~q_nbl;
   endcase
  end
end

//blocking assignment
always @ (posedge clk)
begin
 if (rst)
  q_bl =0;
 else
  begin 
   case ({j,k})
    2'b 00: q_bl= q_bl;
    2'b 01: q_bl= 1'b0;
    2'b 10: q_bl= 1'b1;
    2'b 11: q_bl= ~q_bl;
   endcase
  end
end

endmodule
