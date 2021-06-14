module level3(input [7:0]a, input [5:0]key, output [7:0]out);
wire [5:0] x,y;
wire [4:0] p,q,r;
expansion e1([3:0]a,x);
assign y=x^key;
sbox s1(y,p);
permute p1(p,q);
assign r=q^a[7:4];
assign out={a[3:0],r};
endmodule

module expansion(input [3:0]a,output [6:0]b);
assign [5:1]b=[3:0]a;
assign b[0]=a[3];
assign b[5]=a[0];
endmodule

module permute(input [3:0]a,output [3:0]b);
assign b[0]=a[2];
assign b[1]=a[0];
assign b[2]=a[3];
assign b[3]=a[1];
endmodule

module sbox(intput [5:0]a, output [3:0]b);
reg [3:0]b;
always@(*) begin
case(a)
            6'b000000 : b = 4'b1110;
            6'b000010 : b = 4'b0100;
            6'b000100 : b = 4'b1101;
            6'b000110 : b = 4'b0001;
            6'b001000 : b = 4'b0010;
            6'b001010 : b = 4'b1111;
            6'b001100 : b = 4'b1011;
            6'b001110 : b = 4'b1000;
            6'b010000 : b = 4'b0011;
            6'b010010 : b = 4'b1010;
            6'b010100 : b = 4'b0110;
            6'b010110 : b = 4'b1100;
            6'b011000 : b = 4'b0101;
            6'b011010 : b = 4'b1001;
            6'b011100 : b = 4'b0000;
            6'b011110 : b = 4'b0111;
            
            6'b000001 : b = 4'b0000;
            6'b000011 : b = 4'b1111;
            6'b000101 : b = 4'b0111;
            6'b000111 : b = 4'b0100;
            6'b001001 : b = 4'b1110;
            6'b001011 : b = 4'b0010;
            6'b001101 : b = 4'b1101;
            6'b001111 : b = 4'b0001;
            6'b010001 : b = 4'b1010;
            6'b010011 : b = 4'b0110;
            6'b010101 : b = 4'b1100;
            6'b010111 : b = 4'b1011;
            6'b011001 : b = 4'b1001;
            6'b011011 : b = 4'b0101;
            6'b011101 : b = 4'b0011;
            6'b011111 : b = 4'b1000;
            
            6'b100000 : b = 4'b0100;
            6'b100010 : b = 4'b0001;
            6'b100100 : b = 4'b1110;
            6'b100110 : b = 4'b1000;
            6'b101000 : b = 4'b1101;
            6'b101010 : b = 4'b0110;
            6'b101100 : b = 4'b0010;
            6'b101110 : b = 4'b1011;
            6'b110000 : b = 4'b1111;
            6'b110010 : b = 4'b1100;
            6'b110100 : b = 4'b1001;
            6'b110110 : b = 4'b0111;
            6'b111000 : b = 4'b0011;
            6'b111010 : b = 4'b1100;
            6'b111100 : b = 4'b0101;
            6'b111110 : b = 4'b0000;
            
            6'b100001 : b = 4'b1111;
            6'b100011 : b = 4'b1100;
            6'b100101 : b = 4'b1000;
            6'b100111 : b = 4'b0010;
            6'b101001 : b = 4'b0100;
            6'b101011 : b = 4'b1001;
            6'b101101 : b = 4'b0001;
            6'b101111 : b = 4'b0111;
            6'b110001 : b = 4'b0101;
            6'b110011 : b = 4'b1101;
            6'b110101 : b = 4'b0011;
            6'b110111 : b = 4'b1110;
            6'b111001 : b = 4'b1100;
            6'b111011 : b = 4'b0000;
            6'b111101 : b = 4'b0110;
            6'b111111 : b = 4'b1101;
            endcase
            end
            endmodule

module test;
 reg [7:0]n;
 reg [5:0]k;
 wire [7:0]m;
 level3 test(n,k,m);
 initial 
 begin
 n=8'b10111011; k=6'b110010;
 #1 $display(" A= %d   K=%d   O=%d",n,k,m);
 $stop
 end
 endmodule
 
