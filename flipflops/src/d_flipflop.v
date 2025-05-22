`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 09:57:42
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
input d, clk,en,
input rst,
output reg q_bl, q_nbl, q_l,
output wire qb_bl, qb_nbl, qb_l
);
/*
//without reset 
always @ (posedge clk)
 begin
  q<= d;
  qb<= (~d);
 end
*/


// non-blocking assignment
always @ (posedge clk)begin
    if(rst)
        q_nbl <= 0;
    else
        q_nbl <= d; 
end

// blocking assignment
always @ (posedge clk)begin
    if(rst)
        q_bl = 0;
    else
      begin
       if (clk)
          q_bl = d;
       end 
         
end 

// latch 
always @ (d or en or rst) begin
    if(rst)
        q_l = 0;
    else
      begin
       if (en)
          q_l = d; 
       end 
         
end 

assign qb_nbl = ~q_nbl;
assign qb_bl= ~q_bl;
assign qb_l = ~q_l;

endmodule
