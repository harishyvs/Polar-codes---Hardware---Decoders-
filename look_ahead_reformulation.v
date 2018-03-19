`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/23/2018 12:22:14 AM
// Design Name:
// Module Name: lookAheadReformulation
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
module FMUX( A ,B ,C ,D  ,Sel ,Q );

output Q ;

input A ;
input B ;
input C ;
input D ;
input [1:0]Sel ;

assign Q = (A & (~Sel[0]) & (~(Sel[1])) |
     (B & (~Sel[0]) & (Sel[1])) |
     (C & Sel[0] & (~Sel[1])) |
     (D & Sel[0] & Sel[1]));

endmodule
module MUX(
    A,
   B,
    sel,
    Q
    );

    input A;
    input B;
    input sel;
    output Q;
    wire not_sel;
    wire temp1,temp2;
    wire Data_out_temp;

    not n1(not_sel,sel);
    and and_1(temp1,A,not_sel);
    and and_2(temp2,B,sel);
    or or_1(Data_out_temp,temp1,temp2);
    assign Q= Data_out_temp;
    endmodule
module AND (a, b, y);
input a, b;
output y;
assign y = a & b;
endmodule

module OR (a, b, y);
input a, b;
output y;
assign y = a | b;
endmodule

module NOR (a, b, y);
input a, b;
output y;
assign y = ~(a | b);
endmodule

module XOR (a, b, y);
input a, b;
output y;
assign y = (a ^ b);
endmodule

module NOT(a,b);
    output b;
    input a;
    assign b=!a;
endmodule

module comp(
input [6:0]A,
input [6:0]B,
output reg Q
);

wire [6:0]temp1;
wire [6:0]temp2;
//XOR x1(.A(A[7]),.B(B[7]),.Q(temp));
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
   Q=1;
  end
    else
   begin
       Q=0;
   end
   end
endmodule

module signum(
input [7:0]A,
output reg  Q
);

always@(A)
begin
    if(A[7] == 1)
    begin
       Q = 0;
    end
    else
    begin
        Q = 1;
    end
end
endmodule


module p_node(
input sign_LLR_C , input sign_LLR_D ,input comp, input frozen1  ,input frozen2,output u2i_1 , output u2i
    );

    wire j,k,l,m,n,o,p,q,r,s,t,u;
    XOR X1(.a(sign_LLR_C),.b(sign_LLR_D),.y(j));
    NOT N1(.a(frozen1),.b(k));
    AND A1(.a(k),.b(j),.y(u2i_1));
    NOT N2(.a(frozen2),.b(l));
    NOT N3 (.a(comp),.b(m));
    AND A2(.a(comp),.b(l),.y(n));
    AND A3(.a(l),.b(m),.y(o));
    AND A4(.a(sign_LLR_D),.b(n),.y(p));
    AND A5(.a(frozen1),.b(sign_LLR_C),.y(q));
    AND A6(.a(sign_LLR_D),.b(k),.y(r));
    AND A7(.a(n),.b(q),.y(s));
   AND A8(.a(r),.b(n),.y(t));
    OR O1(.a(s),.b(t),.y(u));
    OR O2(.a(u),.b(p),.y(u2i));

endmodule

module psg(input A,input B,output [1:0]Q);
assign Q[0]= A^B;
assign Q[1]= B;
endmodule

module lookAheadReformulation(
input sig1,
input sig2,
input fr1,
input fr2,
output u3,
output u4
    );
wire a,b,c,d,e,f,g,h,i,j,k,l,u1,u2;
wire [1:0]u21;
MUX M1(.A(sig1),.B(sig2),.sel(0),.Q(a));
MUX M2(.A(fr1),.B(fr2),.sel(0),.Q(b));
MUX M3(.A(sig1),.B(sig2),.sel(1),.Q(c));
MUX M4(.A(fr1),.B(fr2),.sel(1),.Q(d));

p_node P1(.sign_LLR_C(a),.sign_LLR_D(b),.comp(0),.frozen1(0),.frozen2(0),.u2i_1(e) ,.u2i(f));
p_node P2(.sign_LLR_C(b),.sign_LLR_D(c),.comp(0),.frozen1(0),.frozen2(0),.u2i_1(g) ,.u2i(h));
p_node P3(.sign_LLR_C(c),.sign_LLR_D(d),.comp(0),.frozen1(0),.frozen2(0),.u2i_1(i) ,.u2i(j));
p_node P4(.sign_LLR_C(d),.sign_LLR_D(a),.comp(0),.frozen1(0),.frozen2(0),.u2i_1(k) ,.u2i(l));
p_node P5(.sign_LLR_C(sig1),.sign_LLR_D(sig2),.comp(0),.frozen1(fr1),.frozen2(fr2),.u2i_1(u1) ,.u2i(u2));

psg pg1(.A(u1),.B(u2),.Q(u21));
FMUX F1(.A(e),.B(g),.C(i),.D(k),.Sel(u21),.Q(u3));
FMUX F2(.A(f),.B(h),.C(j),.D(l),.Sel(u21),.Q(u4));

endmodule
