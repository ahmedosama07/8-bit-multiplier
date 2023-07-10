module adder ( data_a, data_b, sum);

  input  [15:0] data_a ,  data_b;
  output reg [15:0] sum;

  always @(*)
   sum = data_a + data_b;

endmodule

module adder_testbench ();

  reg [15:0] data_a ,  data_b;
  wire [15:0] sum;
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
    $display ("\t \t  Time    data_a          data_b          sum");
    $monitor ("%d %b %b %b", $time , data_a , data_b , sum);
    end

   adder A ( data_a, data_b, sum);
endmodule
