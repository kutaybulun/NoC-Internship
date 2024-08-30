`timescale 1 ns / 1 ps

`ifndef VIVADO_AXI_MASTER_LOCAL_PE_DEFINES_
    `define VIVADO_AXI_MASTER_LOCAL_PE_DEFINES_

    `ifndef FLIT_DATA_WIDTH
        `define  FLIT_DATA_WIDTH      32        // Flit width data in bits
    `endif

    `ifndef N_VIRT_CHN
        `define N_VIRT_CHN            3         // Number of virtual channels
   `endif

    `ifndef MAX_SZ_PKT
        `define MAX_SZ_PKT            256       // Max number of flits per packet
    `endif

    `ifndef AXI_ADDR_WIDTH
        `define AXI_ADDR_WIDTH        32
    `endif

    `ifndef AXI_DATA_WIDTH
        `define AXI_DATA_WIDTH        `FLIT_DATA_WIDTH
    `endif

    `ifndef AXI_ALEN_WIDTH
        `define AXI_ALEN_WIDTH        8
    `endif

    `ifndef AXI_ASIZE_WIDTH
        `define AXI_ASIZE_WIDTH       3
    `endif

    `ifndef AXI_MAX_OUTSTD_RD
        `define AXI_MAX_OUTSTD_RD     2
    `endif

    `ifndef AXI_MAX_OUTSTD_WR
        `define AXI_MAX_OUTSTD_WR     2
    `endif

    `ifndef AXI_USER_RESP_WIDTH
        `define AXI_USER_RESP_WIDTH   2
    `endif

    `ifndef AXI_WR_BFF_BASE_ADDR
        `define AXI_WR_BFF_BASE_ADDR  'h1000
    `endif

    `ifndef AXI_RD_BFF_BASE_ADDR
        `define AXI_RD_BFF_BASE_ADDR  'h2000
    `endif

    `ifndef AXI_CSR_BASE_ADDR
        `define AXI_CSR_BASE_ADDR     'h3000
    `endif

    `ifndef AXI_WR_BFF_CHN
        `define AXI_WR_BFF_CHN(x)     `AXI_WR_BFF_BASE_ADDR+(x*'h8)
    `endif

    `ifndef AXI_RD_BFF_CHN
        `define AXI_RD_BFF_CHN(x)     `AXI_RD_BFF_BASE_ADDR+(x*'h8)
    `endif

    `ifndef AXI_CSR_REG
        `define AXI_CSR_REG(x)        `AXI_CSR_BASE_ADDR+(x*'h4)
    `endif
`endif // VIVADO_AXI_MASTER_LOCAL_PE_DEFINES_

module ravenoc_local_pe_test(
clk_axi,
//clk_axi_0,
//clk_axi_3,
clk_noc,
arst_axi,
//arst_axi_0,
//arst_axi_3,
arst_noc,
INIT_AXI_TXN_M_AXI_0,
TXN_DONE_M_AXI_0,
ERROR_M_AXI_0,
INIT_AXI_TXN_M_AXI_3,
TXN_DONE_M_AXI_3,
ERROR_M_AXI_3,
irqs_3_irq_vcs, 
irqs_3_irq_trig, 
irqs_2_irq_vcs, 
irqs_2_irq_trig, 
irqs_1_irq_vcs, 
irqs_1_irq_trig,
irqs_0_irq_vcs, 
irqs_0_irq_trig, 
bypass_cdc    
);
//Clocks and resets
input [3:0] clk_axi;
//input clk_axi_0;
//input clk_axi_3; 
input clk_noc; 
input [3:0] arst_axi;
//input arst_axi_0;
//input arst_axi_3; 
input arst_noc;
//IRQS and BYPASS CDC 
output [2:0] irqs_3_irq_vcs; 
output irqs_3_irq_trig; 
output [2:0] irqs_2_irq_vcs; 
output irqs_2_irq_trig; 
output [2:0] irqs_1_irq_vcs; 
output irqs_1_irq_trig;
output [2:0] irqs_0_irq_vcs; 
output irqs_0_irq_trig; 
input [3:0] bypass_cdc;
// I/Os for the AXI master 0
input INIT_AXI_TXN_M_AXI_0;
output TXN_DONE_M_AXI_0;
output ERROR_M_AXI_0;
// I/Os for the AXI master 0
input INIT_AXI_TXN_M_AXI_3;
output TXN_DONE_M_AXI_3;
output ERROR_M_AXI_3;
//axi reset is active low
//wire arst_axi_n; 
//assign arst_axi_n = ~arst_axi;

//MOSI wires
wire [7:0] axi_mosi_if_3_awid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_3_awaddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_3_awlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_3_awsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_3_awburst; //input to ravenoc_wrapper
wire  axi_mosi_if_3_awlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_awcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_3_awprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_awqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_awregion; //USER DEFINED 0 //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_3_awuser; //input to ravenoc_wrapper
wire  axi_mosi_if_3_awvalid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_3_wdata; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_wstrb; //input to ravenoc_wrapper
wire  axi_mosi_if_3_wlast; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_3_wuser; //input to ravenoc_wrapper
wire  axi_mosi_if_3_wvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_3_bready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_3_arid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_3_araddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_3_arlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_3_arsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_3_arburst; //input to ravenoc_wrapper
wire  axi_mosi_if_3_arlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_arcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_3_arprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_arqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_3_arregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_3_aruser; //input to ravenoc_wrapper
wire  axi_mosi_if_3_arvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_3_rready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_2_awid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_2_awaddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_2_awlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_2_awsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_2_awburst; //input to ravenoc_wrapper
wire  axi_mosi_if_2_awlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_awcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_2_awprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_awqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_awregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_2_awuser; //input to ravenoc_wrapper
wire  axi_mosi_if_2_awvalid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_2_wdata; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_wstrb; //input to ravenoc_wrapper
wire  axi_mosi_if_2_wlast; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_2_wuser; //input to ravenoc_wrapper
wire  axi_mosi_if_2_wvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_2_bready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_2_arid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_2_araddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_2_arlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_2_arsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_2_arburst; //input to ravenoc_wrapper
wire  axi_mosi_if_2_arlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_arcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_2_arprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_arqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_2_arregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_2_aruser; //input to ravenoc_wrapper
wire  axi_mosi_if_2_arvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_2_rready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_1_awid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_1_awaddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_1_awlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_1_awsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_1_awburst; //input to ravenoc_wrapper
wire  axi_mosi_if_1_awlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_awcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_1_awprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_awqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_awregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_1_awuser; //input to ravenoc_wrapper
wire  axi_mosi_if_1_awvalid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_1_wdata; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_wstrb; //input to ravenoc_wrapper
wire  axi_mosi_if_1_wlast; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_1_wuser; //input to ravenoc_wrapper
wire  axi_mosi_if_1_wvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_1_bready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_1_arid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_1_araddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_1_arlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_1_arsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_1_arburst; //input to ravenoc_wrapper
wire  axi_mosi_if_1_arlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_arcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_1_arprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_arqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_1_arregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_1_aruser; //input to ravenoc_wrapper
wire  axi_mosi_if_1_arvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_1_rready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_0_awid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_0_awaddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_0_awlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_0_awsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_0_awburst; //input to ravenoc_wrapper
wire  axi_mosi_if_0_awlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_awcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_0_awprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_awqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_awregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_0_awuser; //input to ravenoc_wrapper
wire  axi_mosi_if_0_awvalid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_0_wdata; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_wstrb; //input to ravenoc_wrapper
wire  axi_mosi_if_0_wlast; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_0_wuser; //input to ravenoc_wrapper
wire  axi_mosi_if_0_wvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_0_bready; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_0_arid; //input to ravenoc_wrapper
wire [31:0] axi_mosi_if_0_araddr; //input to ravenoc_wrapper
wire [7:0] axi_mosi_if_0_arlen; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_0_arsize; //input to ravenoc_wrapper
wire [1:0] axi_mosi_if_0_arburst; //input to ravenoc_wrapper
wire  axi_mosi_if_0_arlock; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_arcache; //input to ravenoc_wrapper
wire [2:0] axi_mosi_if_0_arprot; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_arqos; //input to ravenoc_wrapper
wire [3:0] axi_mosi_if_0_arregion; //input to ravenoc_wrapper
wire [0:0] axi_mosi_if_0_aruser; //input to ravenoc_wrapper
wire  axi_mosi_if_0_arvalid; //input to ravenoc_wrapper
wire  axi_mosi_if_0_rready; //input to ravenoc_wrapper

//MISO wires
wire  axi_miso_if_3_awready; //input to axi master interfaces
wire  axi_miso_if_3_wready; //input to axi master interfaces
wire [7:0] axi_miso_if_3_bid; //input to axi master interfaces
wire [1:0] axi_miso_if_3_bresp; //input to axi master interfaces
wire [0:0] axi_miso_if_3_buser; //input to axi master interfaces
wire  axi_miso_if_3_bvalid; //input to axi master interfaces
wire  axi_miso_if_3_arready; //input to axi master interfaces
wire [7:0] axi_miso_if_3_rid; //input to axi master interfaces
wire [31:0] axi_miso_if_3_rdata; //input to axi master interfaces
wire [1:0] axi_miso_if_3_rresp; //input to axi master interfaces
wire  axi_miso_if_3_rlast; //input to axi master interfaces
wire [0:0] axi_miso_if_3_ruser; //input to axi master interfaces
wire  axi_miso_if_3_rvalid; //input to axi master interfaces
wire  axi_miso_if_2_awready; //input to axi master interfaces
wire  axi_miso_if_2_wready; //input to axi master interfaces
wire [7:0] axi_miso_if_2_bid; //input to axi master interfaces
wire [1:0] axi_miso_if_2_bresp; //input to axi master interfaces
wire [0:0] axi_miso_if_2_buser; //input to axi master interfaces
wire  axi_miso_if_2_bvalid; //input to axi master interfaces
wire  axi_miso_if_2_arready; //input to axi master interfaces
wire [7:0] axi_miso_if_2_rid; //input to axi master interfaces
wire [31:0] axi_miso_if_2_rdata; //input to axi master interfaces
wire [1:0] axi_miso_if_2_rresp; //input to axi master interfaces
wire  axi_miso_if_2_rlast; //input to axi master interfaces
wire [0:0] axi_miso_if_2_ruser; //input to axi master interfaces
wire  axi_miso_if_2_rvalid; //input to axi master interfaces
wire  axi_miso_if_1_awready; //input to axi master interfaces
wire  axi_miso_if_1_wready; //input to axi master interfaces
wire [7:0] axi_miso_if_1_bid; //input to axi master interfaces
wire [1:0] axi_miso_if_1_bresp; //input to axi master interfaces
wire [0:0] axi_miso_if_1_buser; //input to axi master interfaces
wire  axi_miso_if_1_bvalid; //input to axi master interfaces
wire  axi_miso_if_1_arready; //input to axi master interfaces
wire [7:0] axi_miso_if_1_rid; //input to axi master interfaces
wire [31:0] axi_miso_if_1_rdata; //input to axi master interfaces
wire [1:0] axi_miso_if_1_rresp; //input to axi master interfaces
wire  axi_miso_if_1_rlast; //input to axi master interfaces
wire [0:0] axi_miso_if_1_ruser; //input to axi master interfaces
wire  axi_miso_if_1_rvalid; //input to axi master interfaces
wire  axi_miso_if_0_awready; //input to axi master interfaces
wire  axi_miso_if_0_wready; //input to axi master interfaces
wire [7:0] axi_miso_if_0_bid; //input to axi master interfaces
wire [1:0] axi_miso_if_0_bresp; //input to axi master interfaces
wire [0:0] axi_miso_if_0_buser; //input to axi master interfaces
wire  axi_miso_if_0_bvalid; //input to axi master interfaces
wire  axi_miso_if_0_arready; //input to axi master interfaces
wire [7:0] axi_miso_if_0_rid; //input to axi master interfaces
wire [31:0] axi_miso_if_0_rdata; //input to axi master interfaces
wire [1:0] axi_miso_if_0_rresp; //input to axi master interfaces
wire  axi_miso_if_0_rlast; //input to axi master interfaces
wire [0:0] axi_miso_if_0_ruser; //input to axi master interfaces
wire  axi_miso_if_0_rvalid; //input to axi master interfaces

//IRQS and BYPASS CDC 
/*wire [2:0] irqs_3_irq_vcs; 
wire irqs_3_irq_trig; 
wire [2:0] irqs_2_irq_vcs; 
wire irqs_2_irq_trig; 
wire [2:0] irqs_1_irq_vcs; 
wire irqs_1_irq_trig;
wire [2:0] irqs_0_irq_vcs; 
wire irqs_0_irq_trig; 
wire [3:0]bypass_cdc;*/

//always@(*) begin
//    arst_axi_n = ~arst_axi;
//end

ravenoc_verilog_wrapper ravenoc_verilog_wrapper_inst (
.clk_axi (clk_axi),
.clk_noc (clk_noc),
.arst_axi (arst_axi),
.arst_noc (arst_noc),
// AXI interface 3
.axi_mosi_if_3_awid (axi_mosi_if_3_awid),
.axi_mosi_if_3_awaddr (axi_mosi_if_3_awaddr),
.axi_mosi_if_3_awlen (axi_mosi_if_3_awlen),
.axi_mosi_if_3_awsize (axi_mosi_if_3_awsize),
.axi_mosi_if_3_awburst (axi_mosi_if_3_awburst),
.axi_mosi_if_3_awlock (axi_mosi_if_3_awlock),
.axi_mosi_if_3_awcache (axi_mosi_if_3_awcache),
.axi_mosi_if_3_awprot (axi_mosi_if_3_awprot),
.axi_mosi_if_3_awqos (axi_mosi_if_3_awqos),
.axi_mosi_if_3_awregion (axi_mosi_if_3_awregion),
.axi_mosi_if_3_awuser (axi_mosi_if_3_awuser),
.axi_mosi_if_3_awvalid (axi_mosi_if_3_awvalid),
.axi_mosi_if_3_wdata (axi_mosi_if_3_wdata),
.axi_mosi_if_3_wstrb (axi_mosi_if_3_wstrb),
.axi_mosi_if_3_wlast (axi_mosi_if_3_wlast),
.axi_mosi_if_3_wuser (axi_mosi_if_3_wuser),
.axi_mosi_if_3_wvalid (axi_mosi_if_3_wvalid),
.axi_mosi_if_3_bready (axi_mosi_if_3_bready),
.axi_mosi_if_3_arid (axi_mosi_if_3_arid),
.axi_mosi_if_3_araddr (axi_mosi_if_3_araddr),
.axi_mosi_if_3_arlen (axi_mosi_if_3_arlen),
.axi_mosi_if_3_arsize (axi_mosi_if_3_arsize),
.axi_mosi_if_3_arburst (axi_mosi_if_3_arburst),
.axi_mosi_if_3_arlock (axi_mosi_if_3_arlock),
.axi_mosi_if_3_arcache (axi_mosi_if_3_arcache),
.axi_mosi_if_3_arprot (axi_mosi_if_3_arprot),
.axi_mosi_if_3_arqos (axi_mosi_if_3_arqos),
.axi_mosi_if_3_arregion (axi_mosi_if_3_arregion),
.axi_mosi_if_3_aruser (axi_mosi_if_3_aruser),
.axi_mosi_if_3_arvalid (axi_mosi_if_3_arvalid),
.axi_mosi_if_3_rready (axi_mosi_if_3_rready),
.axi_miso_if_3_awready (axi_miso_if_3_awready),
.axi_miso_if_3_wready (axi_miso_if_3_wready),
.axi_miso_if_3_bid (axi_miso_if_3_bid),
.axi_miso_if_3_bresp (axi_miso_if_3_bresp),
.axi_miso_if_3_buser (axi_miso_if_3_buser),
.axi_miso_if_3_bvalid (axi_miso_if_3_bvalid),
.axi_miso_if_3_arready (axi_miso_if_3_arready),
.axi_miso_if_3_rid (axi_miso_if_3_rid),
.axi_miso_if_3_rdata (axi_miso_if_3_rdata),
.axi_miso_if_3_rresp (axi_miso_if_3_rresp),
.axi_miso_if_3_rlast (axi_miso_if_3_rlast),
.axi_miso_if_3_ruser (axi_miso_if_3_ruser),
.axi_miso_if_3_rvalid (axi_miso_if_3_rvalid),
// AXI interface 2
.axi_mosi_if_2_awid (axi_mosi_if_2_awid),
.axi_mosi_if_2_awaddr (axi_mosi_if_2_awaddr),
.axi_mosi_if_2_awlen (axi_mosi_if_2_awlen),
.axi_mosi_if_2_awsize (axi_mosi_if_2_awsize),
.axi_mosi_if_2_awburst (axi_mosi_if_2_awburst),
.axi_mosi_if_2_awlock (axi_mosi_if_2_awlock),
.axi_mosi_if_2_awcache (axi_mosi_if_2_awcache),
.axi_mosi_if_2_awprot (axi_mosi_if_2_awprot),
.axi_mosi_if_2_awqos (axi_mosi_if_2_awqos),
.axi_mosi_if_2_awregion (axi_mosi_if_2_awregion),
.axi_mosi_if_2_awuser (axi_mosi_if_2_awuser),
.axi_mosi_if_2_awvalid (axi_mosi_if_2_awvalid),
.axi_mosi_if_2_wdata (axi_mosi_if_2_wdata),
.axi_mosi_if_2_wstrb (axi_mosi_if_2_wstrb),
.axi_mosi_if_2_wlast (axi_mosi_if_2_wlast),
.axi_mosi_if_2_wuser (axi_mosi_if_2_wuser),
.axi_mosi_if_2_wvalid (axi_mosi_if_2_wvalid),
.axi_mosi_if_2_bready (axi_mosi_if_2_bready),
.axi_mosi_if_2_arid (axi_mosi_if_2_arid),
.axi_mosi_if_2_araddr (axi_mosi_if_2_araddr),
.axi_mosi_if_2_arlen (axi_mosi_if_2_arlen),
.axi_mosi_if_2_arsize (axi_mosi_if_2_arsize),
.axi_mosi_if_2_arburst (axi_mosi_if_2_arburst),
.axi_mosi_if_2_arlock (axi_mosi_if_2_arlock),
.axi_mosi_if_2_arcache (axi_mosi_if_2_arcache),
.axi_mosi_if_2_arprot (axi_mosi_if_2_arprot),
.axi_mosi_if_2_arqos (axi_mosi_if_2_arqos),
.axi_mosi_if_2_arregion (axi_mosi_if_2_arregion),
.axi_mosi_if_2_aruser (axi_mosi_if_2_aruser),
.axi_mosi_if_2_arvalid (axi_mosi_if_2_arvalid),
.axi_mosi_if_2_rready (axi_mosi_if_2_rready),
.axi_miso_if_2_awready (axi_miso_if_2_awready),
.axi_miso_if_2_wready (axi_miso_if_2_wready),
.axi_miso_if_2_bid (axi_miso_if_2_bid),
.axi_miso_if_2_bresp (axi_miso_if_2_bresp),
.axi_miso_if_2_buser (axi_miso_if_2_buser),
.axi_miso_if_2_bvalid (axi_miso_if_2_bvalid),
.axi_miso_if_2_arready (axi_miso_if_2_arready),
.axi_miso_if_2_rid (axi_miso_if_2_rid),
.axi_miso_if_2_rdata (axi_miso_if_2_rdata),
.axi_miso_if_2_rresp (axi_miso_if_2_rresp),
.axi_miso_if_2_rlast (axi_miso_if_2_rlast),
.axi_miso_if_2_ruser (axi_miso_if_2_ruser),
.axi_miso_if_2_rvalid (axi_miso_if_2_rvalid),
// AXI interface 1
.axi_mosi_if_1_awid (axi_mosi_if_1_awid),
.axi_mosi_if_1_awaddr (axi_mosi_if_1_awaddr),
.axi_mosi_if_1_awlen (axi_mosi_if_1_awlen),
.axi_mosi_if_1_awsize (axi_mosi_if_1_awsize),
.axi_mosi_if_1_awburst (axi_mosi_if_1_awburst),
.axi_mosi_if_1_awlock (axi_mosi_if_1_awlock),
.axi_mosi_if_1_awcache (axi_mosi_if_1_awcache),
.axi_mosi_if_1_awprot (axi_mosi_if_1_awprot),
.axi_mosi_if_1_awqos (axi_mosi_if_1_awqos),
.axi_mosi_if_1_awregion (axi_mosi_if_1_awregion),
.axi_mosi_if_1_awuser (axi_mosi_if_1_awuser),
.axi_mosi_if_1_awvalid (axi_mosi_if_1_awvalid),
.axi_mosi_if_1_wdata (axi_mosi_if_1_wdata),
.axi_mosi_if_1_wstrb (axi_mosi_if_1_wstrb),
.axi_mosi_if_1_wlast (axi_mosi_if_1_wlast),
.axi_mosi_if_1_wuser (axi_mosi_if_1_wuser),
.axi_mosi_if_1_wvalid (axi_mosi_if_1_wvalid),
.axi_mosi_if_1_bready (axi_mosi_if_1_bready),
.axi_mosi_if_1_arid (axi_mosi_if_1_arid),
.axi_mosi_if_1_araddr (axi_mosi_if_1_araddr),
.axi_mosi_if_1_arlen (axi_mosi_if_1_arlen),
.axi_mosi_if_1_arsize (axi_mosi_if_1_arsize),
.axi_mosi_if_1_arburst (axi_mosi_if_1_arburst),
.axi_mosi_if_1_arlock (axi_mosi_if_1_arlock),
.axi_mosi_if_1_arcache (axi_mosi_if_1_arcache),
.axi_mosi_if_1_arprot (axi_mosi_if_1_arprot),
.axi_mosi_if_1_arqos (axi_mosi_if_1_arqos),
.axi_mosi_if_1_arregion (axi_mosi_if_1_arregion),
.axi_mosi_if_1_aruser (axi_mosi_if_1_aruser),
.axi_mosi_if_1_arvalid (axi_mosi_if_1_arvalid),
.axi_mosi_if_1_rready (axi_mosi_if_1_rready),
.axi_miso_if_1_awready (axi_miso_if_1_awready),
.axi_miso_if_1_wready (axi_miso_if_1_wready),
.axi_miso_if_1_bid (axi_miso_if_1_bid),
.axi_miso_if_1_bresp (axi_miso_if_1_bresp),
.axi_miso_if_1_buser (axi_miso_if_1_buser),
.axi_miso_if_1_bvalid (axi_miso_if_1_bvalid),
.axi_miso_if_1_arready (axi_miso_if_1_arready),
.axi_miso_if_1_rid (axi_miso_if_1_rid),
.axi_miso_if_1_rdata (axi_miso_if_1_rdata),
.axi_miso_if_1_rresp (axi_miso_if_1_rresp),
.axi_miso_if_1_rlast (axi_miso_if_1_rlast),
.axi_miso_if_1_ruser (axi_miso_if_1_ruser),
.axi_miso_if_1_rvalid (axi_miso_if_1_rvalid),
// AXI interface 0
.axi_mosi_if_0_awid (axi_mosi_if_0_awid),
.axi_mosi_if_0_awaddr (axi_mosi_if_0_awaddr),
.axi_mosi_if_0_awlen (axi_mosi_if_0_awlen),
.axi_mosi_if_0_awsize (axi_mosi_if_0_awsize),
.axi_mosi_if_0_awburst (axi_mosi_if_0_awburst),
.axi_mosi_if_0_awlock (axi_mosi_if_0_awlock),
.axi_mosi_if_0_awcache (axi_mosi_if_0_awcache),
.axi_mosi_if_0_awprot (axi_mosi_if_0_awprot),
.axi_mosi_if_0_awqos (axi_mosi_if_0_awqos),
.axi_mosi_if_0_awregion (axi_mosi_if_0_awregion),
.axi_mosi_if_0_awuser (axi_mosi_if_0_awuser),
.axi_mosi_if_0_awvalid (axi_mosi_if_0_awvalid),
.axi_mosi_if_0_wdata (axi_mosi_if_0_wdata),
.axi_mosi_if_0_wstrb (axi_mosi_if_0_wstrb),
.axi_mosi_if_0_wlast (axi_mosi_if_0_wlast),
.axi_mosi_if_0_wuser (axi_mosi_if_0_wuser),
.axi_mosi_if_0_wvalid (axi_mosi_if_0_wvalid),
.axi_mosi_if_0_bready (axi_mosi_if_0_bready),
.axi_mosi_if_0_arid (axi_mosi_if_0_arid),
.axi_mosi_if_0_araddr (axi_mosi_if_0_araddr),
.axi_mosi_if_0_arlen (axi_mosi_if_0_arlen),
.axi_mosi_if_0_arsize (axi_mosi_if_0_arsize),
.axi_mosi_if_0_arburst (axi_mosi_if_0_arburst),
.axi_mosi_if_0_arlock (axi_mosi_if_0_arlock),
.axi_mosi_if_0_arcache (axi_mosi_if_0_arcache),
.axi_mosi_if_0_arprot (axi_mosi_if_0_arprot),
.axi_mosi_if_0_arqos (axi_mosi_if_0_arqos),
.axi_mosi_if_0_arregion (axi_mosi_if_0_arregion),
.axi_mosi_if_0_aruser (axi_mosi_if_0_aruser),
.axi_mosi_if_0_arvalid (axi_mosi_if_0_arvalid),
.axi_mosi_if_0_rready (axi_mosi_if_0_rready),
.axi_miso_if_0_awready (axi_miso_if_0_awready),
.axi_miso_if_0_wready (axi_miso_if_0_wready),
.axi_miso_if_0_bid (axi_miso_if_0_bid),
.axi_miso_if_0_bresp (axi_miso_if_0_bresp),
.axi_miso_if_0_buser (axi_miso_if_0_buser),
.axi_miso_if_0_bvalid (axi_miso_if_0_bvalid),
.axi_miso_if_0_arready (axi_miso_if_0_arready),
.axi_miso_if_0_rid (axi_miso_if_0_rid),
.axi_miso_if_0_rdata (axi_miso_if_0_rdata),
.axi_miso_if_0_rresp (axi_miso_if_0_rresp),
.axi_miso_if_0_rlast (axi_miso_if_0_rlast),
.axi_miso_if_0_ruser (axi_miso_if_0_ruser),
.axi_miso_if_0_rvalid (axi_miso_if_0_rvalid),
// IRQs and bypass CDC
.irqs_3_irq_vcs (irqs_3_irq_vcs),
.irqs_3_irq_trig (irqs_3_irq_trig),
.irqs_2_irq_vcs (irqs_2_irq_vcs),
.irqs_2_irq_trig (irqs_2_irq_trig),
.irqs_1_irq_vcs (irqs_1_irq_vcs),
.irqs_1_irq_trig (irqs_1_irq_trig),
.irqs_0_irq_vcs (irqs_0_irq_vcs),
.irqs_0_irq_trig (irqs_0_irq_trig),
.bypass_cdc (bypass_cdc)
);

//WILL CONNECT TO AXI MOSI_IF_0 AND MISO_IF_0
// vivado_axi_master_packet_generator
vivado_axi_master_write_only_with_full_ports # ( 
.C_M_TARGET_SLAVE_BASE_ADDR (`AXI_WR_BFF_BASE_ADDR),
.C_M_AXI_BURST_LEN (256),
.C_M_AXI_ID_WIDTH (8),
.C_M_AXI_ADDR_WIDTH (`AXI_ADDR_WIDTH),
.C_M_AXI_DATA_WIDTH (`AXI_DATA_WIDTH),
.C_M_AXI_AWUSER_WIDTH (0),
.C_M_AXI_ARUSER_WIDTH (0),
.C_M_AXI_WUSER_WIDTH (0),
.C_M_AXI_RUSER_WIDTH (0),
.C_M_AXI_BUSER_WIDTH (0)
) vivado_axi_master_packet_generator_inst (
.INIT_AXI_TXN (INIT_AXI_TXN_M_AXI_0),         // Initialize AXI transaction
.TXN_DONE (TXN_DONE_M_AXI_0),             // Transaction done signal
.ERROR (ERROR_M_AXI_0),                // Error signal
.M_AXI_ACLK (clk_axi[0]),           // AXI clock signal  clk_axi_0
.M_AXI_ARESETN (~arst_axi[0]),        // AXI reset signal (active low) ~arst_axi_0
.M_AXI_AWID (axi_mosi_if_0_awid),           // AXI write address ID
.M_AXI_AWADDR (axi_mosi_if_0_awaddr),         // AXI write address 
.M_AXI_AWLEN (axi_mosi_if_0_awlen),          // AXI burst length (write)
.M_AXI_AWSIZE (axi_mosi_if_0_awsize),         // AXI burst size (write)
.M_AXI_AWBURST (axi_mosi_if_0_awburst),        // AXI burst type (write)
.M_AXI_AWLOCK (axi_mosi_if_0_awlock),         // AXI lock type (write)
.M_AXI_AWCACHE (axi_mosi_if_0_awcache),        // AXI cache type (write)
.M_AXI_AWPROT (axi_mosi_if_0_awprot),         // AXI protection type (write)
.M_AXI_AWQOS (axi_mosi_if_0_awqos),          // AXI QoS identifier (write)
.M_AXI_AWUSER (axi_mosi_if_0_awuser),         // AXI user signal (write address)
.M_AXI_AWVALID (axi_mosi_if_0_awvalid),        // AXI write address valid
.M_AXI_AWREADY (axi_miso_if_0_awready),        // AXI write address ready
.M_AXI_WDATA (axi_mosi_if_0_wdata),          // AXI write data
.M_AXI_WSTRB (axi_mosi_if_0_wstrb),          // AXI write strobes
.M_AXI_WLAST (axi_mosi_if_0_wlast),          // AXI write last signal
.M_AXI_WUSER (axi_mosi_if_0_wuser),          // AXI user signal (write data)
.M_AXI_WVALID (axi_mosi_if_0_wvalid),         // AXI write valid
.M_AXI_WREADY (axi_miso_if_0_wready),         // AXI write ready
.M_AXI_BID (axi_miso_if_0_bid),            // AXI write response ID
.M_AXI_BRESP (axi_miso_if_0_bresp),          // AXI write response
.M_AXI_BUSER (axi_miso_if_0_buser),          // AXI user signal (write response)
.M_AXI_BVALID (axi_miso_if_0_bvalid),         // AXI write response valid
.M_AXI_BREADY (axi_mosi_if_0_bready),         // AXI write response ready
.M_AXI_ARID (axi_mosi_if_0_arid),           // AXI read address ID
.M_AXI_ARADDR (axi_mosi_if_0_araddr),         // AXI read address
.M_AXI_ARLEN (axi_mosi_if_0_arlen),          // AXI burst length (read)
.M_AXI_ARSIZE (axi_mosi_if_0_arsize),         // AXI burst size (read)
.M_AXI_ARBURST (axi_mosi_if_0_arburst),        // AXI burst type (read)
.M_AXI_ARLOCK (axi_mosi_if_0_arlock),         // AXI lock type (read)
.M_AXI_ARCACHE (axi_mosi_if_0_arcache),        // AXI cache type (read)
.M_AXI_ARPROT (axi_mosi_if_0_arprot),         // AXI protection type (read)
.M_AXI_ARQOS (axi_mosi_if_0_arqos),          // AXI QoS identifier (read)
.M_AXI_ARUSER (axi_mosi_if_0_aruser),         // AXI user signal (read address)
.M_AXI_ARVALID (axi_mosi_if_0_arvalid),        // AXI read address valid
.M_AXI_ARREADY (axi_miso_if_0_arready),        // AXI read address ready
.M_AXI_RID (axi_miso_if_0_rid),            // AXI read response ID
.M_AXI_RDATA (axi_miso_if_0_rdata),          // AXI read data
.M_AXI_RRESP (axi_miso_if_0_rresp),          // AXI read response
.M_AXI_RLAST (axi_miso_if_0_rlast),          // AXI read last signal
.M_AXI_RUSER (axi_miso_if_0_ruser),          // AXI user signal (read data)
.M_AXI_RVALID (axi_miso_if_0_rvalid),         // AXI read data valid
.M_AXI_RREADY (axi_mosi_if_0_rready)          // AXI read data ready
);

//WILL CONNECT TO AXI MOSI_IF_3 AND MISO_IF_3 
//vivado_axi_master_packet_memory
vivado_axi_master_read_only_with_full_ports # ( 
.C_M_TARGET_SLAVE_BASE_ADDR (`AXI_RD_BFF_BASE_ADDR),
.C_M_AXI_BURST_LEN (256),
.C_M_AXI_ID_WIDTH (8),
.C_M_AXI_ADDR_WIDTH (`AXI_ADDR_WIDTH),
.C_M_AXI_DATA_WIDTH (`AXI_DATA_WIDTH),
.C_M_AXI_AWUSER_WIDTH (0),
.C_M_AXI_ARUSER_WIDTH (0),
.C_M_AXI_WUSER_WIDTH (0),
.C_M_AXI_RUSER_WIDTH (0),
.C_M_AXI_BUSER_WIDTH (0)
) vivado_axi_master_packet_memory_inst (
.INIT_AXI_TXN (INIT_AXI_TXN_M_AXI_3),         // Initialize AXI transaction
.TXN_DONE (TXN_DONE_M_AXI_3),             // Transaction done signal
.ERROR (ERROR_M_AXI_3),                // Error signal
.M_AXI_ACLK (clk_axi[3]),           // AXI clock signal clk_axi_3
.M_AXI_ARESETN (~arst_axi[3]),        // AXI reset signal (active low) ~arst_axi_3
.M_AXI_AWID (axi_mosi_if_3_awid),           // AXI write address ID
.M_AXI_AWADDR (axi_mosi_if_3_awaddr),         // AXI write address
.M_AXI_AWLEN (axi_mosi_if_3_awlen),          // AXI burst length (write)
.M_AXI_AWSIZE (axi_mosi_if_3_awsize),         // AXI burst size (write)
.M_AXI_AWBURST (axi_mosi_if_3_awburst),        // AXI burst type (write)
.M_AXI_AWLOCK (axi_mosi_if_3_awlock),         // AXI lock type (write)
.M_AXI_AWCACHE (axi_mosi_if_3_awcache),        // AXI cache type (write)
.M_AXI_AWPROT (axi_mosi_if_3_awprot),         // AXI protection type (write)
.M_AXI_AWQOS (axi_mosi_if_3_awqos),          // AXI QoS identifier (write)
.M_AXI_AWUSER (axi_mosi_if_3_awuser),         // AXI user signal (write address)
.M_AXI_AWVALID (axi_mosi_if_3_awvalid),        // AXI write address valid
.M_AXI_AWREADY (axi_miso_if_3_awready),        // AXI write address ready
.M_AXI_WDATA (axi_mosi_if_3_wdata),          // AXI write data
.M_AXI_WSTRB (axi_mosi_if_3_wstrb),          // AXI write strobes
.M_AXI_WLAST (axi_mosi_if_3_wlast),          // AXI write last signal
.M_AXI_WUSER (axi_mosi_if_3_wuser),          // AXI user signal (write data)
.M_AXI_WVALID (axi_mosi_if_3_wvalid),         // AXI write valid
.M_AXI_WREADY (axi_miso_if_3_wready),         // AXI write ready
.M_AXI_BID (axi_miso_if_3_bid),            // AXI write response ID
.M_AXI_BRESP (axi_miso_if_3_bresp),          // AXI write response
.M_AXI_BUSER (axi_miso_if_3_buser),          // AXI user signal (write response)
.M_AXI_BVALID (axi_miso_if_3_bvalid),         // AXI write response valid
.M_AXI_BREADY (axi_mosi_if_3_bready),         // AXI write response ready
.M_AXI_ARID (axi_mosi_if_3_arid),           // AXI read address ID
.M_AXI_ARADDR (axi_mosi_if_3_araddr),         // AXI read address
.M_AXI_ARLEN (axi_mosi_if_3_arlen),          // AXI burst length (read)
.M_AXI_ARSIZE (axi_mosi_if_3_arsize),         // AXI burst size (read)
.M_AXI_ARBURST (axi_mosi_if_3_arburst),        // AXI burst type (read)
.M_AXI_ARLOCK (axi_mosi_if_3_arlock),         // AXI lock type (read)
.M_AXI_ARCACHE (axi_mosi_if_3_arcache),        // AXI cache type (read)
.M_AXI_ARPROT (axi_mosi_if_3_arprot),         // AXI protection type (read)
.M_AXI_ARQOS (axi_mosi_if_3_arqos),          // AXI QoS identifier (read)
.M_AXI_ARUSER (axi_mosi_if_3_aruser),         // AXI user signal (read address)
.M_AXI_ARVALID (axi_mosi_if_3_arvalid),        // AXI read address valid
.M_AXI_ARREADY (axi_miso_if_3_arready),        // AXI read address ready
.M_AXI_RID (axi_miso_if_3_rid),            // AXI read response ID
.M_AXI_RDATA (axi_miso_if_3_rdata),          // AXI read data
.M_AXI_RRESP (axi_miso_if_3_rresp),          // AXI read response
.M_AXI_RLAST (axi_miso_if_3_rlast),          // AXI read last signal
.M_AXI_RUSER (axi_miso_if_3_ruser),          // AXI user signal (read data)
.M_AXI_RVALID (axi_miso_if_3_rvalid),         // AXI read data valid
.M_AXI_RREADY (axi_mosi_if_3_rready)          // AXI read data ready
);

endmodule