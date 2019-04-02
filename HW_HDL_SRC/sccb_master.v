module sccb_master(
// system signal
input          sys_rst,
input          sys_clk,

input          ov5640_setup_done,

inout          sccb_siod,
output   reg   sccb_sioc

);

// sys_clk = 100Mhz, sioc = 100khz
localparam     REGFILE_DEPTH = 302;
localparam     BIT_LENGTH    = 42;

reg  [16:0]     sccb_sioc_div; 
                       // [10:0] used for soic div, [16:11] for bit cnt

reg  [8:0]     sccb_cfg_addr;
wire [23:0]    sccb_cfg_data;

reg  [41:0]    sccb_send_data;
reg            sccb_send_finish;

wire sccb_siod_i;


ov5640_regfiles regfile_inst(
	.cfg_addr              (   sccb_cfg_addr  ),
	.cfg_data              (   sccb_cfg_data  )
);


always @ (posedge sys_clk or posedge sys_rst) begin
	if (sys_rst) begin
		sccb_sioc_div <= 'd0;
	end else if (ov5640_setup_done && !sccb_send_finish) begin
		if (sccb_sioc_div[16:11] == BIT_LENGTH) begin
			sccb_sioc_div <= 'd0;
		end
		else begin
			sccb_sioc_div <= sccb_sioc_div + 1'b1;
		end
	end 
end 

// soic generator
always @ (posedge sys_clk or posedge sys_rst) begin
	if (sys_rst) begin
		sccb_sioc <= 1'b1;
	end 
	else begin
		case (sccb_sioc_div[16:11])
			'd0, 'd1:	
				sccb_sioc <= 1'b1;
			'd2: 
				case(sccb_sioc_div[10:9])
					2'd0: sccb_sioc <= 1'b1;
					2'd1: sccb_sioc <= 1'b1;
			        2'd2: sccb_sioc <= 1'b1;
			       	2'd3: sccb_sioc <= 1'b0;
			    endcase 
			'd39:
			 	case (sccb_sioc_div[10:9])
			 		2'd0: sccb_sioc <= 1'b0;
			 		2'd1: sccb_sioc <= 1'b1;
			 		2'd2: sccb_sioc <= 1'b1;
			 		2'd3: sccb_sioc <= 1'b1;
			 	endcase 
			'd40, 'd41:
			 	sccb_sioc <= 1'b1;
			default: begin
				case (sccb_sioc_div[10:9])
					2'd0: sccb_sioc <= 1'b0;
					2'd1: sccb_sioc <= 1'b1;	
					2'd2: sccb_sioc <= 1'b1;
					2'd3: sccb_sioc <= 1'b0;
				endcase 
		 	end
		endcase  
	end 
end

// siod generator

always @ (posedge sys_clk or posedge sys_rst) begin
	if (sys_rst) begin
		sccb_send_data   <= 'd0;
		sccb_cfg_addr    <= 'd0;
		sccb_send_finish <= 1'b0;
	end 
	else if (ov5640_setup_done && !sccb_send_finish) begin
		if (sccb_sioc_div == 'd0) begin
			sccb_send_data <= {3'b110, 8'h78, 1'bz, sccb_cfg_data[23:16], 1'bz, sccb_cfg_data[15:8], 1'bz, sccb_cfg_data[7:0], 1'bz, 3'b011};
			if (sccb_cfg_addr == REGFILE_DEPTH) begin
				sccb_cfg_addr    <= 'd0;
				sccb_send_finish <= 1'b1;
			end 
			else begin
				sccb_cfg_addr  <= sccb_cfg_addr + 1'b1;
			end 
		end 
		else if (sccb_sioc_div[10:0] == 'd0) begin
			sccb_send_data <= {sccb_send_data[40:0], 1'b1};
		end 
	end 
end 

// ********************** dbg ****************//
// assign sccb_siod_ien_dbg = sccb_siod_ien;
// *******************************************//
assign sccb_siod_ien = (sccb_sioc_div[16:11] == 'd11) || (sccb_sioc_div[16:11] == 'd20) || 
                       (sccb_sioc_div[16:11] == 'd29) || (sccb_sioc_div[16:11] == 'd38);
                       
assign sccb_siod   = (sccb_siod_ien) ? 1'bz : sccb_send_data[41];
assign sccb_siod_i = sccb_siod ;


endmodule 