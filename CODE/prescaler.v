`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:51:10 10/11/2022
// Design Name:
// Module Name:    prescaler
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
module prescaler (PCLK,newclk_k);
 
// Inputs

input PCLK;
reg newclk=0;
output reg newclk_k=0;
//output reg [31:0] count_n1=32'd0;

reg [15:0] count=16'b0;
reg [8:0] count_n=9'b0;


always @(posedge PCLK)
begin
count = count+16'd1;
newclk = count[15];
end


always @(posedge newclk)
begin
count_n = count_n+9'd1;
newclk_k=count_n[8];
end

endmodule