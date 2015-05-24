	component lab2q is
		port (
			clk_clk       : in    std_logic                     := 'X';             -- clk
			vga_out_CLK   : out   std_logic;                                        -- CLK
			vga_out_HS    : out   std_logic;                                        -- HS
			vga_out_VS    : out   std_logic;                                        -- VS
			vga_out_BLANK : out   std_logic;                                        -- BLANK
			vga_out_SYNC  : out   std_logic;                                        -- SYNC
			vga_out_R     : out   std_logic_vector(7 downto 0);                     -- R
			vga_out_G     : out   std_logic_vector(7 downto 0);                     -- G
			vga_out_B     : out   std_logic_vector(7 downto 0);                     -- B
			sram_addr     : out   std_logic_vector(12 downto 0);                    -- addr
			sram_ba       : out   std_logic_vector(1 downto 0);                     -- ba
			sram_cas_n    : out   std_logic;                                        -- cas_n
			sram_cke      : out   std_logic;                                        -- cke
			sram_cs_n     : out   std_logic;                                        -- cs_n
			sram_dq       : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sram_dqm      : out   std_logic_vector(1 downto 0);                     -- dqm
			sram_ras_n    : out   std_logic;                                        -- ras_n
			sram_we_n     : out   std_logic;                                        -- we_n
			reset_reset_n : in    std_logic                     := 'X';             -- reset_n
			mouse_CLK     : inout std_logic                     := 'X';             -- CLK
			mouse_DAT     : inout std_logic                     := 'X';             -- DAT
			clk_sdram_clk : out   std_logic                                         -- clk
		);
	end component lab2q;

	u0 : component lab2q
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --       clk.clk
			vga_out_CLK   => CONNECTED_TO_vga_out_CLK,   --   vga_out.CLK
			vga_out_HS    => CONNECTED_TO_vga_out_HS,    --          .HS
			vga_out_VS    => CONNECTED_TO_vga_out_VS,    --          .VS
			vga_out_BLANK => CONNECTED_TO_vga_out_BLANK, --          .BLANK
			vga_out_SYNC  => CONNECTED_TO_vga_out_SYNC,  --          .SYNC
			vga_out_R     => CONNECTED_TO_vga_out_R,     --          .R
			vga_out_G     => CONNECTED_TO_vga_out_G,     --          .G
			vga_out_B     => CONNECTED_TO_vga_out_B,     --          .B
			sram_addr     => CONNECTED_TO_sram_addr,     --      sram.addr
			sram_ba       => CONNECTED_TO_sram_ba,       --          .ba
			sram_cas_n    => CONNECTED_TO_sram_cas_n,    --          .cas_n
			sram_cke      => CONNECTED_TO_sram_cke,      --          .cke
			sram_cs_n     => CONNECTED_TO_sram_cs_n,     --          .cs_n
			sram_dq       => CONNECTED_TO_sram_dq,       --          .dq
			sram_dqm      => CONNECTED_TO_sram_dqm,      --          .dqm
			sram_ras_n    => CONNECTED_TO_sram_ras_n,    --          .ras_n
			sram_we_n     => CONNECTED_TO_sram_we_n,     --          .we_n
			reset_reset_n => CONNECTED_TO_reset_reset_n, --     reset.reset_n
			mouse_CLK     => CONNECTED_TO_mouse_CLK,     --     mouse.CLK
			mouse_DAT     => CONNECTED_TO_mouse_DAT,     --          .DAT
			clk_sdram_clk => CONNECTED_TO_clk_sdram_clk  -- clk_sdram.clk
		);

