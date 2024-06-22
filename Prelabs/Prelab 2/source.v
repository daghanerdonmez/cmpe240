`timescale 1ns / 1ns

module encoder(y, x);

input [6:0] x;
output reg [2:0] y;

integer count;
integer i;

always @(x) begin

	count = 0;

	for(i = 0; i < 7; i++) begin
		if(x[i] == 1'b1) begin
			count++;
		end
	end

	if(count == 0)begin
        y <= 3'b000;
    end

    else if (count == 1)begin
        y <= 3'b001;
    end

    else if (count == 2)begin
        y <= 3'b010;
    end
    else if (count == 3)begin
        y <= 3'b011;
    end
    else if (count == 4)begin
        y <= 3'b100;
    end
    else if (count == 5)begin
        y <= 3'b101;
    end
    else if (count == 6)begin
        y <= 3'b110;
    end
    else if (count == 7)begin
        y <= 3'b111;
    end
end

endmodule

module mux(z, y, s);

input [2:0]y;
input [1:0]s;
output reg z;

integer count;

always @(z, y, s) begin

    count = 0;
    for (integer i = 0;i < 3 ;i++ ) begin
        if(y[i] == 1'b1)begin
            count++;
        end
    end

    if(s == 2'b00)begin
        if(count == 0)begin
            z <= 1;
        end

        else begin
            z <= 0;
        end
    end    
    else if(s == 2'b01)begin
        if(count == 1)begin
            z <= 1;
        end
        else begin
            z <= 0;
        end
    end 
    else if(s == 2'b10)begin
        if(count == 2)begin
            z <= 1;
        end
        else begin
            z <= 0;
        end
    end 
    else if(s == 2'b11)begin
        if(count == 3)begin
            z <= 1;
        end
        else begin
            z <= 0;
        end
    end 
end

endmodule