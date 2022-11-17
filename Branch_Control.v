/******************************************************************
* Description
*	Este módulo se utilizará para decidir si se activará un branch o no
	y bajo qué condición
* Author:
*	Daniel Gutiérrez Bustos & Gabriela de la Fuente
* Date:
*	27/10/2022
******************************************************************/
module Branch_Control
(
	input  Branch_Enable_i,
	input [6:0]OP_i,
	input [2:0] funct3_i,
	input [31:0] A_i,
	input [31:0] B_i,
	
	output Branch_Enable_o,
	output branch_or_jalr_o
	
);



	localparam beq = 10'b1100011_000;
	localparam bne = 10'b1100011_001;
	localparam blt = 10'b1100011_100;
	localparam bge = 10'b1100011_101;
	localparam jalr= 10'b1100111_000;
	localparam jal = 10'b1101111_xxx;


	wire [31:0] result;
	reg  branch_out;
	reg  branch_or_jalr;
	wire [9:0] selector;
	

   assign result = A_i - B_i;

	assign selector = {OP_i, funct3_i};


	always@(selector, result, Branch_Enable_i)begin

if(Branch_Enable_i)
	begin
		casex(selector)
		
			beq:		begin branch_or_jalr = 1;  branch_out = (result == 0) ? 1'b1 : 1'b0; end
			bne:		begin branch_or_jalr = 1;  branch_out = (result != 0)  ? 1'b1 : 1'b0; end
			bge:		begin branch_or_jalr = 1;  branch_out = (result >= 0) ? 1'b1 : 1'b0; end
			blt:		begin branch_or_jalr = 1;  branch_out = (result[31] == 1) ? 1'b1 : 1'b0; end
			jalr:    begin branch_or_jalr = 0;  branch_out = 1; end
			jal:     begin branch_or_jalr = 1;  branch_out = 1; end
			
			default: begin branch_out = 1'b0; branch_or_jalr = 0;end
		endcase

	end
else
	begin branch_out = 1'b0; branch_or_jalr = 0;end
	end

	assign Branch_Enable_o = branch_out;
	assign branch_or_jalr_o = branch_or_jalr;



endmodule
