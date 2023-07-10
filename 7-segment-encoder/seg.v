module seg (data_in,data_out);

input [2:0] data_in;
output reg [6:0] data_out;

always @ (*)
begin 
 
 case (data_in)
  3'b000: data_out = 1111110;
  3'b001: data_out = 0110000;
  3'b010: data_out = 1101101;
  3'b011: data_out = 1111001;
  3'b100: data_out = 1001111;
  3'b101: data_out = 1001111;
  3'b110: data_out = 1001111;
  3'b111: data_out = 1001111;
 endcase
end

endmodule

module seg_testbench ();

reg[2:0] data_in;
wire [6:0] data_out;

initial 
begin
 
 data_in = 3'b000; #10;
 data_in = 3'b001; #10;
 data_in = 3'b010; #10;
 data_in = 3'b011; #10;
 data_in = 3'b100; #10;
 data_in = 3'b101; #10;
 data_in = 3'b110; #10;
 data_in = 3'b111; #10;

end
    initial 
    begin
    $display ("\t \t  Time data_in   data_out");
    $monitor ("%d \t\t %b \t\t %b", $time , data_in , data_out);
    end

    seg A ( data_in, data_out);
endmodule
