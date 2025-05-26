`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 19:17:06
// Design Name: 
// Module Name: decoder_8to3
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

//USING TWO 2-TO-4 DECODERS
module decoder_8to3(
input wire [2:0] in,  // 3-bit input
output wire [7:0] d   // 8-bit output
);

/*
//behavioral
always @(*) begin
    case (in)
        3'b000: d = 8'b10000000;
        3'b001: d = 8'b01000000;
        3'b010: d = 8'b00100000;
        3'b011: d = 8'b00010000;
        3'b100: d = 8'b00001000;
        3'b101: d = 8'b00000100;
        3'b110: d = 8'b00000010;
        3'b111: d = 8'b00000001;
        default: d = 8'bxxxxxxxx;  // Don't care condition
    endcase
end
*/
// Data flow implementation
wire eu, ed;

assign eu = ~in[2];  // Enable for upper 4 bits
assign ed = in[2];   // Enable for lower 4 bits

// First 2-to-4 decoder for upper 4 bits
dec_2to4 up (
.in0(in[1]),
.in1(in[0]),
.enable(eu),
.d(d[3:0])  // Assign to upper 4 bits
);  

// Second 2-to-4 decoder for lower 4 bits
dec_2to4 down (
.in0(in[1]),
.in1(in[0]),
.enable(ed),
.d(d[7:4])  // Assign to lower 4 bits
);  

endmodule


//*************************

module dec_2to4(
input wire in0, in1,
input wire enable,
output wire [3:0] d
);

// Data flow implementation
assign d[0] = enable & (~in0 & ~in1);
assign d[1] = enable & (~in0 & in1);
assign d[2] = enable & (in0 & ~in1);
assign d[3] = enable & (in0 & in1);

endmodule
