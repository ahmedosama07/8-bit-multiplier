module mul_testbench ();
    reg [7:0] data_a ,  data_b;
    reg start, reset_a, clk;
    wire done_flag;
    wire [6:0] seven_segment;
    wire [15:0] product;

    integer i;

initial
begin
clk=1;
forever #50 clk=~clk;
end
initial 
begin
    for (i = 0; i < 255; i = i + 1) 
    begin
		data_a = $random;
            data_b = $random;
            start = 1'b1; #100;
            start = 1'b0;
               #500;
    end
end
    initial 
    begin
    $display ("\t \t  Time   data_a    data_b    product");
    $monitor ("%d %b %b %b", $time , data_a , data_b , product);
    end

    multiplier A (.data_a(data_a),
                .data_b(data_b),
                .start(start),
                .reset_a(reset_a),
                .clk(clk),
                .done_flag(done_flag),
                .seven_segment(seven_segment),
                .product8x8_out(product));
endmodule