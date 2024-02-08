`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 12:57:05 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier
#(parameter n=4)
(   
    input [3:0] m,q, 
    output [7:0] sum,
    output cout
    );
    wire [3:0] sum0, sum1, sum2,sum3,sum4;
    wire facout[10:0];
    wire  fasum[5:0];
    
    
    mq_4bit mq0 (.m(m[3:0]), .q(q[0]), .mq(sum0[3:0]));
    mq_4bit mq1 (.m(m[3:0]), .q(q[1]), .mq(sum1[3:0]));
    mq_4bit mq2 (.m(m[3:0]), .q(q[2]), .mq(sum2[3:0]));
    mq_4bit mq3 (.m(m[3:0]), .q(q[3]), .mq(sum3[3:0]));
    
    assign sum[0] = m[0] & q[0]; 
    
    full_adder fa0(.x(sum0[1]), .y(sum1[0]), .c_in(1'b0), .s(sum[1]), .c_out(facout[0]));
    full_adder fa1(.x(sum0[2]), .y(sum1[1]), .c_in(sum2[0]), .s(fasum[0]), .c_out(facout[1]));
    full_adder fa2(.x(sum0[3]), .y(sum1[2]), .c_in(sum2[1]), .s(fasum[1]), .c_out(facout[2]));
    full_adder fa3(.x(1'b0), .y(sum1[3]), .c_in(sum2[2]), .s(fasum[2]), .c_out(facout[3]));
    
    full_adder fa4(.x(1'b0), .y(fasum[0]), .c_in(facout[0]), .s(sum[2]), .c_out(facout[4]));
    full_adder fa5(.x(fasum[1]), .y(sum3[0]), .c_in(facout[1]), .s(fasum[3]), .c_out(facout[5]));
    full_adder fa6(.x(fasum[2]), .y(sum3[1]), .c_in(facout[2]), .s(fasum[4]), .c_out(facout[6]));
    full_adder fa7(.x(sum3[2]), .y(sum2[3]), .c_in(facout[3]), .s(fasum[5]), .c_out(facout[7]));
    
    full_adder fa8(.x(fasum[3]), .y(facout[4]), .c_in(1'b0), .s(sum[3]), .c_out(facout[8]));
    full_adder fa9(.x(fasum[4]), .y(facout[5]), .c_in(facout[8]), .s(sum[4]), .c_out(facout[9]));
    full_adder fa10(.x(fasum[5]), .y(facout[6]), .c_in(facout[9]), .s(sum[5]), .c_out(facout[10]));
    full_adder fa11(.x(facout[7]), .y(sum3[3]), .c_in(facout[10]), .s(sum[6]), .c_out(cout));
    
    assign sum[7] = cout;
    
endmodule
