`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:51:34 11/08/2022 
// Design Name: 
// Module Name:    counter2 
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


module counter2(
input newclk_k,
input [7:0] c_enable,
output reg [7:0]store=0
//output reg [7:0]out1=0
);
reg [7:0]out1=0;
//reg [7:0]store;
//parameter [7:0] out1=0;
//reg [7:0] store=0;
/*always @ (posedge newclk_k)
begin
if(c_enable==0)
begin
out1<=0;
end
else if(c_enable==1)
begin
out1<=out1+1'b1;
end
end
endmodule*/


always @ (posedge newclk_k)
begin
if(c_enable==0)
begin
out1 <= out1+1'b1;
end
else if(c_enable==1)
begin
store <= out1;
end
end
endmodule