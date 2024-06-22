`timescale 1ns / 1ns
module source(c, a, b);

input wire [1:0] a; // 2 bit
input wire [1:0] b; // 2 bit
output wire [1:0] c; // 2 bit

wire pn;
wire qn;
wire rn;
wire sn;

wire pnqnrs;
wire pnqr;
wire prn;
wire pnq;
wire pr;

not(pn, a[1]);
not(qn, a[0]);
not(rn, b[1]);
not(sn, b[0]);

and(pnqnrs,pn,qn,b[1],b[0]);
and(pnqr,pn,a[0],b[1]);
and(prn,a[1],rn);
and(pnq,pn,a[0]);
and(pr,a[1],b[1]);

or(c[1],pnqnrs,pnqr,prn);
or(c[0],pnqnrs,pnq,pr);

endmodule
