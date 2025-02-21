module dot_matrix( 
    input clk,// Clock input
	 input [5:0]case_1, 
    input wire [3:0]cnt1,
    input wire [3:0]cnt2,
	 input state,
    input wire reset,    // Reset button input
    output reg [7:0] dot_row, // Dot matrix row control signals
    output reg [7:0] dot_col1,  // Dot matrix column control signals
    output reg [7:0] dot_col2
);
 
reg [2:0] row_count; // Counter for row selection
 

always @(posedge clk or negedge reset) 
begin
	if (~reset) 
		begin
			dot_row <= 8'b0;
			dot_col1 <= 8'b0;
			dot_col2 <= 8'b0;
			row_count <= 3'b0;
		end
		
	else
	begin
		if(state == 1'b1)
		begin
			row_count <= row_count + 3'd1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			if(case_1 == 6'd0)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00110001;dot_col1 <= 8'b10010001; end
				3'd1: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01010001; end
				3'd2: begin dot_col2 <= 8'b10000010;dot_col1 <= 8'b01011011; end
				3'd3: begin dot_col2 <= 8'b10000010;dot_col1 <= 8'b01010101; end
				3'd4: begin dot_col2 <= 8'b10011011;dot_col1 <= 8'b11010001; end
				3'd5: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b01010001; end
				3'd6: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b01010001; end
				3'd7: begin dot_col2 <= 8'b00110010;dot_col1 <= 8'b01010001; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd1)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01100011;dot_col1 <= 8'b00100010; end
				3'd1: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10100010; end
				3'd2: begin dot_col2 <= 8'b00000100;dot_col1 <= 8'b10110110; end
				3'd3: begin dot_col2 <= 8'b00000100;dot_col1 <= 8'b10101010; end
				3'd4: begin dot_col2 <= 8'b00110111;dot_col1 <= 8'b10100010; end
				3'd5: begin dot_col2 <= 8'b00010100;dot_col1 <= 8'b10100010; end
				3'd6: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b10100010; end
				3'd7: begin dot_col2 <= 8'b01100100;dot_col1 <= 8'b10100010; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd2)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11000110;dot_col1 <= 8'b01000101; end
				3'd1: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01000101; end
				3'd2: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01101101; end
				3'd3: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01010101; end
				3'd4: begin dot_col2 <= 8'b01101111;dot_col1 <= 8'b01000101; end
				3'd5: begin dot_col2 <= 8'b00101001;dot_col1 <= 8'b01000101; end
				3'd6: begin dot_col2 <= 8'b00101001;dot_col1 <= 8'b01000101; end
				3'd7: begin dot_col2 <= 8'b11001001;dot_col1 <= 8'b01000101; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd3)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10001100;dot_col1 <= 8'b10001011; end
				3'd1: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10001010; end
				3'd2: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b11011010; end
				3'd3: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10101010; end
				3'd4: begin dot_col2 <= 8'b11011110;dot_col1 <= 8'b10001011; end
				3'd5: begin dot_col2 <= 8'b01010010;dot_col1 <= 8'b10001010; end
				3'd6: begin dot_col2 <= 8'b01010010;dot_col1 <= 8'b10001010; end
				3'd7: begin dot_col2 <= 8'b10010010;dot_col1 <= 8'b10001011; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd4)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00011001;dot_col1 <= 8'b00010111; end
				3'd1: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010100; end
				3'd2: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b10110100; end
				3'd3: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b01010100; end
				3'd4: begin dot_col2 <= 8'b10111101;dot_col1 <= 8'b00010111; end
				3'd5: begin dot_col2 <= 8'b10100101;dot_col1 <= 8'b00010100; end
				3'd6: begin dot_col2 <= 8'b10100101;dot_col1 <= 8'b00010100; end
				3'd7: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010111; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd5)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00110010;dot_col1 <= 8'b00101111; end
				3'd1: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd2: begin dot_col2 <= 8'b01001011;dot_col1 <= 8'b01101000; end
				3'd3: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b10101000; end
				3'd4: begin dot_col2 <= 8'b01111010;dot_col1 <= 8'b00101111; end
				3'd5: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd6: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd7: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101111; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd6)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01100100;dot_col1 <= 8'b01011110; end
				3'd1: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd2: begin dot_col2 <= 8'b10010110;dot_col1 <= 8'b11010000; end
				3'd3: begin dot_col2 <= 8'b10010101;dot_col1 <= 8'b01010000; end
				3'd4: begin dot_col2 <= 8'b11110100;dot_col1 <= 8'b01011110; end
				3'd5: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd6: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd7: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01011110; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd7)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11001000;dot_col1 <= 8'b10111100; end
				3'd1: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd2: begin dot_col2 <= 8'b00101101;dot_col1 <= 8'b10100001; end
				3'd3: begin dot_col2 <= 8'b00101010;dot_col1 <= 8'b10100001; end
				3'd4: begin dot_col2 <= 8'b11101000;dot_col1 <= 8'b10111101; end
				3'd5: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd6: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd7: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10111100; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd8)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10010001;dot_col1 <= 8'b01111001; end
				3'd1: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd2: begin dot_col2 <= 8'b01011011;dot_col1 <= 8'b01000010; end
				3'd3: begin dot_col2 <= 8'b01010101;dot_col1 <= 8'b01000010; end
				3'd4: begin dot_col2 <= 8'b11010001;dot_col1 <= 8'b01111010; end
				3'd5: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd6: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd7: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01111001; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd9)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00100010;dot_col1 <= 8'b11110011; end
				3'd1: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000100; end
				3'd2: begin dot_col2 <= 8'b10110110;dot_col1 <= 8'b10000100; end
				3'd3: begin dot_col2 <= 8'b10101010;dot_col1 <= 8'b10000100; end
				3'd4: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b11110100; end
				3'd5: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000100; end
				3'd6: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000100; end
				3'd7: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b11110011; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd10)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b11100110; end
				3'd1: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001001; end
				3'd2: begin dot_col2 <= 8'b01101101;dot_col1 <= 8'b00001001; end
				3'd3: begin dot_col2 <= 8'b01010101;dot_col1 <= 8'b00001001; end
				3'd4: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b11101001; end
				3'd5: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001001; end
				3'd6: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001001; end
				3'd7: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b11100110; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd11)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11001100; end
				3'd1: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd2: begin dot_col2 <= 8'b11011010;dot_col1 <= 8'b00010010; end
				3'd3: begin dot_col2 <= 8'b10101010;dot_col1 <= 8'b00010010; end
				3'd4: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11010010; end
				3'd5: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd6: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd7: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11001100; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd12)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00010111;dot_col1 <= 8'b10011001; end
				3'd1: begin dot_col2 <= 8'b00010100;dot_col1 <= 8'b00100101; end
				3'd2: begin dot_col2 <= 8'b10110100;dot_col1 <= 8'b00100101; end
				3'd3: begin dot_col2 <= 8'b01010100;dot_col1 <= 8'b00100101; end
				3'd4: begin dot_col2 <= 8'b00010111;dot_col1 <= 8'b10100101; end
				3'd5: begin dot_col2 <= 8'b00010100;dot_col1 <= 8'b00100101; end
				3'd6: begin dot_col2 <= 8'b00010100;dot_col1 <= 8'b00100100; end
				3'd7: begin dot_col2 <= 8'b00010111;dot_col1 <= 8'b10011000; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd13)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00101111;dot_col1 <= 8'b00110010; end
				3'd1: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b01001010; end
				3'd2: begin dot_col2 <= 8'b01101000;dot_col1 <= 8'b01001010; end
				3'd3: begin dot_col2 <= 8'b10101000;dot_col1 <= 8'b01001010; end
				3'd4: begin dot_col2 <= 8'b00101111;dot_col1 <= 8'b01001010; end
				3'd5: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b01001010; end
				3'd6: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b01001001; end
				3'd7: begin dot_col2 <= 8'b00101111;dot_col1 <= 8'b00110000; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd14)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01011110;dot_col1 <= 8'b01100100; end
				3'd1: begin dot_col2 <= 8'b01010000;dot_col1 <= 8'b10010100; end
				3'd2: begin dot_col2 <= 8'b11010000;dot_col1 <= 8'b10010100; end
				3'd3: begin dot_col2 <= 8'b01010000;dot_col1 <= 8'b10010100; end
				3'd4: begin dot_col2 <= 8'b01011110;dot_col1 <= 8'b10010100; end
				3'd5: begin dot_col2 <= 8'b01010000;dot_col1 <= 8'b10010100; end
				3'd6: begin dot_col2 <= 8'b01010000;dot_col1 <= 8'b10010010; end
				3'd7: begin dot_col2 <= 8'b01011110;dot_col1 <= 8'b01100001; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd15)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10111100;dot_col1 <= 8'b11001000; end
				3'd1: begin dot_col2 <= 8'b10100001;dot_col1 <= 8'b00101000; end
				3'd2: begin dot_col2 <= 8'b10100001;dot_col1 <= 8'b00101000; end
				3'd3: begin dot_col2 <= 8'b10100001;dot_col1 <= 8'b00101000; end
				3'd4: begin dot_col2 <= 8'b10111101;dot_col1 <= 8'b00101000; end
				3'd5: begin dot_col2 <= 8'b10100001;dot_col1 <= 8'b00101000; end
				3'd6: begin dot_col2 <= 8'b10100001;dot_col1 <= 8'b00100101; end
				3'd7: begin dot_col2 <= 8'b10111100;dot_col1 <= 8'b11000010; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd16)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01111001;dot_col1 <= 8'b10010001; end
				3'd1: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01010001; end
				3'd2: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01010001; end
				3'd3: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01010001; end
				3'd4: begin dot_col2 <= 8'b01111010;dot_col1 <= 8'b01010001; end
				3'd5: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01010001; end
				3'd6: begin dot_col2 <= 8'b01000010;dot_col1 <= 8'b01001010; end
				3'd7: begin dot_col2 <= 8'b01111001;dot_col1 <= 8'b10000100; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd17)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11110011;dot_col1 <= 8'b00100010; end
				3'd1: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10100010; end
				3'd2: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10100010; end
				3'd3: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10100010; end
				3'd4: begin dot_col2 <= 8'b11110100;dot_col1 <= 8'b10100010; end
				3'd5: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10100010; end
				3'd6: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b10010100; end
				3'd7: begin dot_col2 <= 8'b11110011;dot_col1 <= 8'b00001000; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd18)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11100110;dot_col1 <= 8'b01000101; end
				3'd1: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01000101; end
				3'd2: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01000101; end
				3'd3: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01000101; end
				3'd4: begin dot_col2 <= 8'b11101001;dot_col1 <= 8'b01000101; end
				3'd5: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b01000101; end
				3'd6: begin dot_col2 <= 8'b00001001;dot_col1 <= 8'b00101001; end
				3'd7: begin dot_col2 <= 8'b11100110;dot_col1 <= 8'b00010001; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd19)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11001100;dot_col1 <= 8'b10001011; end
				3'd1: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10001010; end
				3'd2: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10001010; end
				3'd3: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10001010; end
				3'd4: begin dot_col2 <= 8'b11010010;dot_col1 <= 8'b10001011; end
				3'd5: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b10001010; end
				3'd6: begin dot_col2 <= 8'b00010010;dot_col1 <= 8'b01010010; end
				3'd7: begin dot_col2 <= 8'b11001100;dot_col1 <= 8'b00100011; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd20)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10011001;dot_col1 <= 8'b00010111; end
				3'd1: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010100; end
				3'd2: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010100; end
				3'd3: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010100; end
				3'd4: begin dot_col2 <= 8'b10100101;dot_col1 <= 8'b00010111; end
				3'd5: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00010100; end
				3'd6: begin dot_col2 <= 8'b00100100;dot_col1 <= 8'b10100100; end
				3'd7: begin dot_col2 <= 8'b10011000;dot_col1 <= 8'b01000111; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd21)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00110010;dot_col1 <= 8'b00101111; end
				3'd1: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd2: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd3: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd4: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101111; end
				3'd5: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b00101000; end
				3'd6: begin dot_col2 <= 8'b01001001;dot_col1 <= 8'b01001000; end
				3'd7: begin dot_col2 <= 8'b00110000;dot_col1 <= 8'b10001111; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd22)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01100100;dot_col1 <= 8'b01011110; end
				3'd1: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd2: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd3: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd4: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01011110; end
				3'd5: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b01010000; end
				3'd6: begin dot_col2 <= 8'b10010010;dot_col1 <= 8'b10010000; end
				3'd7: begin dot_col2 <= 8'b01100001;dot_col1 <= 8'b00011110; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd23)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b11001000;dot_col1 <= 8'b10111101; end
				3'd1: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd2: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd3: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd4: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10111101; end
				3'd5: begin dot_col2 <= 8'b00101000;dot_col1 <= 8'b10100001; end
				3'd6: begin dot_col2 <= 8'b00100101;dot_col1 <= 8'b00100001; end
				3'd7: begin dot_col2 <= 8'b11000010;dot_col1 <= 8'b00111101; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd24)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10010001;dot_col1 <= 8'b01111011; end
				3'd1: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd2: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd3: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000011; end
				3'd4: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01111011; end
				3'd5: begin dot_col2 <= 8'b01010001;dot_col1 <= 8'b01000010; end
				3'd6: begin dot_col2 <= 8'b01001010;dot_col1 <= 8'b01000010; end
				3'd7: begin dot_col2 <= 8'b10000100;dot_col1 <= 8'b01111010; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd25)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b00100010;dot_col1 <= 8'b11110111; end
				3'd1: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000100; end
				3'd2: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000100; end
				3'd3: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000111; end
				3'd4: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b11110110; end
				3'd5: begin dot_col2 <= 8'b10100010;dot_col1 <= 8'b10000101; end
				3'd6: begin dot_col2 <= 8'b10010100;dot_col1 <= 8'b10000100; end
				3'd7: begin dot_col2 <= 8'b00001000;dot_col1 <= 8'b11110100; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd26)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b11101111; end
				3'd1: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001001; end
				3'd2: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001001; end
				3'd3: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001111; end
				3'd4: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b11101100; end
				3'd5: begin dot_col2 <= 8'b01000101;dot_col1 <= 8'b00001010; end
				3'd6: begin dot_col2 <= 8'b00101001;dot_col1 <= 8'b00001001; end
				3'd7: begin dot_col2 <= 8'b00010001;dot_col1 <= 8'b11101001; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else if(case_1 == 6'd27)
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11011110; end
				3'd1: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd2: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd3: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00011110; end
				3'd4: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11011000; end
				3'd5: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010100; end
				3'd6: begin dot_col2 <= 8'b01010010;dot_col1 <= 8'b00010010; end
				3'd7: begin dot_col2 <= 8'b00100011;dot_col1 <= 8'b11010010; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		else
		begin
			case(row_count)
				3'd0: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11011110; end
				3'd1: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd2: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010010; end
				3'd3: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00011110; end
				3'd4: begin dot_col2 <= 8'b10001011;dot_col1 <= 8'b11011000; end
				3'd5: begin dot_col2 <= 8'b10001010;dot_col1 <= 8'b00010100; end
				3'd6: begin dot_col2 <= 8'b01010010;dot_col1 <= 8'b00010010; end
				3'd7: begin dot_col2 <= 8'b00100011;dot_col1 <= 8'b11010010; end
				default: begin dot_col2 <= 8'b11111111;dot_col1 <= 8'b11111111; end
			endcase
		end
		end
		
		else
		begin
				row_count <= row_count + 1;
				case (row_count)
					3'b000: dot_row <= 8'b01111111;
					3'b001: dot_row <= 8'b10111111;
					3'b010: dot_row <= 8'b11011111;
					3'b011: dot_row <= 8'b11101111;
					3'b100: dot_row <= 8'b11110111;
					3'b101: dot_row <= 8'b11111011;
					3'b110: dot_row <= 8'b11111101;
					3'b111: dot_row <= 8'b11111110;
				endcase
	 
				if (cnt1==4'd0)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000010;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b01000010;
					3'b100: dot_col1 <= 8'b01000010;
					3'b101: dot_col1 <= 8'b01000010;
					3'b110: dot_col1 <= 8'b01000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
			  
				else if (cnt1==4'd1)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b00001000;
					3'b001: dot_col1 <= 8'b00001000;
					3'b010: dot_col1 <= 8'b00001000;
					3'b011: dot_col1 <= 8'b00001000;
					3'b100: dot_col1 <= 8'b00001000;
					3'b101: dot_col1 <= 8'b00001000;
					3'b110: dot_col1 <= 8'b00001000;
					3'b111: dot_col1 <= 8'b00001000;
				endcase
				end
			  
				else if (cnt1==4'd2)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b00000010;
					3'b010: dot_col1 <= 8'b00000010;
					3'b011: dot_col1 <= 8'b00000010;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b01000000;
					3'b110: dot_col1 <= 8'b01000000;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt1==4'd3)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b00000010;
					3'b010: dot_col1 <= 8'b00000010;
					3'b011: dot_col1 <= 8'b00000010;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b00000010;
					3'b110: dot_col1 <= 8'b00000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt1==4'd4)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01000010;
					3'b001: dot_col1 <= 8'b01000010;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b01000010;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b00000010;
					3'b110: dot_col1 <= 8'b00000010;
					3'b111: dot_col1 <= 8'b00000010;
				endcase
				end
	 
				else if (cnt1==4'd5)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000000;
					3'b010: dot_col1 <= 8'b01000000;
					3'b011: dot_col1 <= 8'b01000000;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b00000010;
					3'b110: dot_col1 <= 8'b00000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt1==4'd6)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000000;
					3'b010: dot_col1 <= 8'b01000000;
					3'b011: dot_col1 <= 8'b01000000;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b01000010;
					3'b110: dot_col1 <= 8'b01000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt1==4'd7)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000010;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b01000010;
					3'b100: dot_col1 <= 8'b00000010;
					3'b101: dot_col1 <= 8'b00000010;
					3'b110: dot_col1 <= 8'b00000010;
					3'b111: dot_col1 <= 8'b00000010;
				endcase
				end
	 
				else if (cnt1==4'd8)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000010;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b01000010;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b01000010;
					3'b110: dot_col1 <= 8'b01000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt1==4'd9)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b01111110;
					3'b001: dot_col1 <= 8'b01000010;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b01000010;
					3'b100: dot_col1 <= 8'b01111110;
					3'b101: dot_col1 <= 8'b00000010;
					3'b110: dot_col1 <= 8'b00000010;
					3'b111: dot_col1 <= 8'b01111110;
				endcase
				end
	 
				else// if (cnt1==4'd10)
				begin
				case (row_count)
					3'b000: dot_col1 <= 8'b00011000;
					3'b001: dot_col1 <= 8'b00100100;
					3'b010: dot_col1 <= 8'b01000010;
					3'b011: dot_col1 <= 8'b00000100;
					3'b100: dot_col1 <= 8'b00001000;
					3'b101: dot_col1 <= 8'b00001000;
					3'b110: dot_col1 <= 8'b00000000;
					3'b111: dot_col1 <= 8'b00001000;
				endcase
				end
	 
				if (cnt2==4'd0)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000010;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b01000010;
					3'b100: dot_col2 <= 8'b01000010;
					3'b101: dot_col2 <= 8'b01000010;
					3'b110: dot_col2 <= 8'b01000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd1)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b00001000;
					3'b001: dot_col2 <= 8'b00001000;
					3'b010: dot_col2 <= 8'b00001000;
					3'b011: dot_col2 <= 8'b00001000;
					3'b100: dot_col2 <= 8'b00001000;
					3'b101: dot_col2 <= 8'b00001000;
					3'b110: dot_col2 <= 8'b00001000;
					3'b111: dot_col2 <= 8'b00001000;
				endcase
				end
	 
				else if (cnt2==4'd2)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b00000010;
					3'b010: dot_col2 <= 8'b00000010;
					3'b011: dot_col2 <= 8'b00000010;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b01000000;
					3'b110: dot_col2 <= 8'b01000000;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd3)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b00000010;
					3'b010: dot_col2 <= 8'b00000010;
					3'b011: dot_col2 <= 8'b00000010;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b00000010;
					3'b110: dot_col2 <= 8'b00000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd4)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01000010;
					3'b001: dot_col2 <= 8'b01000010;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b01000010;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b00000010;
					3'b110: dot_col2 <= 8'b00000010;
					3'b111: dot_col2 <= 8'b00000010;
				endcase
				end
	 
				else if (cnt2==4'd5)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000000;
					3'b010: dot_col2 <= 8'b01000000;
					3'b011: dot_col2 <= 8'b01000000;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b00000010;
					3'b110: dot_col2 <= 8'b00000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd6)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000000;
					3'b010: dot_col2 <= 8'b01000000;
					3'b011: dot_col2 <= 8'b01000000;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b01000010;
					3'b110: dot_col2 <= 8'b01000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd7)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000010;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b01000010;
					3'b100: dot_col2 <= 8'b00000010;
					3'b101: dot_col2 <= 8'b00000010;
					3'b110: dot_col2 <= 8'b00000010;
					3'b111: dot_col2 <= 8'b00000010;
				endcase
				end
	 
				else if (cnt2==4'd8)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000010;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b01000010;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b01000010;
					3'b110: dot_col2 <= 8'b01000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else if (cnt2==4'd9)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b01111110;
					3'b001: dot_col2 <= 8'b01000010;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b01000010;
					3'b100: dot_col2 <= 8'b01111110;
					3'b101: dot_col2 <= 8'b00000010;
					3'b110: dot_col2 <= 8'b00000010;
					3'b111: dot_col2 <= 8'b01111110;
				endcase
				end
	 
				else// if (cnt2==4'd10)
				begin
				case (row_count)
					3'b000: dot_col2 <= 8'b00011000;
					3'b001: dot_col2 <= 8'b00100100;
					3'b010: dot_col2 <= 8'b01000010;
					3'b011: dot_col2 <= 8'b00000100;
					3'b100: dot_col2 <= 8'b00001000;
					3'b101: dot_col2 <= 8'b00001000;
					3'b110: dot_col2 <= 8'b00000000;
					3'b111: dot_col2 <= 8'b00001000;
				endcase
				end
			end
	end
end
 
endmodule