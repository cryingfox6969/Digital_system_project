module desh_display(state,cnt,out);
input [3:0]cnt;
input state;
output reg[6:0]out;

always @(cnt)
begin
	if(state == 0)
	begin
		out=7'b0111111;
	end
	else
	begin
		out=7'b1111111;
	end
end

endmodule

