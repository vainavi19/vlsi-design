`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:02:30
// Design Name: 
// Module Name: syn_count
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


//BEHAVIORAL MODELLING 
module syn_count(
input clk, rst,
input [1:0]sel, //for up-down counter 
output reg [3:0]out_up, 
output reg [3:0]out_down, 
output reg [3:0]out_updown 
);



//up counter

always @ (posedge clk)
begin
if (rst)
out_up<=4'b0000; //out <= 4'b0000;
else
out_up <= out_up+1;
end


//down counter
always @ (posedge clk)
begin
if (rst)
out_down <=4'b1111;
else
out_down <= out_down-1;
end


// Up-Down Counter 
always @ (posedge clk) begin
    if (rst) 
        out_updown <= 4'b0000;
// to implement up count frst, out <= 0000
// to implement down count first, out <= 1111
    else begin
        case (sel)
            2'b00: out_updown <= out_updown; // retain prevoius state 
            2'b01: out_updown <= out_updown + 1;  // Up counter
            2'b10: out_updown <= out_updown - 1;  // Down counter
            2'b11: out_updown <= out_updown + 1; // up count only 
        endcase 
    end
end
endmodule










