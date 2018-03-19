`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 23.02.2018 09:46:01
// Design Name:
// Module Name: Pnodes
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

always@(A or B )
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

module psg(input u1,input u2,output o1,output o2);
assign o1= u1 ^ u2 ;
assign o2 = u2;
endmodule
module mux21(
    a,
    b,
    s,
    o
    );

    input a;
    input b;
    input s;
    output o;
    wire not_sel;
    wire temp1,temp2;
    wire Data_out_temp;

    not n1(not_sel,s);
    and and_1(temp1,a,not_sel);
    and and_2(temp2,b,s);
    or or_1(Data_out_temp,temp1,temp2);
    assign o= Data_out_temp;
    endmodule

   module Pnode(
    input sign_LLR_C , input sign_LLR_D ,input comp1,input frozen1  ,input frozen2,output u2i_1 , output u2i
        );

        wire h,i,j,k,l,m,n,comp,o,p,q,r,s,t,u;

        XOR X1(.a(sign_LLR_C),.b(sign_LLR_D),.y(j));
        NOT N1(.a(frozen1),.b(k));
        AND A1(.a(k),.b(j),.y(u2i_1));
        NOT N2(.a(frozen2),.b(l));
        NOT N3 (.a(comp1),.b(m));
        AND A2(.a(comp1),.b(l),.y(n));
        AND A3(.a(l),.b(m),.y(o));
        AND A4(.a(sign_LLR_D),.b(n),.y(p));
        AND A5(.a(frozen1),.b(sign_LLR_C),.y(q));
        AND A6(.a(sign_LLR_D),.b(k),.y(r));
        AND A7(.a(n),.b(q),.y(s));
       AND A8(.a(r),.b(n),.y(t));
        OR O1(.a(s),.b(t),.y(u));
        OR O2(.a(u),.b(p),.y(u2i));

    endmodule



module succesive_computations_p_node(
input in1, input in2 ,output u3, output u4
    );
    wire p,q,r,s,y,h;
    Pnode P1(.sign_LLR_C(in1) , .sign_LLR_D(in2) ,.comp1(0),.frozen1(0)  ,.frozen2(0),.u2i_1(p) , .u2i(r));
    psg PG1(.u1(p),.u2(r),.o1(q),.o2(s));
    mux21 M1(.a(in1 ), .b(in2 ), .s(q), .o(y));
    mux21 M2(.a(in1 ), .b(in2 ), .s(s), .o(h));
    Pnode P2(.sign_LLR_C(y) , .sign_LLR_D(h) ,.comp1(0),.frozen1(0)  ,.frozen2(0),.u2i_1(u3 ) , .u2i(u4));

endmodule
