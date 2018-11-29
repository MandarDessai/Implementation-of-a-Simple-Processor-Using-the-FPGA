`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 06:47:54 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
    input sw1,         //  2 switches to specify state of operation
    input sw2,
    input wire pb,               //  1 push button for execute
    input [3:0] IN1,
    input [3:0] IN2,
//    input clk,
    output reg pb_stat,  
    output reg [4:0] seg,       //  8-bit output
    output reg [1:0] op_led    
    );
    
    // Internal Variabls
    reg [1:0] cur_state;
    
//    always @(pb == 0) begin
//        seg = 5'b00000;
//        op_led = 2'b00;
//    end
    
    always @ (pb) begin    
//    always @(pb or sw1 or sw2 or IN1 or IN2) begin
//        cur_state = 2'b00;
//        cur_state = 2'b01 & sw1;
//        cur_state = (sw2<<1)|cur_state;
        pb_stat = pb;
        cur_state[0] = sw1;
        cur_state[1] = sw2;
        op_led <= cur_state;
        seg = 5'b00000;
        if (pb ==1)begin
            case (cur_state)
                2'b00: begin// perform AND op       // :)
                //$display ("AND");
                seg = IN1&IN2;
                end
                2'b01: // do ADD
                //$display ("ADD") ;
                begin
                seg = IN1 + IN2;
                end
                2'b10: // do NOT
                //$display ("NOT");
                begin
                seg = (~IN1)&5'b01111;
                end           
                2'b11: // do SHIFT Left 1 bit
                //$display ("SHIFT LEFT") ;
                begin
                seg = IN1<<1;
                end
            endcase
        end
    end
endmodule