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

//input clk,
//output rstn,
//output [31:0]out,
//output newclk_k,
//input [31:0]timer_in,

//input PCLK_k,
input PCLK,
input PRESETn,
input PSEL,
input PENABLE,
//input [31:0] PADDR,
input PWRITE,
input [7:0] PWDATA,
//input pclk_k,

output trig,
//output  P_READY,
output [7:0] PRDATA,
output [7:0] timer_in,
output newclk_k,
output [7:0] out
//output [7:0] out1
//output  pclk_k

);


wire rstn;
//wire PCLK;
//wire newclk_k;
//wire[7:0] out;
//wire[7:0] out1;
//wire[7:0] PRDATA;
//wire newclk;
//wire [7:0]timer_in;
//wire clk;
//wire reg_read;
//wire reg_addr;
//wire reg_rdata;
//wire reg_write;


//prescaler1 prescaler1 (
   // .PCLK_k(PCLK_k),
    //.PCLK(PCLK)
    //);

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
//.pclk_k(pclk_k)

    );


prescaler prescaler (
.PCLK(PCLK),
.newclk_k(newclk_k)
);

counter1 counter1 (
.newclk_k(newclk_k),
.rstn(rstn),
.out(out)
//.out1(out1)
);

comparator comparator(
        .trig(trig),
 .timer_in(timer_in),
 .out(out),
 .rstn(rstn),
.newclk_k(newclk_k)
);

endmodule