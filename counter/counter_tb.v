module counter_testbench();
reg clk, aclr_n;
wire [1:0] c;

counter dut(clk, aclr_n, c);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
aclr_n=1'b1;
#20;
aclr_n=1'b0;
end
endmodule 