module frequency_divider2(clk,reset,clk_div);
input clk,reset;
output reg clk_div;
reg [31:0]count;
 
always@(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        count <= 32'd0;
        clk_div <= 1'b0;
    end
    else
    begin
        if(count == 32'd6250000)
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