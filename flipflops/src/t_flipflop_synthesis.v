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

/*
//for simulation
module t_ff(
input t,clk,rst,en,
output reg q_nbl, q_bl, ql,
output wire qB_nbl, qB_bl, qBl
);

//non blocking assignments
always @ (posedge clk)
 begin
   if (rst)
     q_nbl <=0; 
   else 
 begin
    if (t)
      q_nbl <= ~q_nbl;
    else 
      q_nbl <= q_nbl;
   end
end


//blocking
always @ (posedge clk) // for a latch, ouput must change when any of the input changes BUT the changes are in sync with the clock.
begin 
   if (rst)
     q_bl =0; 
   else 
     begin
    if (t)
      q_bl = ~q_bl;
    else 
      q_bl = q_bl;
     end
 end

// LATCH
// Blocking assignments (Latch implementation)
always @ (t or en or rst) // Include `t` in the sensitivity list
begin
  if (rst)
    ql = 0; 
  else if (en) // latch responds when en is high, else retains previous state
  begin
    if (t)
      ql = ~ql;
  end
end
assign qB_nbl=~q_nbl;
assign qB_bl=~q_bl;
assign qBl=~ql;
endmodule
*/


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
