`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 02:16:05 PM
// Design Name: 
// Module Name: mux2to1_8bit
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


module mux2to1_8bit(
    input [7:0] x, y,
    input s,
    output reg [7:0] f
    );
    
    always @(x,y,s)
    begin   
        if(s)
        begin
            f = y;
        end
        else
        begin
            f = x;
        end
    end
       
endmodule
