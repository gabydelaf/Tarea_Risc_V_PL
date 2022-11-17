/******************************************************************
* Description
*	This is a register that is used for implementing pipeline stall 
*	1.0
* Author:
*	Gabriela de la Fuente & Daniel Gutiérrez
******************************************************************/
module Register_EX_MEM
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input enable,
	input  [N-1:0] DataInput,
	input  [N-1:0] DataInput2,

	input zero,
	input mem_read,
	input mem_write,
	input bc,
	input  [N-1:0] pc4,
	
	output reg [N-1:0] pc4_o,
	
	output reg bc_o,
	output reg zero_o,
	output reg mem_read_o,
	output reg mem_write_o,
	output reg [N-1:0] DataOutput,
	output reg [N-1:0] DataOutput2

);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
		DataOutput <= 0;
		DataOutput2<=0;
		zero_o<=0;
		mem_read_o<=0;
		mem_write_o<=0;
		bc_o<=0;
		pc4_o<=0;
		end
	else	
		if(enable==1)
		begin
			DataOutput<=DataInput;
			DataOutput2<=DataInput2;

			zero_o<=zero;
			mem_read_o<=mem_read;
			mem_write_o<=mem_write;
			bc_o<=bc;
			pc4_o<=pc4;
		end 
end

endmodule