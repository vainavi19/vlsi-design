module r_cmpl_tb;
reg [3:0]b;
wire [3:0]out;

r_cmpl dut(
.b(b), .out(out)
);

initial begin 
$monitor("b=%4b,out=%4b",b,out);


b=1011; 
#10;  
b=0111;
end 
endmodule
