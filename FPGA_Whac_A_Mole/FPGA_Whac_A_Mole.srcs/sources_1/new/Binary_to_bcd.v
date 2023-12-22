`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Binary_to_bcd
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: It can convert an 8-bit binary number to a 10-bit BCD code.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Binary_to_bcd(
	input	[7:0]	bin_in,
	output	[9:0]	bcd_out
    );
	
reg [3:0] ones;
reg [3:0] tens;
reg [1:0] hundreds;
integer i;
 
always @(*) begin
	ones 		= 4'd0;
	tens 		= 4'd0;
	hundreds 	= 2'd0;
	
	for(i = 7; i >= 0; i = i - 1) begin
		if (ones >= 4'd5) 		ones = ones + 4'd3;
		if (tens >= 4'd5) 		tens = tens + 4'd3;
		if (hundreds >= 4'd5)	hundreds = hundreds + 4'd3;
		hundreds = {hundreds[0],tens[3]};
		tens	 = {tens[2:0],ones[3]};
		ones	 = {ones[2:0],bin_in[i]};
	end
end	
assign bcd_out = {hundreds, tens, ones};
endmodule