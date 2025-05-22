`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:45:22
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(
input s,r,clk,rst,
output reg  q_bl, q_nbl
);

//non blocking assignment
always @ (posedge clk)
begin
 if (rst)
  q_nbl <=0;
 else
  begin 
   casex ({s,r})
    2'b 00: q_nbl<= q_nbl;
    2'b 01: q_nbl<= 1'b0;
    2'b 10: q_nbl<= 1'b1;
    2'b 11: q_nbl<= 1'bx;
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
   casex ({s,r})
    2'b 00: q_bl= q_bl;
    2'b 01: q_bl= 1'b0;
    2'b 10: q_bl= 1'b1;
    2'b 11: q_bl= 1'bx;
   endcase
  end
end

endmodule