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
input [1:0] PADDR,
input PENABLE,
input PWRITE,
input [7:0] PWDATA,

output trig,
//output [7:0] PRDATA,
/*output [7:0] timer_in,
output [7:0] c_enable,
output newclk_k,
output [7:0] out,*/
//output [7:0] out1,
output [7:0] store


);

wire rstn;
wire[7:0] timer_in;
wire [7:0] c_enable;
wire newclk_k;
wire [7:0] out;
//wire [7:0] store;
//wire[7:0] out1;
wire PCLK;

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
	 .PADDR(PADDR),
    .PWDATA(PWDATA),
    .timer_in(timer_in),
    //.PRDATA(PRDATA),
	 .c_enable(c_enable)

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

counter2 counter2 (
.newclk_k(newclk_k),
.c_enable(c_enable),
.store(store)
);


comparator comparator(
 .trig(trig),
 .timer_in(timer_in),
 .out(out),
 .rstn(rstn),
.newclk_k(newclk_k)
);

endmodule