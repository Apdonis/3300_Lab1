`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 02:25:45 PM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] x,y,
    input [1:0] op_sel,
    output [7:0] rslt,
    output cout, overf
    );
    wire [7:0] product;
    wire [4:0]add_sub;
    wire [7:0]add_sub_sum;
    wire of;
    
    adder_subtractor as0 (.x(x[3:0]), .y(y[3:0]), .add_n(op_sel[0]), .s(add_sub[3:0]), .c_out(cout), .overflow(overf));
    csa_multiplier cm0 (.m(x[3:0]), .q(y[3:0]), .sum(product[7:0]));
    
    assign  add_sub_sum[7:0] = {4'b0,add_sub[3:0] };
    
    mux2to1_8bit sel(.x(add_sub_sum[7:0]), .y(product[7:0]), .s(op_sel[1]), .f(rslt[7:0]));
    
endmodule
