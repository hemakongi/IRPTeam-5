`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:55:38 10/11/2022
// Design Name:
// Module Name:    counter1
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
module counter1(
input newclk_k,
input rstn,
output reg [7:0]out=0//out1=0
//reg[15:0] timer_in=16'd2,
//reg[0:1] trig=0
);

always @ (posedge newclk_k)
begin
//out1<=out1+1'b1;
//if(out1 == 5)
//out2<=out2+1'b1;
if(rstn==0)
begin
out<=0;
end
else
begin
//if(timer_in==out)
//trig=1;
//else

out<=out+1'b1;
end
end
endmodule
