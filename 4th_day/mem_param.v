//Normal static Memory code with parameters
parameter DEPTH=1024;
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

//static memory VLSIGURU
module mem(clk,rst,wr_rd,wdata,rdata,addr,valid,ready);
 input clk,rst,wr_rd,valid;
 input [WIDTH-1:0]wdata;
 output reg[WIDTH-1:0]rdata;
 output reg ready;
 input [ADDR_WIDTH-1:0]addr;
 reg[WIDTH-1:0]mem[DEPTH-1:0]
    always@(posedge clk)begin
    	if(valid)begin
	       ready=1;
	       if(wr_rd) mem[addr]=wdata;
           else      rdata=mem[addr];
    	end
    	else ready=0;
    end
endmodule

