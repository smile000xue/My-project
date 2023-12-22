`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Score_count
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: When the button you press corresponding to the led,the score will increase by 1.The maximum score is 100 points.
// buttonA corrspoding to led1,buttonB corrspoding to led2...buttonH corrspoding to led8
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Score_count(
input [7:0]Tim,
input clk,
input key0,key1,key2,key3,key4,key5,key6,key7,
input [7:0]led,
input rst,
output reg [7:0]out
    );

   
always@(posedge clk or posedge rst)
begin
if(rst)
    out<=0;
else  if(Tim<=0)
    out<=0;
else if(key0||key1||key2||key3||key4||key5||key6||key7)
begin
if((key0&&(key0==led[0]))||(key1&&(key1==led[1]))||(key2&&(key2==led[2]))||(key3&&(key3==led[3]))||(key4&&(key4==led[4]))||(key5&&(key5==led[5]))||(key6&&(key6==led[6]))||(key7&&(key7==led[7])))
    begin
    out<=1+out;
    if(out>99)
    out<=0;
    end
else
    out<=out;
end

end  
endmodule
