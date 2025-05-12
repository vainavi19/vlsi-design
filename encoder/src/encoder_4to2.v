`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2025 18:56:30
// Design Name: 
// Module Name: encoder_4to2
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


module encoder_4to2 (
    input [0:3] in,
    //output reg [0:1] e //for behavioral
    output wire [0:1] e //for data flow
);

/*
//behavioral
always @(*) begin
    case (in)
        4'b0001: e = 2'b00;
        4'b0010: e = 2'b01;
        4'b0100: e = 2'b10;
        4'b1000: e = 2'b11;
        default: e = 2'bxx;  // Don't care condition
    endcase
end


//data flow
//assign e[0]= in[2] | in[3];
//assign e[1]= in[1] | in[3];

assign e[0]=((~in[0])&(~in[1])&in[2]&(~in[3])) | ((~in[0])&(~in[1])&(~in[2])&in[3]);
assign e[1]=((~in[0])&in[1]&(~in[2])&(~in[3])) | ((~in[0])&(~in[1])&(~in[2])&in[3]);
*/

//gate level
//or(e[0], in[2],in[3]);
//or(e[1],in[1],in[3]);
wire w1,w2,w3;
and IN1(w1,~in[0],in[1],~in[2],~in[3]);  //in[1] -> 0100 
and IN2(w2,~in[0],~in[1],in[2],~in[3]);  //in[2] -> 0010
and IN3(w3,~in[0],~in[1],~in[2],in[3]);  //in[3] -> 0001
or EO (e[0],w2,w3);
or E1 (e[1],w1,w3);

endmodule
