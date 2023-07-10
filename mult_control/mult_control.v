module mult_control(
    input clk, 
    input reset_a,
    input start,
    input [1:0] count, 
    output reg done,
    output reg clk_ena,
    output reg sclr_n,
    output reg [1:0] input_sel,
    output reg [1:0] shift_sel,
    output reg [2:0] state_out
);


// Define the states
parameter IDLE = 3'b000; // Initial state
parameter LSB = 3'b001; // Found 1
parameter MID = 3'b010; // Found 11
parameter MSB = 3'b011; // Found 110
parameter CALC_DONE = 3'b100; // Found 1101
parameter ERR = 3'b101;

// Define the state register
reg [2:0] state;
always @(posedge clk, posedge reset_a) begin
  if (reset_a) begin
    state <= IDLE;
  end
  else begin
    case (state)
      IDLE: if (start) begin 
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b0;
                state <= LSB;
            end
            else begin
                done <= 1'b0;
                clk_ena <= 1'b0;
                sclr_n <= 1'b1;
                state <= IDLE;
            end
      LSB: if (~start && count == 2'b00) begin 
                input_sel <= 2'b00;
                shift_sel <= 2'b00;
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b1;
                state <= MID;
            end
            else begin
                done <= 1'b0;
                clk_ena <= 1'b0;
                sclr_n <= 1'b1;
                state <= ERR;
            end
      MID: if (~start && count == 2'b10) begin 
                input_sel <= 2'b10;
                shift_sel <= 2'b01;
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b1;
                state <= MSB;
            end
            else if (~start && count == 2'b01) begin 
                input_sel <= 2'b01;
                shift_sel <= 2'b01;
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b1;
                state <= MID;
            end
            else begin
                done <= 1'b0;
                clk_ena <= 1'b0;
                sclr_n <= 1'b1;
                state <= ERR;
            end
      MSB: if (~start && count == 2'b11) begin 
                input_sel <= 2'b11;
                shift_sel <= 2'b10;
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b1;
                state <= CALC_DONE;
            end
            else begin
                done <= 1'b0;
                clk_ena <= 1'b0;
                sclr_n <= 1'b1;
                state <= ERR;
            end
      CALC_DONE: if (start) begin 
                    done <= 1'b0;
                    clk_ena <= 1'b0;
                    sclr_n <= 1'b1;
                    state <= ERR;
                end
                else begin
                    done <= 1'b1;
                    clk_ena <= 1'b0;
                    sclr_n <= 1'b1;
                    state <= IDLE;
                end
      ERR: if (start) begin 
                done <= 1'b0;
                clk_ena <= 1'b1;
                sclr_n <= 1'b0;
                state <= LSB;
            end
            else begin
                done <= 1'b0;
                clk_ena <= 1'b0;
                sclr_n <= 1'b1;
                state <= ERR;
            end
    endcase
  end
end

endmodule