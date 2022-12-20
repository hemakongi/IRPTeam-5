`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:48:51 10/11/2022
// Design Name:
// Module Name:    top
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

module top1(


input PCLK_k,
//input PCLK,
input PRESETn,
input PSEL,
input PENABLE,
input PWRITE,
input [7:0] PWDATA,

output trig,
output [7:0] PRDATA

);


wire rstn;
wire PCLK;
wire [7:0] timer_in;
wire newclk_k;
wire [7:0] out;



prescaler1 prescaler1 (
    .PCLK_k(PCLK_k),
    .PCLK(PCLK)
    );

APB apb (
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PENABLE(PENABLE),
    .PSEL(PSEL),  
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .timer_in(timer_in),
    .PRDATA(PRDATA),
.out(out)

    );


prescaler prescaler (
.PCLK(PCLK),
.newclk_k(newclk_k)
);

counter1 counter1 (
.newclk_k(newclk_k),
.rstn(rstn),
.out(out)
);

comparator comparator(
        .trig(trig),
 .timer_in(timer_in),
 .out(out),
 .rstn(rstn),
.newclk_k(newclk_k)
);

endmodule
