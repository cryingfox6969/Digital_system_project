module main( clk,button,keypadCol,keypadRow,reset,out1,out2,out3,out4,out5,out6,dot_row,dot_col1,dot_col2, subtract_button);

input clk;
input reset;
input button;
input subtract_button;
input [3:0]keypadCol;
output [6:0] out1,out2,out3,out4,out5,out6; //seven_display
output [3:0] keypadRow;
output [7:0] dot_row;
output [7:0] dot_col1;
output [7:0] dot_col2;


reg [7:0] bound1 = 7'd0;
reg [7:0] bound2 = 7'd99;
reg [1:0] game_state;
reg [7:0] total_input=7'd0;

wire clk_div;
wire clk_div2;
wire [5:0] case_1;
reg [3:0] key1, key2;
reg state = 1'b0;

reg [6:0]password = 7'd46;
reg [6:0]cnt = 7'd1;
reg [3:0]k1,k2;
reg [3:0]k3,k4;
reg [3:0]k5,k6;


frequency_divider2 u10(.clk(clk),.reset(reset),.clk_div(clk_div2));
counter u11(.clk1(clk_div2),.state(state),.reset(reset),.cnt(case_1));
checkkeypad u1(.clk(clk),.reset(reset),.button(button),.subtract_button(subtract_button),.state(state),.keypadcol(keypadCol),.keypadrow(keypadRow), .game_state(game_state), .k1(key1), .k2(key2));//, .subtract_button(subtract_button));
frequency_divider u2(.clock(clk),.reset(reset),.clk_div(clk_div));
dot_matrix u3(.clk(clk_div),.case_1(case_1),.cnt1(key2),.cnt2(key1),.state(state),.reset(reset),.dot_row(dot_row),.dot_col1(dot_col1),.dot_col2(dot_col2));



seven_display_for_num u4(.state(state),.cnt(k1),.out(out1));
seven_display_for_num u5(.state(state),.cnt(k2),.out(out2));
desh_display u6(.state(state),.cnt(k3),.out(out3));
desh_display u7(.state(state),.cnt(k4),.out(out4));
seven_display_for_num u8(.state(state),.cnt(k5),.out(out5));
seven_display_for_num u9(.state(state),.cnt(k6),.out(out6));


always @(posedge clk ) 
begin
   if(cnt == 7'd98)
      cnt = 7'd1;
	else 
      cnt = cnt + 7'd1;
end
always @(negedge reset) 
begin
   password = (cnt % 99);
end
always @(*)
begin
    k1 = bound2 % 10;
    k2 = bound2 / 10;
    k3 = password % 10;
    k4 = password / 10;
    k5 = bound1 % 10;
    k6 = bound1 / 10;
end

always @(negedge reset or posedge game_state)
begin
	if(!reset)
	begin
		bound1 = 7'd0;
		bound2 = 7'd99;
		state = 1'b0;
	end
	else
	begin
		if(game_state == 3 && key1 !=4'd10 && key2 != 4'd10)
		begin
			total_input = 10*key1 + key2;
			if(password == total_input)
			begin
				state = 1'b1;
			end
			else
			begin
				if(bound1 < total_input &&  total_input < password)
				begin
					bound1 = total_input;
				end
				else if(password < total_input && total_input < bound2)
				begin
					bound2 = total_input;
				end
				else
				begin
					state = 1'b1;
				end
			end
		end
		else begin end 
	end
end


endmodule
