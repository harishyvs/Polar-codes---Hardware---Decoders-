
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/22/2018 09:55:41 PM
// Design Name:
// Module Name: p_node
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
input [7:0]LLR_C , input [7:0]LLR_D ,input frozen1  ,input frozen2,output u2i_1 , output u2i
    );

    wire h,i,j,k,l,m,n,comp,o,p,q,r,s,t,u;
    signum S1(.A(LLR_C) , .Q(h));
    signum S2(.A(LLR_D),.Q(i));
    XOR X1(.a(h),.b(i),.y(j));
    NOT N1(.a(frozen1),.b(k));
    AND A1(.a(k),.b(j),.y(u2i_1));
    comp C1(.A(LLR_C),.B(LLR_D),.Q(comp));
    NOT N2(.a(frozen2),.b(l));
    NOT N3 (.a(comp),.b(m));
    AND A2(.a(comp),.b(l),.y(n));
    AND A3(.a(l),.b(m),.y(o));
    AND A4(.a(i),.b(n),.y(p));
    AND A5(.a(frozen1),.b(h),.y(q));
    AND A6(.a(i),.b(k),.y(r));
    AND A7(.a(n),.b(q),.y(s));
   AND A8(.a(r),.b(n),.y(t));
    OR O1(.a(s),.b(t),.y(u));
    OR O2(.a(u),.b(p),.y(u2i));

endmodule
