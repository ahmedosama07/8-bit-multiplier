module fulladder (
  	input [15:0] a,
    input [15:0] b,
    input cin,
  	output [15:0] sum,
    output cout
);

wire[15:0] c;

FA_1 f1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c[0]));
FA_1 f2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.cout(c[1]));
FA_1 f3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.cout(c[2]));
FA_1 f4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.cout(c[3]));
FA_1 f5(.a(a[4]),.b(b[4]),.cin(c[3]),.sum(sum[4]),.cout(c[4]));
FA_1 f6(.a(a[5]),.b(b[5]),.cin(c[4]),.sum(sum[5]),.cout(c[5]));
FA_1 f7(.a(a[6]),.b(b[6]),.cin(c[5]),.sum(sum[6]),.cout(c[6]));
FA_1 f8(.a(a[7]),.b(b[7]),.cin(c[6]),.sum(sum[7]),.cout(c[8]));
FA_1 f9(.a(a[8]),.b(b[8]),.cin(c[7]),.sum(sum[8]),.cout(c[9]));
FA_1 f10(.a(a[9]),.b(b[9]),.cin(c[8]),.sum(sum[9]),.cout(c[10]));
FA_1 f11(.a(a[10]),.b(b[10]),.cin(c[9]),.sum(sum[10]),.cout(c[11]));
FA_1 f12(.a(a[11]),.b(b[11]),.cin(c[10]),.sum(sum[11]),.cout(c[12]));
FA_1 f13(.a(a[12]),.b(b[12]),.cin(c[11]),.sum(sum[12]),.cout(c[13]));
FA_1 f14(.a(a[13]),.b(b[13]),.cin(c[12]),.sum(sum[13]),.cout(c[14]));
FA_1 f15(.a(a[14]),.b(b[14]),.cin(c[13]),.sum(sum[14]),.cout(c[15]));
FA_1 f16(.a(a[15]),.b(b[15]),.cin(c[14]),.sum(sum[15]),.cout(cout));    
endmodule