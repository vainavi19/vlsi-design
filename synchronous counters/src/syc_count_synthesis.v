`timescale 10ns / 1ns
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
input clk, 
//input rst,
//output reg [3:0]out_up
input rst_counter,
//input load,                // up ocunter - to load a particular number to count from
input [1:0]sel,             //for up-down counter       
//output reg clk_1hz
output reg a,b,c,d,e,f,g,
output [3:0] an 
);
//output reg [3:0]out_up,
//output reg [3:0]out_down, 

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
    

/*
//up counter
//reg [3:0]out_up;
always @ (posedge clk_1hz) begin
 if (rst)
 out_up<= 4'b0000;
 else if (out_up== 4'b1001) 
 out_up<= 4'b0000;
 else 
 out_up <= out_up+1'b1; 
end



//up counter with external limits 
//always counts from 0001 to 1000
//when rst=1, sequence restarts
reg [3:0]out_up;
always @ (posedge clk_1hz) begin
 if (rst_counter)
 out_up<= 4'b0001; 
 else if(out_up== 4'b100) 
 out_up<= 4'b0001;
 else 
 out_up <= out_up+1'b1; 
end
*/
/*
//MOD-6 up counter
//reg [3:0]out_up;
always @ (posedge clk_1hz) begin
 if (rst)
 out_up<= 4'b0000;
 else if(out_up== 4'b0110) //count restarts 
 out_up<= 4'b0000;
 else 
 out_up <= out_up+1'b1; 
end
*/
    
// Up-Down Counter 
reg [3:0]out_updown;
always @ (posedge clk_1hz) begin
if (rst_counter)  
        out_updown <= 4'b0000;
//else if(rst==1)
//out_updown <= 4'b0000; -> this logic doesnt work as when rst=1, clk_1hz is forced to low, so there is no posedge the counter always block
else begin
        case (sel)
            2'b00: out_updown <= out_updown; // retain prevoius state 
            2'b01: // Up counter
             begin 
            out_updown <= out_updown + 1;  
             if (out_updown== 4'b1001) 
             out_updown <= 4'b0000; 
             end           
            2'b10: // Down counter
            begin 
            out_updown <= out_updown - 1; 
             if (out_updown== 4'b0000) 
             out_updown <= 4'b1001; 
             end
            2'b11: out_updown <= out_updown + 1; // up count only 
        endcase 
       end
end

//always@(posedge clk_1hz) begin
//if(rst==1)
//out_updown <= 4'b0000;
//end



// Enable only one digit
assign an = 4'b0111; 

//7-segment display
always @(clk_1hz) begin
 begin 
case (out_updown)
            4'b0000: begin a=0; b=0; c=0; d=0; e=0; f=0; g=1; end
            4'b0001: begin a=1; b=0; c=0; d=1; e=1; f=1; g=1; end
            4'b0010: begin a=0; b=0; c=1; d=0; e=0; f=1; g=0; end
            4'b0011: begin a=0; b=0; c=0; d=0; e=1; f=1; g=0; end
            4'b0100: begin a=1; b=0; c=0; d=1; e=1; f=0; g=0; end
            4'b0101: begin a=0; b=1; c=0; d=0; e=1; f=0; g=0; end
            4'b0110: begin a=0; b=1; c=0; d=0; e=0; f=0; g=0; end
            4'b0111: begin a=0; b=0; c=0; d=1; e=1; f=1; g=1; end
            4'b1000: begin a=0; b=0; c=0; d=0; e=0; f=0; g=0; end
            4'b1001: begin a=0; b=0; c=0; d=0; e=1; f=0; g=0; end
            default: begin a=1; b=1; c=1; d=1; e=1; f=1; g=0; end
endcase
 end
end 

endmodule 

////down counter
//always @ (posedge clk)
//begin
//if (rst)
//out_down <=4'b1111;
//else
//out_down <= out_down-1;
//end


//// Up-Down Counter 
//always @ (posedge clk) begin
//    if (rst) 
//        out_updown <= 4'b0000;
//// to implement up count frst, out <= 0000
//// to implement down count first, out <= 1111
//    else begin
//        case (sel)
//            2'b00: out_updown <= out_updown; // retain prevoius state 
//            2'b01: out_updown <= out_updown + 1;  // Up counter
//            2'b10: out_updown <= out_updown - 1;  // Down counter
//            2'b11: out_updown <= out_updown + 1; // up count only 
//        endcase 
//    end
//end











