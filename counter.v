module counter(clk1,state,reset,cnt);
input clk1,reset;
input state;
output reg [5:0] cnt;

always@(posedge clk1 or negedge reset)
begin
	if(!reset)
	begin
		cnt <= 6'd0;
	end
	else
	begin
		if(state == 1)
		begin
			if(cnt == 6'd27)
			begin
				cnt <= 6'd0;
			end
			else
			begin
				cnt <= cnt + 6'd1;
			end
		end
		else
		begin
			cnt <= 6'd0;
		end
	end
end
endmodule
