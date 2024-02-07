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
    wire cout0, cout1, cout2, cout3, cout4,cout5,cout6,cout7, cout8, cout9,cout10;
    wire  fasum1, fasum2,fasum3,fasum5,fasum6,fasum7;
    
    
    mq_4bit mq0 (.m(m[3:0]), .q(q[0]), .mq(sum0[3:0]));
    mq_4bit mq1 (.m(m[3:0]), .q(q[1]), .mq(sum1[3:0]));
    mq_4bit mq2 (.m(m[3:0]), .q(q[2]), .mq(sum2[3:0]));
    mq_4bit mq3 (.m(m[3:0]), .q(q[3]), .mq(sum3[3:0]));
    
    assign sum[0] = m[0] & q[0]; 
    
    full_adder fa0(.x(sum0[1]), .y(sum1[0]), .c_in(1'b0), .s(sum[1]), .c_out(cout0));
    full_adder fa1(.x(sum0[2]), .y(sum1[1]), .c_in(sum2[0]), .s(fasum1), .c_out(cout1));
    full_adder fa2(.x(sum0[3]), .y(sum1[2]), .c_in(sum2[1]), .s(fasum2), .c_out(cout2));
    full_adder fa3(.x(1'b0), .y(sum1[3]), .c_in(sum2[2]), .s(fasum3), .c_out(cout3));
    
    full_adder fa4(.x(1'b0), .y(fasum1), .c_in(cout0), .s(sum[2]), .c_out(cout4));
    full_adder fa5(.x(fasum2), .y(sum3[0]), .c_in(cout1), .s(fasum5), .c_out(cout5));
    full_adder fa6(.x(fasum3), .y(sum3[1]), .c_in(cout2), .s(fasum6), .c_out(cout6));
    full_adder fa7(.x(sum3[2]), .y(sum2[3]), .c_in(cout3), .s(fasum7), .c_out(cout7));
    
    full_adder fa8(.x(fasum5), .y(cout4), .c_in(1'b0), .s(sum[3]), .c_out(cout8));
    full_adder fa9(.x(fasum6), .y(cout5), .c_in(cout8), .s(sum[4]), .c_out(cout9));
    full_adder fa10(.x(fasum7), .y(cout6), .c_in(cout9), .s(sum[5]), .c_out(cout10));
    full_adder fa11(.x(cout7), .y(sum3[3]), .c_in(cout10), .s(sum[6]), .c_out(cout));
    
    assign sum[7] = cout;
    
endmodule
