module counter(
    input clk, aclr_n, 
    output[1:0] count_out
);
reg [1:0] c;

// up counter
always @(posedge clk or posedge aclr_n)
begin
if(aclr_n)
    c <= c + 2'b01;
else
    c <= 2'b00;
end 
assign count_out = c;
endmodule