module Mul ( data_a, data_b, product);

  input  [3:0] data_a ,  data_b;
  output reg [7:0] product;

  always @(*)
  
   product = data_a * data_b;

endmodule

module Mul_testbench ();

  reg [3:0] data_a ,  data_b;
  wire [7:0] product;
  integer i;

initial 
begin

    for (i = 0; i < 100; i = i + 1) 
    begin
            data_a = $random;   #100;
            data_b = $random;   #100;
    end
end
    initial 
    begin
    $display ("\t \t  Time   data_a    data_b    product");
    $monitor ("%d %b %b %b", $time , data_a , data_b , product);
    end

   Mul A ( data_a, data_b, product);
endmodule
