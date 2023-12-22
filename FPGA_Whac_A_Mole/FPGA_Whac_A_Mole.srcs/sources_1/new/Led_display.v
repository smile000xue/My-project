`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Led_display
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: By using the random number generated int the Random_number module, it can randomly illuminate the led every 0.8s.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Led_display(
    input clk,rst,
    output reg [7:0] out_data
);

reg [9:0]t1;
reg  [2:0]index;
parameter Counter=400;//main clock=500Hz
wire      [31:0]   data;



Random_number r1(clk,rst,data);

always @(posedge clk or posedge rst) 
begin
    if(rst)
    t1<=0;
    else if(t1>=Counter)
    t1<=0;
    else
    t1<=t1+1;
end

always @(posedge clk or posedge rst) 
begin
    if(rst)
    out_data<=0;
    else if(t1==Counter)
    begin
    out_data<= 0;
    index<=data%8;
    out_data[index] <= 1;
    end
end

endmodule
