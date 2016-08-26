module test;

	reg clk;
	reg reset;
	reg [7:0] IN;
	wire [7:0] writedata;
	wire memWr;
	wire [7:0] OUT;
	wire [7:0] data;
	wire [5:0] count;
	wire Aload;
	
// instantiate device to be tested	
top tp(clk,reset,IN,writedata,memWr,OUT,data,count,Aload);
	
// initialize test
initial
begin
reset <= 1; # 22; reset <= 0;
end

always
begin
clk <= 1;
 # 10; 
 clk <= 0;
 # 10; // clock duration
end
			
//check results
always@(negedge clk)
begin
if(count == 6'd22)begin
$display("Test Finished");
$stop; 
end
end
	
endmodule