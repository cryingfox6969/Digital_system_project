module seven_display_for_num(state,cnt,out);
input [3:0]cnt;
input state;
output reg[6:0]out;

always @(cnt)
begin
	if(state == 0)
	begin
	case(cnt)
		4'b0000:out=7'b1000000;
		4'b0001:out=7'b1111001;
		4'b0010:out=7'b0100100;
		4'b0011:out=7'b0110000;
		4'b0100:out=7'b0011001;
		4'b0101:out=7'b0010010;
		4'b0110:out=7'b0000010;
		4'b0111:out=7'b1111000;
		4'b1000:out=7'b0000000;
		4'b1001:out=7'b0010000;
		default:out=7'b0111111;
		endcase
	end
	else
	begin
		out=7'b1111111;
	end
end

endmodule

