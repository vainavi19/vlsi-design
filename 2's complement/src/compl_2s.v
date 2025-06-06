module r_cmpl(
input  [3:0]b, //a- minuend, b-subtrahend
//output reg [3:0]out //for behavioral 
output [3:0]out //for gate level 
);
wire [3:0]temp;
integer i;
/*
//behavioral 
always @ (*) begin 
 for (i=0;i<4;i=i+1) begin  //r's complement of subtrahend 
 if(i==0) 
  out[i]= ~b[i]+1'b1;
 else  
  out[i]= ~b[i];
 end
end 
*/

//gate level 
not(temp[0],b[0]);
not(temp[1],b[1]);
not(temp[2],b[2]);
not(temp[3],b[3]);

assign out = temp+ 1'b1;

endmodule
