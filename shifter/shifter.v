module shifter(
   output [15:0] shift_out,
   input  [7:0]  shift_in,
   input  [1:0]  shift_cntrl
);
 
reg [15:0] temp ;


always@(*)
begin
temp[15:8]=8'b00000000;
temp[7:0]=shift_in[7:0];

if(shift_cntrl == 2'b01)
begin
temp = {temp[11:0],4'b0000};
end


else if (shift_cntrl == 2'b10)
begin
temp = {temp[7:0],8'b0000};
end


end

assign shift_out = temp ;


endmodule 





module tb_shifter();

wire [15:0] dout ;
reg  [7:0]  din ;
reg  [1:0]  ctrl ;

initial
begin
$monitor("%b %b %b",din,ctrl,dout);
din=8'b11111111;
ctrl=2'b01;
#20
din=8'b10101010;
ctrl=2'b01;
#20
din=8'b11111111;
ctrl=2'b10;
#20
din=8'b11111111;
ctrl=2'b00;
#20
din=8'b11111111;
ctrl=2'b11;

end

shifter g1(dout,din,ctrl);


endmodule

