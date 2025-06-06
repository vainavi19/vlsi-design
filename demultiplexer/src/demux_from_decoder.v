//DEMUX using DECODER
// 1by4 DEMUX module
module demux_1to4 ( 
input in, 
input [1:0] sel,
output reg [3:0] out 
);
    wire [3:0] decoder_out;

decoder_2to4 decoder (
        .in(sel),
        .out(decoder_out)
);

    integer k;
    always @(*) begin
        for (k = 0; k < 4; k = k + 1) begin
            out[k] = decoder_out[k] ? in : 1'b0;
        end
    end
endmodule

// 2by4 Decoder Module
module decoder_2to4 (
    input  [1:0] in,
    output [3:0] out
);
    assign out[0] = (~in[1]) & (~in[0]);
    assign out[1] = (~in[1]) &  in[0];
    assign out[2] =  in[1]  & (~in[0]);
    assign out[3] =  in[1]  &  in[0];
endmodule
