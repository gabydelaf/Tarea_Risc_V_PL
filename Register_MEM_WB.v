/******************************************************************
* Description
*	This is a register that is used for implementing pipeline stall 
*	1.0
* Author:
*	Gabriela de la Fuente & Daniel Gutiérrez
******************************************************************/
module Register_MEM_WB
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input enable,
	input  [N-1:0] DataInput,
	input bc,
	input  [N-1:0] pc4,
	input Reg_Write_i,
	input	 [4:0] write_register_i,
	
	output reg [4:0] write_register_o,
	output reg Reg_Write_o,
	output reg [N-1:0] pc4_o,
	output reg bc_o,
	output reg [N-1:0] DataOutput
);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
		DataOutput <= 0;
		bc_o<=0;
		pc4_o<=0;
		Reg_Write_o<=0;
		write_register_o<=0;
		end
	else	
		if(enable==1)
		begin
			DataOutput<=DataInput;
			bc_o<=bc;
			pc4_o<=pc4;
			Reg_Write_o<=Reg_Write_i;
			write_register_o<=write_register_i;
		end
end

endmodule