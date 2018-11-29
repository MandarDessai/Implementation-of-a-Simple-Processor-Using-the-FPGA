`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 06:56:38 PM
// Design Name: 
// Module Name: main_tb
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


module main_tb( );

    //Declare inputs as regs and outputs as wires
    reg sw1, sw2, pb;
    reg [3:0]IN1, IN2;
    wire [4:0]seg;

    //Connect DUT to test
    main sim_lab1(.IN1(IN1),
                  .IN2(IN2),
                  .sw1(sw1),
                  .sw2(sw2),
                  .pb(pb),
                  .seg(seg));
                  
    //Initialize all variables
    initial begin
        sw1 = 0;
        sw2 = 0;
        pb = 1;
        // 2'b00 - AND operation cases 
//        IN1 <= 4'b0001;//8'b0000101;
//        IN2 <= 4'b1010;//8'b1110001;
        $display("Op \tIN1 \tIN2 \tResult");
        $monitor("%b%b \t%b \t%b \t%b", sw2, sw1, IN1, IN2, seg);    
        // 2'b01 - ADD operation test cases
        #50 sw1 = 1;     // going to state 1 for ADDitiion 
        $display("+----------------------------+");
        $display("Op: ADD");
        IN1 <= 4'b0000;//8'b0000101;
        IN2 <= 4'b0000;//8'b1110001;
        
        #50 IN1 <= 4'b1111;//8'b0000101;
        IN2 <= 4'b1111;//8'b1110001;
    
        #50 IN1 <= 4'b0101;//8'b0000101;
        IN2 <= 4'b1010;//8'b1110001;
            
        #50 IN1 <= 4'b1010;//8'b0000101;
        IN2 <= 4'b0101;//8'b1110001;
        
        // 2b'10 - NOT opertion  
        #50 sw2 = 1; sw1 = 0;
        $display("Op: NOT IN1");    
        IN1 <= 4'b1010;
        
        // 2b'11 - LEFT SHIFT opertion
        #50 sw1 = 1; sw2 = 1;    // state 3 for LEFT SHIFT
        $display("Op: 1-BIT LEFT SHIFT IN1"); 
        IN1 <= 4'b1000;
        
        // 2'b00 - AND operation cases
        //#50 sw1 = 0; sw2 = 0;
        $display("Op: AND");
        IN1 <= 4'b0000;//8'b0000101;
        IN2 <= 4'b0000;//8'b1110001;
        
        #50 IN1 <= 4'b1111;//8'b0000101;
        IN2 <= 4'b1111;//8'b1110001;
    
        #50 IN1 <= 4'b0101;//8'b0000101;
        IN2 <= 4'b1010;//8'b1110001;
            
        #50 IN1 <= 4'b1010;//8'b0000101;
        IN2 <= 4'b0101;//8'b1110001;
        
        #20 $finish;
        $display("+----------------------------+\n");
    end
    

endmodule
//end of lab1_tb module