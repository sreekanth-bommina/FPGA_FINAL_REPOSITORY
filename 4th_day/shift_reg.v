//without giving parameter
module shift_reg(clk,din,out);
   input clk,din;
   output reg out;
   integer count=0;
   reg[7:0]sh_reg;
   always@(posedge clk)begin
      if(count!=8)begin
	      sh_reg[count]=din;
		  count=count+1;
	  end
	  else begin
	     out=sh_reg[0];
		sh_reg={din,sh_reg[7:1]};
	  end
   end
endmodule

//With parameter of shift register length
parameter LENGTH=16;
module shift_reg(clk,din,out);
   input clk,din;
   output reg out;
   integer count=0;
   reg[LENGTH-1:0]sh_reg;
   always@(posedge clk)begin
      if(count!=LENGTH)begin
	      sh_reg[count]=din;
		  count=count+1;
	  end
	  else begin
	     out=sh_reg[0];
		sh_reg={din,sh_reg[LENGTH:1]};
	  end
   end
endmodule
