module mux2(
  output [3:0] mux_out,
  input  [3:0] mux_in_a,
  input  [3:0] mux_in_b,
  input mux_sel
);
reg [3:0] temp ;
always @(*)
begin
if(mux_sel == 1'b0)
temp <= mux_in_a;
else
temp <= mux_in_b;
end

assign mux_out = temp;
endmodule


module tb_mux();
reg [3:0] a;
reg [3:0] b;
reg selector ;
wire [3:0] c;

initial
begin
$monitor("%b %b %b %b",a,b,selector,c);
selector = 1'b0;
a = 4'b0000;
b = 4'b1111;
#10
selector = 1'b1;

end 

mux2  g1(c,a,b,selector);
endmodule
