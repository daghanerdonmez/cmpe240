`timescale 1ns / 1ns

module source(memory, instruction, r1, r2, r3, clk);

input wire [15:0] instruction;
input wire clk;
parameter 	S0 = 4'b0000,
			S1 = 4'b0001,
			S2 = 4'b0010,
			S3 = 4'b0011,
			S4 = 4'b0100,
			S5 = 4'b0101,
			S6 = 4'b0110,
			S7 = 4'b0111,
			S8 = 4'b1000,
			S9 = 4'b1001,
			S10 = 4'b1010,
			S11 = 4'b1011,
			S12 = 4'b1100,
			S13 = 4'b1101,
			S14 = 4'b1110,
			S15 = 4'b1111;
integer i;
integer s;
		
output reg [127:0] memory;
output reg [7:0]r1;
output reg [7:0]r2;
output reg [7:0]r3;

initial begin
	memory = 0;
	r1 = 0;
	r2 = 0;
	r3 = 0;
end

always@(posedge clk) begin
	s = 0;
	for (i = instruction[11:8] * 8; i < (instruction[11:8] * 8) + 8; i++) begin
		r1[s] = memory[i];
		s = s + 1;
	end
	s = 0;
	for (i = instruction[7:4] * 8; i < (instruction[7:4] * 8) + 8; i++) begin
		r2[s] = memory[i];
		s = s + 1;
	end

	
	
	case(instruction[15:12])
		S0: begin
			s = 0;
			r3 = instruction[11:4];
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S1: begin
			s = 0;
			r3 = r2 == r1;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S2: begin
			s = 0;
			r3 = r2 < r1;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S3: begin
			s = 0;
			r3 = r2 <= r1;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S4: begin
			r3 = r1 | r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S5: begin
			
		end
		S6: begin
			
		end
		S7: begin
			
		end
		S8: begin
			r3 = r1 & r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S9: begin
			r3 = r1 ^ r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S10: begin
			r3 = ~r1;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S11: begin
			r3 = r1 + r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S12: begin
			r3 = r1 - r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S13: begin
			r3 = r1 * r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S14: begin
			r3 = r1 / r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S15: begin
			r3 = r1 % r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
	endcase
end

endmodule
