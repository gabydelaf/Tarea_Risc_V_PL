/******************************************************************
* Description
*	This the basic register that is used in the register file
*	1.0
* Author:
*	Dan y Gaby

******************************************************************/
module Register_for_sp
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input enable,
	input  [N-1:0] DataInput,
	
	
	output reg [N-1:0] DataOutput
);

always@(negedge reset or posedge clk) begin
	if(reset==0)
		DataOutput <= 'h100103FC; //PARTE ALTA DE LA MEMORIA
	else	
		if(enable==1)
			DataOutput<=DataInput;
end

endmodule