module rippleadder_b;

reg [15:0] a;
reg [15:0] b;
reg cin;
wire [15:0] sum;
wire cout;
fulladder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout) );

initial begin
#10 a=16'd0;b=16'd1;cin=1'b0;
#10 a=16'd1;b=16'd1;cin=1'b1;
#10 a=16'd2;b=16'd3;cin=1'b0;
#10 a=16'd32769;b=16'd32769;cin=1'b0;
#10 a=16'd2000;b=16'd2001;cin=1'b0;
#10 a=16'd3;b=16'd3;cin=1'b1;
#10 a=16'd65535;b=16'd1;cin=1'b0;
#10 a=16'd65535;b=16'd0;cin=1'b1;
#10 a=16'd65535;b=16'd65535;cin=1'b0;
#10 $stop;
end

initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);end

endmodule