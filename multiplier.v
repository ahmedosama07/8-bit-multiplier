module multiplier (
  	input [7:0] data_a,
    input [7:0] data_b,
    input start,
    input reset_a,
    input clk,
    output done_flag,
  	output [6:0] seven_segment,
    output [15:0] product8x8_out
);

wire clk_ena_wire;
wire sclr_n_wire;
//wire not_start;
wire [1:0] select_wire;
wire [1:0] shift_wire;
wire [1:0] count_wire;
wire [2:0] state_out_wire;
wire [3:0] a_out_wire;
wire [3:0] b_out_wire;
wire [7:0] product_wire;
wire [15:0] shift_out_wire;
wire [15:0] sum_wire;
wire [15:0] product8x8_out_wire;

//not_start <= not start;

// Multiplexers
mux2 mux_a(.mux_out(a_out_wire), .mux_in_a(data_a[3:0]), .mux_in_b(data_a[7:4]), .mux_sel(select_wire[1]));
mux2 mux_b(.mux_out(b_out_wire), .mux_in_a(data_b[3:0]), .mux_in_b(data_b[7:4]), .mux_sel(select_wire[0]));

// 4 bit Multiplier
Mul multiply4bit(.data_a(a_out_wire), .data_b(b_out_wire), .product(product_wire));

// Shifter
shifter shift(.shift_out(shift_out_wire), .shift_in(product_wire), .shift_cntrl(shift_wire));

// Adder
adder add(.data_a(shift_out_wire), .data_b(product8x8_out_wire), .sum(sum_wire));

// Register
synreg reg16(.reg_out(product8x8_out_wire), .datain(sum_wire), .clk(clk), .sclr_n(sclr_n_wire), .clk_en(clk_ena_wire));

// Counter
counter count(.clk(clk), .aclr_n(~start), .count_out(count_wire));

// Multiplier controller
mult_control controller(.clk(clk), .reset_a(reset_a), .start(start), .count(count_wire), .done(done_flag), .clk_ena(clk_ena_wire), .sclr_n(sclr_n_wire), .input_sel(select_wire), .shift_sel(shift_wire), .state_out(state_out_wire));

// Seven segment
seg seven_segment_cntrl(.data_in(state_out_wire), .data_out(seven_segment));

// Product output
assign product8x8_out = product8x8_out_wire;
endmodule