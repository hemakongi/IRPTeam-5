`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:42 10/11/2022 
// Design Name: 
// Module Name:    comparator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comparator ( trig, timer_in,rstn,out,newclk_k);
parameter word_size=8;
input [word_size-1:0] timer_in ,out;
input newclk_k;
output reg trig=1'b0;
//wire trig=1'b0;
output reg rstn=1'b1;

always@(posedge newclk_k) begin
//assign   trig = (timer_in == out)?1:0;
if(timer_in == out)begin
trig=1'b1;
end
else
trig=1'b0;
//assign rstn = (trig == 1)?0:1;
if(trig == 1'b1)begin
rstn=1'b0;
end
else
rstn=1'b1;
end
endmodule
