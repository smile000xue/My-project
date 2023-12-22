`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Bcd_to_sevensegment
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: It can convert a 4-bit BCD code to 7-bit segment code.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Bcd_to_sevensegment (T3,T2,T1,T0, A1,B1,C1,D1,E1,F1,G1); 

input T3,T2,T1,T0;  // 4 inputs
output A1,B1,C1,D1,E1,F1,G1; // 7 outputs

reg [6:0] out; 

always @(T3,T2,T1,T0) 
begin
case({T3,T2,T1,T0})
4'b0000 : out <= 7'b1111110; //0
4'b0001 : out <= 7'b0110000; //1
4'b0010 : out <= 7'b1101101; //2
4'b0011 : out <= 7'b1111001; //3
4'b0100 : out <= 7'b0110011; //4
4'b0101 : out <= 7'b1011011; //5
4'b0110 : out <= 7'b1011111; //6
4'b0111 : out <= 7'b1110010; //7
4'b1000 : out <= 7'b1111111; //8
4'b1001 : out <= 7'b1111011; //9
default : out <= 7'b0000000; //NULL
endcase 
end

assign {A1,B1,C1,D1,E1,F1,G1} = out;

endmodule
