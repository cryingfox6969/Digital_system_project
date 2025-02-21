`define TimeExpire 32'd250000
module checkkeypad(clk,reset,button,subtract_button,state,keypadcol,keypadrow, game_state, k1, k2);

input clk,button;
input subtract_button;
input reset;
input state;
input [3:0] keypadcol;
output reg [3:0] keypadrow;
output reg [1:0] game_state;
output reg [3:0] k1, k2;
reg [31:0] keypaddelay;

always @(negedge button or negedge reset or negedge subtract_button)	
begin 
	if(!subtract_button)
	begin
		if(game_state < 2'd3) begin
			game_state = 2'd0;
		end
		else begin end
	end
	else
	begin
		if(!reset) begin
			game_state = 2'd0;
		end
		else
		begin
			game_state = game_state + 2'd1;		
		//		if(game_state == 2'd3) begin
		//		game_state = 4'd0;
		//		end
		//		else begin
		//			game_state <= game_state;
		//		end
		end
	end
end

always @(posedge clk or negedge reset or posedge state)
begin	
	if(state == 1)
	begin
		keypadrow <= 4'b1111;
	end
	else
	begin
		if(!reset)
		begin
			k1=4'd10;
			k2=4'd10;
		end
		else
		begin
			if(keypaddelay == `TimeExpire)
			begin
				keypaddelay = 31'd0;
				if(game_state == 2'd0)
				begin
					k1=4'd10;
					k2=4'd10;
				end
				else if(game_state == 2'd1)
				begin
				case({keypadrow,keypadcol})
					8'b1110_1110 : begin k1 = 4'h7; end
					8'b1110_1101 : begin k1 = 4'h4; end
					8'b1110_1011 : begin k1 = 4'h1; end
					8'b1110_0111 : begin k1 = 4'h0; end
					8'b1101_1110 : begin k1 = 4'h8; end
					8'b1101_1101 : begin k1 = 4'h5; end
					8'b1101_1011 : begin k1 = 4'h2; end
					8'b1101_0111 : begin k1 = k1; end
					8'b1011_1110 : begin k1 = 4'h9; end
					8'b1011_1101 : begin k1 = 4'h6; end
					8'b1011_1011 : begin k1 = 4'h3; end
					8'b1011_0111 : begin k1 = k1; end
					8'b0111_1110 : begin k1 = k1; end
					8'b0111_1101 : begin k1 = k1; end
					8'b0111_1011 : begin k1 = k1; end
					8'b0111_0111 : begin k1 = k1; end
					default : k1 = k1;
				endcase
				case(keypadrow)
					4'b1110: keypadrow = 4'b1101;
					4'b1101: keypadrow = 4'b1011;
					4'b1011: keypadrow = 4'b0111;
					4'b0111: keypadrow = 4'b1110;
					default : keypadrow = 4'b1110;
				endcase	
				end
				else if(game_state == 2'd2)
				begin
				case({keypadrow,keypadcol})
					8'b1110_1110 : begin k2 = 4'h7; end
					8'b1110_1101 : begin k2 = 4'h4; end
					8'b1110_1011 : begin k2 = 4'h1; end
					8'b1110_0111 : begin k2 = 4'h0; end
					8'b1101_1110 : begin k2 = 4'h8; end
					8'b1101_1101 : begin k2 = 4'h5; end
					8'b1101_1011 : begin k2 = 4'h2; end
					8'b1101_0111 : begin k2 = k2; end
					8'b1011_1110 : begin k2 = 4'h9; end
					8'b1011_1101 : begin k2 = 4'h6; end
					8'b1011_1011 : begin k2 = 4'h3; end
					8'b1011_0111 : begin k2 = k2; end
					8'b0111_1110 : begin k2 = k2; end
					8'b0111_1101 : begin k2 = k2; end
					8'b0111_1011 : begin k2 = k2; end
					8'b0111_0111 : begin k2 = k2; end
					default : k2 = k2;
				endcase
				case(keypadrow)
					4'b1110: keypadrow = 4'b1101;
					4'b1101: keypadrow = 4'b1011;
					4'b1011: keypadrow = 4'b0111;
					4'b0111: keypadrow = 4'b1110;
					default : keypadrow = 4'b1110;
				endcase	
				end
				else
				begin
					k1 = k1;
					k2 = k2;
				end
			end
			else
			begin
				keypaddelay = keypaddelay + 1'b1;
			end
		end
	end
end
endmodule
