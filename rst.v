//Active High RESET(res_m)
module dff(clk,res_m,din,q);
    input clk,res_m,din;
	output reg q;
	always@(posedge clk)begin
	    q=~res&din;
	end
endmodule

//Active LOW RESET
module dff(clk,res_m,din,q);
    input clk,res_m,din;
	output reg q;
	always@(posedge clk)begin
	    q=res&din;
	end
endmodule
