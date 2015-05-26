
module lab2q (
	clk_clk,
	clk_sdram_clk,
	mouse_CLK,
	mouse_DAT,
	reset_reset_n,
	sram_addr,
	sram_ba,
	sram_cas_n,
	sram_cke,
	sram_cs_n,
	sram_dq,
	sram_dqm,
	sram_ras_n,
	sram_we_n,
	vga_out_CLK,
	vga_out_HS,
	vga_out_VS,
	vga_out_BLANK,
	vga_out_SYNC,
	vga_out_R,
	vga_out_G,
	vga_out_B);	

	input		clk_clk;
	output		clk_sdram_clk;
	inout		mouse_CLK;
	inout		mouse_DAT;
	input		reset_reset_n;
	output	[12:0]	sram_addr;
	output	[1:0]	sram_ba;
	output		sram_cas_n;
	output		sram_cke;
	output		sram_cs_n;
	inout	[15:0]	sram_dq;
	output	[1:0]	sram_dqm;
	output		sram_ras_n;
	output		sram_we_n;
	output		vga_out_CLK;
	output		vga_out_HS;
	output		vga_out_VS;
	output		vga_out_BLANK;
	output		vga_out_SYNC;
	output	[7:0]	vga_out_R;
	output	[7:0]	vga_out_G;
	output	[7:0]	vga_out_B;
endmodule
