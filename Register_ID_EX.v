/******************************************************************
* Description
*	This is a register that is used for implementing pipeline stall 
*	1.0
* Author:
*	Gabriela de la Fuente & Daniel Gutiérrez
******************************************************************/
module Register_ID_EX
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input enable,
	input branch,
	input mem_read,
	input mem_write,
	input  [N-1:0] pc,
	input  [N-1:0] DataInput1,
	input  [N-1:0] DataInput2,
	input  [N-1:0] imm,
	input	 [3:0] alu_op,
	input  [N-1:0] pc4,
	input src,
	input b_o_jalr,
	input Reg_Write_i,
	input	 [4:0] write_register_i,
	
	output reg [4:0] write_register_o,
	output reg Reg_Write_o,
	output reg b_o_jalr_o,
	output reg src_o,
	output reg [N-1:0] pc4_o,
	
	output reg [3:0] alu_op_o,
	output reg branch_o,
	output reg mem_read_o,
	output reg mem_write_o,
	output reg [N-1:0] pc_o,
	output reg [N-1:0] DataOutput1,
	output reg [N-1:0] DataOutput2,
	output reg [N-1:0] imm_o
);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
		pc_o <= 0;
		DataOutput1<=0;
		DataOutput2<=0;
		imm_o<=0;
		alu_op_o<=0;
		branch_o<=0;
		mem_read_o<=0;
		mem_write_o<=0;
		pc4_o<=0;
		src_o<=0;
		b_o_jalr_o<=0;
		Reg_Write_o <= 0;
		write_register_o<=0;
		end
	else	
		if(enable==1)
			begin
			pc_o<=pc;
			DataOutput1<=DataInput1;
			DataOutput2<=DataInput2;
			imm_o<=imm;
			alu_op_o<=alu_op;
			branch_o<=branch;
			mem_read_o<=mem_read;
			mem_write_o<=mem_write;
			pc4_o<=pc4;
			src_o<=src;
			b_o_jalr_o<=b_o_jalr;
			Reg_Write_o<=Reg_Write_i;
			write_register_o<=write_register_i;
			end
end

endmodule