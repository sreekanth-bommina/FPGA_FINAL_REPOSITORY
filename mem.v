//Normal static Memory code without parameters
module mem(clk,rst,wr_rd,wdata,rdata,addr);
 input clk,rst,wr_rd;
 input [31:0]wdata;
 output [31:0]rdata;
 input [9:0]addr;
 reg[31:0]mem[1023:0]
    always@(posedge clk)begin
	   if(wr_rd) 
	     mem[addr]=wdata;

	   rdata=mem[addr];
	end
endmodule

//static memory VLSIGURU
module mem(clk,rst,wr_rd,wdata,rdata,addr,valid,ready);
 input clk,rst,wr_rd,valid;
 input [31:0]wdata;
 output reg[31:0]rdata;
 output reg ready;
 input [9:0]addr;
 reg[31:0]mem[1023:0]
    always@(posedge clk)begin
    	if(valid)begin
	       ready=1;
	       if(wr_rd) mem[addr]=wdata;
           else      rdata=mem[addr];
    	end
    	else ready=0;
    end
endmodule

