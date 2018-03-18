// Code
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/22/2018 05:00:15 PM
// Design Name:
// Module Name: Adder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module Half_adder(
   input p,
   input q,
   output S,
   output C
   );
   assign C=p&q;
   assign S=p^q;
endmodule

module Full_adder(
   input IN,
   input IN2,
   input Cin,
   output R,
   output Cout
   );
   wire x1;
   wire y1;
   wire z;
   Half_adder Ha1(.p(IN),.q(IN2),.S(x1),.C(y1));
   Half_adder Ha2(.p(x1),.q(Cin),.S(R),.C(z));
   assign Cout=y1|z;
endmodule

module Adder(
   input [7:0]A,
   input [7:0]B,
   output [9:0]Q
 );
   wire w0;
   wire w1;
   wire w2;
   wire w3;
   wire w4;
   wire w5;
   wire w6;



   Full_adder Fa0(.IN(A[0]),.IN2(B[0]),.Cin(0),.R(Q[0]),.Cout(w0));
   Full_adder Fa1(.IN(A[1]),.IN2(B[1]),.Cin(w0),.R(Q[1]),.Cout(w1));
   Full_adder Fa2(.IN(A[2]),.IN2(B[2]),.Cin(w1),.R(Q[2]),.Cout(w2));
   Full_adder Fa3(.IN(A[3]),.IN2(B[3]),.Cin(w2),.R(Q[3]),.Cout(w3));
   Full_adder Fa4(.IN(A[4]),.IN2(B[4]),.Cin(w3),.R(Q[4]),.Cout(w4));
   Full_adder Fa5(.IN(A[5]),.IN2(B[5]),.Cin(w4),.R(Q[5]),.Cout(w5));
   Full_adder Fa6(.IN(A[6]),.IN2(B[6]),.Cin(w5),.R(Q[6]),.Cout(w6));
   Full_adder Fa7(.IN(A[7]),.IN2(B[7]),.Cin(w6),.R(Q[7]),.Cout(Q[8]));
   assign Q[9]= 0;
endmodule

module Subtracter(
   input [7:0]A,
   input [7:0]B,
   output [9:0]Q
 );
   wire w0;
   wire w1;
   wire w2;
   wire w3;
   wire w4;
   wire w5;
   wire w6;
   wire w7;



   Full_adder Fa0(.IN(A[0]),.IN2(~B[0]),.Cin(1),.R(Q[0]),.Cout(w0));
   Full_adder Fa1(.IN(A[1]),.IN2(~B[1]),.Cin(w0),.R(Q[1]),.Cout(w1));
   Full_adder Fa2(.IN(A[2]),.IN2(~B[2]),.Cin(w1),.R(Q[2]),.Cout(w2));
   Full_adder Fa3(.IN(A[3]),.IN2(~B[3]),.Cin(w2),.R(Q[3]),.Cout(w3));
   Full_adder Fa4(.IN(A[4]),.IN2(~B[4]),.Cin(w3),.R(Q[4]),.Cout(w4));
   Full_adder Fa5(.IN(A[5]),.IN2(~B[5]),.Cin(w4),.R(Q[5]),.Cout(w5));
   Full_adder Fa6(.IN(A[6]),.IN2(~B[6]),.Cin(w5),.R(Q[6]),.Cout(w6));
   Full_adder Fa7(.IN(A[7]),.IN2(~B[7]),.Cin(w6),.R(Q[7]),.Cout(w7));
   Full_adder Fa8(.IN(0),.IN2(1),.Cin(w7),.R(Q[8]),.Cout(Q[9]));
   assign Q[9] = 0;

endmodule


module C2S(
   input [9:0]A,
   output reg [9:0]Q
);
wire [9:0] temp; // Two's of A
wire [9:0]x ;
Full_adder Fa0(.IN(~A[0]),.IN2(0),.Cin(1),.R(temp[0]),.Cout(x[0]));
Full_adder Fa1(.IN(~A[1]),.IN2(0),.Cin(x[0]),.R(temp[1]),.Cout(x[1]));
Full_adder Fa2(.IN(~A[2]),.IN2(0),.Cin(x[1]),.R(temp[2]),.Cout(x[2]));
Full_adder Fa3(.IN(~A[3]),.IN2(0),.Cin(x[2]),.R(temp[3]),.Cout(x[3]));
Full_adder Fa4(.IN(~A[4]),.IN2(0),.Cin(x[3]),.R(temp[4]),.Cout(x[4]));
Full_adder Fa5(.IN(~A[5]),.IN2(0),.Cin(x[4]),.R(temp[5]),.Cout(x[5]));
Full_adder Fa6(.IN(~A[6]),.IN2(0),.Cin(x[5]),.R(temp[6]),.Cout(x[6]));
Full_adder Fa7(.IN(~A[7]),.IN2(0),.Cin(x[6]),.R(temp[7]),.Cout(x[7]));
Full_adder Fa8(.IN(~A[8]),.IN2(0),.Cin(x[7]),.R(temp[8]),.Cout(x[8]));
Full_adder Fa9(.IN(~A[9]),.IN2(0),.Cin(x[8]),.R(temp[9]),.Cout(x[9]));

always@(A)
begin
   if (A[8] == 1)
       begin
            Q = temp;
       end
   else
       begin
            Q = A;
       end
end
endmodule

module S2C(
   input [7:0]A,
   output reg [7:0]Q
);
wire [7:0] temp; // Two's of A
wire [9:0]x ;
Full_adder Fa0(.IN(~A[0]),.IN2(0),.Cin(1),.R(temp[0]),.Cout(x[0]));
Full_adder Fa1(.IN(~A[1]),.IN2(0),.Cin(x[0]),.R(temp[1]),.Cout(x[1]));
Full_adder Fa2(.IN(~A[2]),.IN2(0),.Cin(x[1]),.R(temp[2]),.Cout(x[2]));
Full_adder Fa3(.IN(~A[3]),.IN2(0),.Cin(x[2]),.R(temp[3]),.Cout(x[3]));
Full_adder Fa4(.IN(~A[4]),.IN2(0),.Cin(x[3]),.R(temp[4]),.Cout(x[4]));
Full_adder Fa5(.IN(~A[5]),.IN2(0),.Cin(x[4]),.R(temp[5]),.Cout(x[5]));
Full_adder Fa6(.IN(~A[6]),.IN2(0),.Cin(x[5]),.R(temp[6]),.Cout(x[6]));
Full_adder Fa7(.IN(~A[7]),.IN2(0),.Cin(x[6]),.R(temp[7]),.Cout(x[7]));

always@(A)
begin
   if (A[7] == 1)
       begin
            Q = temp;
       end
   else
       begin
            Q = A;
       end
end
endmodule


module signum(
input [7:0]A,
output reg Q
);

always@(A)
begin
   if(A[7] == 1)
   begin
       assign Q = 0;
   end
   else
   begin
       assign Q = 1;
   end
end
endmodule


module XOR(
   input A,
   input B,
   output reg Q
);

always@(A or B)
begin
   if (A == B)
   begin
        Q = 0;
   end
   else
   begin
       Q = 1;
   end
end
endmodule

module Fnode(
input [7:0]A,
input [7:0]B,
output reg [7:0]Q
);
wire temp;
wire [7:0]temp1;
wire [7:0]temp2;
XOR x1(.A(A[7]),.B(B[7]),.Q(temp));
assign temp1[0] = A[0];
assign temp1[1] = A[1];
assign temp1[2] = A[2];
assign temp1[3] = A[3];
assign temp1[4] = A[4];
assign temp1[5] = A[5];
assign temp1[6] = A[6];
assign temp2[0] = B[0];
assign temp2[1] = B[1];
assign temp2[2] = B[2];
assign temp2[3] = B[3];
assign temp2[4] = B[4];
assign temp2[5] = B[5];
assign temp2[6] = B[6];

always@(A or B)
begin
if (temp1 > temp2)
  begin
   Q[0] = temp1[0];
   Q[1] = temp1[1];
   Q[2] = temp1[2];
   Q[3] = temp1[3];
   Q[4] = temp1[4];
   Q[5] = temp1[5];
   Q[6] = temp1[6];
 end


  else
  begin
      Q[0] = temp2[0];
  Q[1] = temp2[1];
  Q[2] = temp2[2];
  Q[3] = temp2[3];
  Q[4] = temp2[4];
  Q[5] = temp2[5];
  Q[6] = temp2[6];

  end
  Q[7] = temp;
end
endmodule

module Gnode(input [7:0]A, input [7:0]B, output  [9:0]W, output [9:0]R);
wire [7:0]h;
wire [9:0]u;
wire [7:0]g;
wire [9:0]b;
S2C S1(.A(A),.Q(h));
S2C S2(.A(B),.Q(g));

Adder A1(.A(h),.B(g),.Q(u));
Subtracter Sub1(.A(h),.B(g),.Q(b));

C2S C1(.A(u),.Q(W));
C2S C2(.A(b),.Q(R));

endmodule

module finalPE(
input [7:0]LLR_c,
input [7:0]LLR_d,
output [7:0]LLR_a,
output [9:0]LLR_csd, //sum
output [9:0]LLR_cdd //diff
);

Gnode G1(.A(LLR_c),.B(LLR_d),.W(LLR_csd),.R(LLR_cdd));
Fnode F1(.A(LLR_c),.B(LLR_d),.Q(LLR_a));

endmodule
