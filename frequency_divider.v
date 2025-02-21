`define TimeExpire 32'd2500
module frequency_divider(clock,reset,clk_div);
input clock,reset;
output reg clk_div;
reg [31:0]count;

always@(posedge clock or negedge reset)
begin
	if(!reset)
	begin
		count <= 32'd0;
		clk_div <= 1'b0;
	end
	else
	begin
		if(count == `TimeExpire)
		begin
			count <= 32'd0;
			clk_div=~clk_div;
		end
		else
		begin
			count <= count + 32'd1;
		end
	end
end

endmodule
