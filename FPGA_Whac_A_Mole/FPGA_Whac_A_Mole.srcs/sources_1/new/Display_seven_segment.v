`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Display_seven_segment
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: It will display the time and the score in the sevensegment.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Display_seven_segment
(
input CLK,
input [7:0]data,
input [7:0]time1,
input N_Reset,
output [7:0]SEG_COM, 
output [6:0]SEG_DATA
);

wire dat9,dat8,dat7,dat6,dat5,dat4,dat3,dat2,dat1,dat0;
wire T9,T8,T7,T6,T5,T4,T3,T2,T1,T0;
wire A1,B1,C1,D1,E1,F1,G1,A2,B2,C2,D2,E2,F2,G2;
wire A3,B3,C3,D3,E3,F3,G3;
wire A4,B4,C4,D4,E4,F4,G4;
wire A5,B5,C5,D5,E5,F5,G5;

// calling out 'Binary_to_bcd' module
Binary_to_bcd b1(data,{dat9,dat8,dat7,dat6,dat5,dat4,dat3,dat2,dat1,dat0});
Binary_to_bcd b2(time1,{T9,T8,T7,T6,T5,T4,T3,T2,T1,T0});

// calling out 'Bcd_to_sevensegment' module
Bcd_to_sevensegment b3(dat3,dat2,dat1,dat0, A1,B1,C1,D1,E1,F1,G1);
Bcd_to_sevensegment b4(dat7,dat6,dat5,dat4, A2,B2,C2,D2,E2,F2,G2);
Bcd_to_sevensegment b5(0,0,dat9,dat8,A3,B3,C3,D3,E3,F3,G3);
                    
Bcd_to_sevensegment b6(T3,T2,T1,T0, A4,B4,C4,D4,E4,F4,G4);
Bcd_to_sevensegment b7(T7,T6,T5,T4, A5,B5,C5,D5,E5,F5,G5);

// calling out 'sevensegment_select' module
sevensegment_select s8(CLK, N_Reset, {A1,B1,C1,D1,E1,F1,G1},{A2,B2,C2,D2,E2,F2,G2},{A3,B3,C3,D3,E3,F3,G3},7'b1111110,7'b1111110,7'b1111110,{A4,B4,C4,D4,E4,F4,G4},{A5,B5,C5,D5,E5,F5,G5},
SEG_COM, SEG_DATA);

endmodule
