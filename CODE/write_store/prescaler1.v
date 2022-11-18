
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    00:45:16 10/19/2022
// Design Name:
// Module Name:    prescaler1
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
module prescaler1 (PCLK_k,PCLK);
 
// Inputs

input PCLK_k;
//reg newclk=0;
output reg PCLK=0;
//output reg [31:0] count_n1=32'd0;

reg [1:0] count_k=2'b0;
//reg [8:0] count_n=9'b0;


always @(posedge PCLK_k)
begin
count_k = count_k+2'd1;
PCLK = count_k[1];
end


endmodule
