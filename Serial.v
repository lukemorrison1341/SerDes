//Convert parallel-data into serial data.


module Serial();

input wire [7:0] data; //8-bit parallel data width
input wire clk;
output reg ser_data; //1-bit wide serial data 
reg[3:0] counter;
initial begin 
    counter = 3'b0;
    ser_data = 1'b0;
end
always @ (posedge clk) begin
    if(counter > 3'd7) begin //counted over
        counter <= 0;
    end
    else begin
        ser_data <= data[counter]; 
        counter <= counter + 1;
    end
end


endmodule