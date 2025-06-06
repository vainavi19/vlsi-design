//DECODER using DEMUX
// 4to2 DECODER module 
module decoder_4to2(
input [0:1] in,
output [0:3] d 
);

demux_1to4 DEMUX(
.in(1'b1),
.sel(in),
.out(d)
);

endmodule 


// 1by4 DEMUX module 
module demux_1to4(
input wire in,
input wire [1:0] sel,
output reg [3:0] out 
);
always @(*) begin
out =4'b0000;
case (sel)
        2'b00: out[0] = in;
        2'b01: out[1] = in;
        2'b10: out[2] = in;
        2'b11: out[3] = in;
        default: out = 4'b0000;
        endcase
end

endmodule
