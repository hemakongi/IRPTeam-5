`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:50:34 10/11/2022
// Design Name:
// Module Name:    APB
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
module APB(
input PRESETn,
input PCLK,
input PENABLE,
input PSEL,
input PWRITE,
input [7:0] PWDATA,
input [7:0] out,


output reg  [7:0] timer_in,
output reg [7:0] PRDATA


 );  
parameter idle=2'b00,setup=2'b01,write=2'b10,read=2'b11;
reg[1:0] next_state,current_state;
always@(posedge PCLK,negedge PRESETn)

begin
if(!PRESETn)
begin
current_state<=idle;
end
else
begin
current_state<=next_state;
end
end


always@(posedge PCLK)begin
case(current_state)

idle:
begin
if(PSEL)
begin
next_state<=setup;
end
else
begin
next_state<=idle;
end
end

setup:
begin
if(PSEL == 1'b1 && PENABLE ==1'b0 && PWRITE == 1'b1)
begin
next_state<=write;
end
else
begin
next_state<=read;
end
end
write:
begin
if(PSEL == 1'b1 && PENABLE == 1'b1 && PWRITE==1'b1)
begin
timer_in = PWDATA;
end
else
begin
next_state <= setup;
end
end
read:
begin
if(PSEL == 1'b1 && PENABLE == 1'b1 && PWRITE==1'b0)
begin
PRDATA <= out;
end
else
begin
next_state <= setup;
end
end


default:
begin
 next_state<=idle;
end

endcase
end

endmodule
