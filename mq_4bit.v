`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2024 11:51:14 PM
// Design Name: 
// Module Name: mq_4bit
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


module mq_4bit
    #(parameter n = 4)
    (
    input [n-1:0] m,
    input q,
    output reg [n-1:0] mq
    );
    
    always @(m, q)
    begin
        mq = {m[3] & q, m[2] & q,m[1] & q, m[0] & q};
    end
    
    
endmodule
