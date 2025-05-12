`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2025 23:51:58
// Design Name: 
// Module Name: priority_encoder_4to2
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

// priority -> in0>in1>in2>in3 (in0 is our MSB)
module priority_encoder_4to2(
    input [0:3] in,
    output reg [0:1] e, v  //behavioral
    //output wire [0:1] e,
    //output wire v //for data flow , structural 
 );


//behavioral
always @(*) begin
    casex (in)
        4'b1000: 
        begin e = 2'b00; v=1'b1; end
        4'bx100:  
        begin e = 2'b01; v=1'b1; end
        4'bxx10:  
        begin e = 2'b10; v=1'b1; end
        4'bxxx1:  
        begin e = 2'b11; v=1'b1; end
        default: 
        begin e = 2'bxx; v=1'b0; end // Don't care condition
    endcase
end

/*
//data flow
assign e[0]= (in[2]&(~in[3])) | in[3];
assign e[1]= (in[1]&(~in[2])&(~in[3])) | in[3];
assign v= in[0] | in[1] | in[2] | in[3];




//gate level
//or(e[0], in[2],in[3]);
//or(e[1],in[1],in[3]);
wire w1,w2,w3,w4;
not(w1,in[3]);
and(w2,w1,in[2]);
or(e[0],in[3],w2);

not(w3,in[2]);
and(w4,w1,w3,in[1]);
or(e[1],w4,in[3]);

or(v,in[0],in[1],in[2],in[3]);
*/

endmodule

