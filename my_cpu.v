module my_cpu(input clk,reset,
output[5:0] address,
output memWr,
output[7:0] writedata,
input [7:0] readdata,IN,
output [7:0] OUT,
output Aload
);

wire IRload,PCload,MRload,RFwr,outen;
//wire Aload;
wire MemInst;
wire [1:0] Jmpmuxsel,Shiftsel;
wire [1:0] Asel;
wire [2:0] ALUsel;
wire [7:0] instr;

controller fsm(clk,reset,instr,memWr,Jmpmuxsel,Shiftsel,Asel,IRload,PCload,MRload,
Aload,RFwr,outen,MemInst,ALUsel,writedata);

datapath DP(clk,reset,readdata,IRload,Jmpmuxsel,PCload,MemInst,MRload,
Asel,Aload,RFwr,ALUsel,Shiftsel,outen,IN,writedata,OUT,instr,address);

endmodule