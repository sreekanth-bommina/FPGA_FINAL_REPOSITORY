//size of the memory is 50k bits==>size=width*Depth
//width=32 then Depth=size/Width==>(50*1024)/32==>Depth=1600
parameter DEPTH=1600;
parameter WIDTH=32;
parameter ADDR_WIDTH=$clog2(DEPTH);
module mem(clk,rst,wr_rd,wdata,rdata,addr);
 input clk,rst,wr_rd;
 input [WIDTH-1:0]wdata;
 output [WIDTH-1:0]rdata;
 input [ADDR_WIDTH-1:0]addr;
 reg[WIDTH-1:0]mem[DEPTH-1:0]
    always@(posedge clk)begin
	   if(wr_rd) 
	     mem[addr]=wdata;

	   rdata=mem[addr];
	end
endmodule
