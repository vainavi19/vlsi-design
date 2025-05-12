`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 21:59:32
// Design Name: 
// Module Name: mux_16by1
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


module mux_16by1(
    input wire [15:0] in, //in[15] -> MSB
    input wire [3:0] sel,
    //output reg out  //for behavioral
    output wire outf,
    output wire [3:0]out  //for data flow
);
/*
// behavioral 
always @(*) begin
    case (sel)
        4'd0: out = in[0];
        4'd1: out = in[1];
        4'd2: out = in[2];
        4'd3: out = in[3];
        4'd4: out = in[4];
        4'd5: out = in[5];
        4'd6: out = in[6];
        4'd7: out = in[7];
        4'd8: out = in[8];
        4'd9: out = in[9];
        4'd10: out = in[10];
        4'd11: out = in[11];
        4'd12: out = in[12];
        4'd13: out = in[13];
        4'd14: out = in[14];
        4'd15: out = in[15];
        default: out = 1'b0; // Default case to avoid latches
    endcase
end


//data flow
assign out = in[sel];
*/

//structural 

    wire [3:0] out;

    // Four 4-to-1 MUX instances
    mux_4to2 MUX1 (
        .in(in[15:12]),
        .sel(sel[1:0]),
        .out(out[3])
    );

    mux_4to2 MUX2 (
        .in(in[11:8]),
        .sel(sel[1:0]),
        .out(out[2])
    );

    mux_4to2 MUX3 (
        .in(in[7:4]),
        .sel(sel[1:0]),
        .out(out[1])
    );

    mux_4to2 MUX4 (
        .in(in[3:0]),
        .sel(sel[1:0]),
        .out(out[0])
    );

    // Final 4-to-1 MUX instance to select from the intermediate outputs
    mux_4to2 MUXf (
        .in(out),
        .sel(sel[3:2]),
        .out(outf)
    );

endmodule


module mux_4to2 (
input wire [3:0]in,
input wire [1:0] sel,
output wire out
);

assign out = in[sel];

endmodule 

