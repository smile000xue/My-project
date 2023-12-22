`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: TANXUELIANG
// 
// Create Date: 2023/12/15 15:13:09
// Design Name: game_of_whack_a_mole
// Module Name: Button_debuncing
// Project Name: game_of_whack_a_mole
// Target Devices: Spartan-7 xc7s75fgga484-1
// Tool Versions: Vivado2022.2
// Description: Utilizing the characteristics of a state machine, it can eliminate button debounce. 
// The condition o_key_flag && !o_key_state (a single pulse) represents a button press.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Button_debuncing(

    input                               i_clk                     ,
    input                               i_rstn                    ,
    input                               i_key                     ,
    output reg                          o_key_flag                ,
    output reg                          o_key_state                  
	);


parameter
        IDEL        =  4'b0001,
        FILTER0     =  4'b0010,
        DOWN        =  4'b0100,
        FILTER1     =  4'b1000;
    

		
reg    [3:0]   state                ;
reg    [19:0]  cnt_20ms             ;
reg            en_cnt_20ms          ;//enable the counting register
reg            i_key_a,i_key_b      ;
reg            key_tmp_a,key_tmp_b  ;
reg            cnt_20ms_full        ;//count full flag signal
wire           pedge,nedge          ;

always@(posedge i_clk or posedge i_rstn)
    if(i_rstn)
      begin
         i_key_a <= 1'b0;
         i_key_b <= 1'b0;
      end
    else 
        begin
         i_key_a <= i_key;
         i_key_b <= i_key_a;
       end
//-------------edge detection circuit----------------------------//
always@(posedge i_clk or posedge i_rstn)
    if(i_rstn)begin
        key_tmp_a <= 1'b0;
        key_tmp_b <= 1'b0;
    end
    else begin
        key_tmp_a <= i_key_b;
        key_tmp_b <= key_tmp_a;
    end
	
assign nedge = !key_tmp_a &  key_tmp_b  ;
assign pedge = key_tmp_a  & (!key_tmp_b);

//------------------------20mscounter------------------//
always@(posedge i_clk or posedge i_rstn)
    if(i_rstn)
        cnt_20ms <= 20'd0;
    else if(en_cnt_20ms)
        cnt_20ms <= cnt_20ms + 1'b1;
    else
        cnt_20ms <= 20'd0;
	
always@(posedge i_clk or posedge i_rstn)
    if(i_rstn)
        cnt_20ms_full <= 1'b0;
    else if(cnt_20ms == 10)
        cnt_20ms_full <= 1'b1;
    else
        cnt_20ms_full <= 1'b0;

//----------------fsm-----------------------------
always@(posedge i_clk or posedge i_rstn)
    if(i_rstn)begin
        en_cnt_20ms <= 1'b0;
        state       <= IDEL;
        o_key_flag  <= 1'b0;
        o_key_state <= 1'b1;
    end
    else begin
        case(state)
            IDEL :
                begin
                    o_key_flag <= 1'b0;
                    if(pedge)begin
                        state       <= FILTER0;
                        en_cnt_20ms <= 1'b1;
                    end
                    else
                        state <= IDEL;
                end
					
            FILTER0:
                if(cnt_20ms_full)begin
                    o_key_flag  <= 1'b1;
                    o_key_state <= 1'b0;
                    en_cnt_20ms <= 1'b0;
                    state       <= DOWN;
                end
                else if(nedge)begin
                    state       <= IDEL;
                    en_cnt_20ms <= 1'b0;
                end
                else
                    state <= FILTER0;
					
            DOWN:
                begin
                    o_key_flag <= 1'b0;
                    if(nedge)begin
                        state       <= FILTER1;
                        en_cnt_20ms <= 1'b1;
                    end
                    else
                        state <= DOWN;
                end
			
            FILTER1:
                if(cnt_20ms_full)begin
                    o_key_flag  <= 1'b1;
                    o_key_state <= 1'b1;
                    en_cnt_20ms <= 1'b0;
                    state       <= IDEL;
                end
                else if(pedge)begin
                    en_cnt_20ms <= 1'b0;
                    state       <= DOWN;
                end
                else
                    state <= FILTER1;
			
            default:
                begin
                    state       <= IDEL;
                    en_cnt_20ms <= 1'b0;
                    o_key_flag  <= 1'b0;
                    o_key_state <= 1'b1;
                end
				
        endcase
    end
	


endmodule

