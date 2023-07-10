module synreg(
  output  [15:0] reg_out,
  input  [15:0] datain,
  input   clk,
  input   sclr_n,
  input   clk_en

);

reg  [15:0] temp ;

always @(posedge clk)
begin

if((clk_en == 1'b1) && (sclr_n == 1'b0 ) )
begin
temp <= 16'b0000000000000000;
end

else if ((clk_en == 1'b1) && (sclr_n == 1'b1 ))
begin
temp <= datain;
end

end


assign reg_out = temp;





endmodule


module tb_synreg();

  wire [15:0] dout;
  reg  [15:0] din;
  reg   clk;
  reg   selector;
  reg   clken;


initial
begin
$monitor("%b %b %b %b",din,clken,selector,dout);
din = 16'b1010101010101010;
#25
selector = 0;
clken = 1;
#25
selector = 1;
clken = 0;

#25
selector = 1;
clken = 1;

end

initial clk =0;

always #10 clk = !clk;


synreg g1(dout,din,clk,selector,clken);


endmodule
