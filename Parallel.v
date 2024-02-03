module Parallel(); //Convert serial data into parallel data
input wire data;
input wire clk;
output reg[7:0] parallel_data; 

reg [3:0] counter;
initial begin
parallel_data <= 7'b0;
counter <= 3'b0;
end 
always @ (posedge clk) begin
    if(counter == 3'd7) begin
        parallel_data[counter] <= data;
        counter <= 3'd0;
    end
    else begin
        parallel_data[counter] <= data;
        counter <= counter + 1'b1;
    end

end


endmodule