`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:16 10/11/2022
// Design Name:   top1
// Module Name:   E:/6th sem/MINOR project/Sunayana_IRP/TIMER_try2/top1_tb.v
// Project Name:  TIMER_try2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module top1_tb;

// Inputs
reg PCLK;
reg PRESETn;
reg PSEL;
reg PENABLE;
reg [1:0] PADDR;
reg PWRITE;
reg [7:0] PWDATA;
//reg pclk_k;

// Outputs
wire trig;
wire [7:0] timer_in;
wire [7:0] c_enable;
wire [7:0]out;
//wire [7:0] out1;
wire newclk_k;
wire [7:0] store;

// Instantiate the Unit Under Test (UUT)
top1 uut (
.PCLK(PCLK),
.PRESETn(PRESETn),
.PSEL(PSEL),
.PENABLE(PENABLE),
.PWRITE(PWRITE),
.PWDATA(PWDATA),
.trig(trig),
//.PRDATA(PRDATA),
.PADDR(PADDR),
.timer_in(timer_in),
.c_enable(c_enable),
.newclk_k(newclk_k),
.out(out),
//.out1(out1),
.store(store)
//.pclk_k(pclk_k)
);




initial
begin
PRESETn=0;
PCLK = 1;
PWDATA =32'd2;
PSEL=0;
PENABLE = 0;
PWRITE = 0;
end


initial begin
forever #17 PCLK=~PCLK;
end


initial
begin
#34
PRESETn=1;
PSEL =1;

#34
PSEL=1;
PENABLE = 0;
PWRITE = 1;



#102
PSEL=1;
PENABLE = 1;
PWRITE = 1;
PADDR = 1;


//#34
//PSEL=1;
//PENABLE = 1;
//PWRITE = 0;
#200

$finish;

end
     
endmodule
