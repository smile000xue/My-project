`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: game_of_whack_a_mole_tb
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: Based on studied in this semseter,we plan to design a game_of_whack_a_mole in the FPGA board.It mainly has
// sevensegment display,led display,button_debouncing 3 module.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module game_of_whack_a_mole_tb();

reg [7:0]key;
reg clk,rst;
wire [7:0]led;
wire [7:0] seg_com;
wire [6:0]seg_data;

Top_game_of_whack_a_mole g1(key,clk,rst,led,seg_com,seg_data);

initial
begin
key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;
#10 key<=8'b0000_1000;clk<=1;rst<=1;
#10 key<=8'b0000_1000;clk<=0;rst<=0;


end

always #10 clk<=~clk;
always #10 key<=~key;



endmodule
