`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Top_game_of_whack_a_mole
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


module Top_game_of_whack_a_mole(
input [7:0]key,
input clk,rst,
output [7:0]led,
output [7:0] seg_com,
output [6:0]seg_data
    );
    
wire [7:0]t1;
wire [7:0]score;
wire [7:0]Key_Flag;
wire [7:0]Key_State;
wire [7:0]key1;
reg [15:0]Counter;
parameter Com=500;
reg [7:0]Tim;

/*----------generate a 60-second countdown-----------------*/
always @(posedge clk) 
begin
    if(!rst&&Counter>=Com)
    Counter<=0;
    else if(!rst&&Counter<Com)
    Counter<=Counter+1;
    else
    Counter<=0; 
end

always @(posedge clk) 
begin
    if(!rst&&Counter>=Com)
    begin
    Tim<=Tim-1;
    if(Tim<=0)
    begin
    Tim<=8'b00111100;
    end
    end
    else if(rst)
    Tim<=8'b00111100;
end


Led_display l1(clk,rst,t1);
Button_debuncing k1(clk,rst,key[0],Key_Flag[0],Key_State[0]);
Button_debuncing k2(clk,rst,key[1],Key_Flag[1],Key_State[1]);
Button_debuncing k3(clk,rst,key[2],Key_Flag[2],Key_State[2]);
Button_debuncing k4(clk,rst,key[3],Key_Flag[3],Key_State[3]);
Button_debuncing k5(clk,rst,key[4],Key_Flag[4],Key_State[4]);
Button_debuncing k6(clk,rst,key[5],Key_Flag[5],Key_State[5]);
Button_debuncing k7(clk,rst,key[6],Key_Flag[6],Key_State[6]);
Button_debuncing k8(clk,rst,key[7],Key_Flag[7],Key_State[7]);
Score_count s1(Tim,clk,key1[0],key1[1],key1[2],key1[3],key1[4],key1[5],key1[6],key1[7],t1,rst,score);
Display_seven_segment d1(clk,score,Tim,rst,seg_com, seg_data);

assign led=t1;
assign key1=Key_Flag&(~Key_State);
    
endmodule