//OUR NOC SIZE IS 4, THIS WRAPPER WON'T WORK FOR OTHER SIZES !!!!
//ALSO WON'T WORK FOR OTHER SIZES OF AXI INTERFACE, i.e IF U CHANGE AXI DEFINES in ravenoc_defines.sv
`timescale 1 ns / 1 ps
module ravenoc_verilog_wrapper
import amba_axi_pkg::*;
import ravenoc_pkg::*; 
(
clk_axi,
clk_noc,
arst_axi,
arst_noc,
axi_mosi_if_3_awid,
axi_mosi_if_3_awaddr,
axi_mosi_if_3_awlen,
axi_mosi_if_3_awsize,
axi_mosi_if_3_awburst,
axi_mosi_if_3_awlock,
axi_mosi_if_3_awcache,
axi_mosi_if_3_awprot,
axi_mosi_if_3_awqos,
axi_mosi_if_3_awregion,
axi_mosi_if_3_awuser,
axi_mosi_if_3_awvalid,
axi_mosi_if_3_wdata,
axi_mosi_if_3_wstrb,
axi_mosi_if_3_wlast,
axi_mosi_if_3_wuser,
axi_mosi_if_3_wvalid,
axi_mosi_if_3_bready,
axi_mosi_if_3_arid,
axi_mosi_if_3_araddr,
axi_mosi_if_3_arlen,
axi_mosi_if_3_arsize,
axi_mosi_if_3_arburst,
axi_mosi_if_3_arlock,
axi_mosi_if_3_arcache,
axi_mosi_if_3_arprot,
axi_mosi_if_3_arqos,
axi_mosi_if_3_arregion,
axi_mosi_if_3_aruser,
axi_mosi_if_3_arvalid,
axi_mosi_if_3_rready,
axi_mosi_if_2_awid,
axi_mosi_if_2_awaddr,
axi_mosi_if_2_awlen,
axi_mosi_if_2_awsize,
axi_mosi_if_2_awburst,
axi_mosi_if_2_awlock,
axi_mosi_if_2_awcache,
axi_mosi_if_2_awprot,
axi_mosi_if_2_awqos,
axi_mosi_if_2_awregion,
axi_mosi_if_2_awuser,
axi_mosi_if_2_awvalid,
axi_mosi_if_2_wdata,
axi_mosi_if_2_wstrb,
axi_mosi_if_2_wlast,
axi_mosi_if_2_wuser,
axi_mosi_if_2_wvalid,
axi_mosi_if_2_bready,
axi_mosi_if_2_arid,
axi_mosi_if_2_araddr,
axi_mosi_if_2_arlen,
axi_mosi_if_2_arsize,
axi_mosi_if_2_arburst,
axi_mosi_if_2_arlock,
axi_mosi_if_2_arcache,
axi_mosi_if_2_arprot,
axi_mosi_if_2_arqos,
axi_mosi_if_2_arregion,
axi_mosi_if_2_aruser,
axi_mosi_if_2_arvalid,
axi_mosi_if_2_rready,
axi_mosi_if_1_awid,
axi_mosi_if_1_awaddr,
axi_mosi_if_1_awlen,
axi_mosi_if_1_awsize,
axi_mosi_if_1_awburst,
axi_mosi_if_1_awlock,
axi_mosi_if_1_awcache,
axi_mosi_if_1_awprot,
axi_mosi_if_1_awqos,
axi_mosi_if_1_awregion,
axi_mosi_if_1_awuser,
axi_mosi_if_1_awvalid,
axi_mosi_if_1_wdata,
axi_mosi_if_1_wstrb,
axi_mosi_if_1_wlast,
axi_mosi_if_1_wuser,
axi_mosi_if_1_wvalid,
axi_mosi_if_1_bready,
axi_mosi_if_1_arid,
axi_mosi_if_1_araddr,
axi_mosi_if_1_arlen,
axi_mosi_if_1_arsize,
axi_mosi_if_1_arburst,
axi_mosi_if_1_arlock,
axi_mosi_if_1_arcache,
axi_mosi_if_1_arprot,
axi_mosi_if_1_arqos,
axi_mosi_if_1_arregion,
axi_mosi_if_1_aruser,
axi_mosi_if_1_arvalid,
axi_mosi_if_1_rready,
axi_mosi_if_0_awid,
axi_mosi_if_0_awaddr,
axi_mosi_if_0_awlen,
axi_mosi_if_0_awsize,
axi_mosi_if_0_awburst,
axi_mosi_if_0_awlock,
axi_mosi_if_0_awcache,
axi_mosi_if_0_awprot,
axi_mosi_if_0_awqos,
axi_mosi_if_0_awregion,
axi_mosi_if_0_awuser,
axi_mosi_if_0_awvalid,
axi_mosi_if_0_wdata,
axi_mosi_if_0_wstrb,
axi_mosi_if_0_wlast,
axi_mosi_if_0_wuser,
axi_mosi_if_0_wvalid,
axi_mosi_if_0_bready,
axi_mosi_if_0_arid,
axi_mosi_if_0_araddr,
axi_mosi_if_0_arlen,
axi_mosi_if_0_arsize,
axi_mosi_if_0_arburst,
axi_mosi_if_0_arlock,
axi_mosi_if_0_arcache,
axi_mosi_if_0_arprot,
axi_mosi_if_0_arqos,
axi_mosi_if_0_arregion,
axi_mosi_if_0_aruser,
axi_mosi_if_0_arvalid,
axi_mosi_if_0_rready,
axi_miso_if_3_awready,
axi_miso_if_3_wready,
axi_miso_if_3_bid,
axi_miso_if_3_bresp,
axi_miso_if_3_buser,
axi_miso_if_3_bvalid,
axi_miso_if_3_arready,
axi_miso_if_3_rid,
axi_miso_if_3_rdata,
axi_miso_if_3_rresp,
axi_miso_if_3_rlast,
axi_miso_if_3_ruser,
axi_miso_if_3_rvalid,
axi_miso_if_2_awready,
axi_miso_if_2_wready,
axi_miso_if_2_bid,
axi_miso_if_2_bresp,
axi_miso_if_2_buser,
axi_miso_if_2_bvalid,
axi_miso_if_2_arready,
axi_miso_if_2_rid,
axi_miso_if_2_rdata,
axi_miso_if_2_rresp,
axi_miso_if_2_rlast,
axi_miso_if_2_ruser,
axi_miso_if_2_rvalid,
axi_miso_if_1_awready,
axi_miso_if_1_wready,
axi_miso_if_1_bid,
axi_miso_if_1_bresp,
axi_miso_if_1_buser,
axi_miso_if_1_bvalid,
axi_miso_if_1_arready,
axi_miso_if_1_rid,
axi_miso_if_1_rdata,
axi_miso_if_1_rresp,
axi_miso_if_1_rlast,
axi_miso_if_1_ruser,
axi_miso_if_1_rvalid,
axi_miso_if_0_awready,
axi_miso_if_0_wready,
axi_miso_if_0_bid,
axi_miso_if_0_bresp,
axi_miso_if_0_buser,
axi_miso_if_0_bvalid,
axi_miso_if_0_arready,
axi_miso_if_0_rid,
axi_miso_if_0_rdata,
axi_miso_if_0_rresp,
axi_miso_if_0_rlast,
axi_miso_if_0_ruser,
axi_miso_if_0_rvalid,
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

input [3:0] clk_axi;
input clk_noc;
input [3:0] arst_axi;
input arst_noc;
input [7:0] axi_mosi_if_3_awid;
input [31:0] axi_mosi_if_3_awaddr;
input [7:0] axi_mosi_if_3_awlen;
input [2:0] axi_mosi_if_3_awsize;
input [1:0] axi_mosi_if_3_awburst;
input  axi_mosi_if_3_awlock;
input [3:0] axi_mosi_if_3_awcache;
input [2:0] axi_mosi_if_3_awprot;
input [3:0] axi_mosi_if_3_awqos;
input [3:0] axi_mosi_if_3_awregion; //USER DEFINED 0, check this in simulation
input [0:0] axi_mosi_if_3_awuser;
input  axi_mosi_if_3_awvalid;
input [31:0] axi_mosi_if_3_wdata;
input [3:0] axi_mosi_if_3_wstrb;
input  axi_mosi_if_3_wlast;
input [0:0] axi_mosi_if_3_wuser;
input  axi_mosi_if_3_wvalid;
input  axi_mosi_if_3_bready;
input [7:0] axi_mosi_if_3_arid;
input [31:0] axi_mosi_if_3_araddr;
input [7:0] axi_mosi_if_3_arlen;
input [2:0] axi_mosi_if_3_arsize;
input [1:0] axi_mosi_if_3_arburst;
input  axi_mosi_if_3_arlock;
input [3:0] axi_mosi_if_3_arcache;
input [2:0] axi_mosi_if_3_arprot;
input [3:0] axi_mosi_if_3_arqos;
input [3:0] axi_mosi_if_3_arregion;
input [0:0] axi_mosi_if_3_aruser;
input  axi_mosi_if_3_arvalid;
input  axi_mosi_if_3_rready;
input [7:0] axi_mosi_if_2_awid;
input [31:0] axi_mosi_if_2_awaddr;
input [7:0] axi_mosi_if_2_awlen;
input [2:0] axi_mosi_if_2_awsize;
input [1:0] axi_mosi_if_2_awburst;
input  axi_mosi_if_2_awlock;
input [3:0] axi_mosi_if_2_awcache;
input [2:0] axi_mosi_if_2_awprot;
input [3:0] axi_mosi_if_2_awqos;
input [3:0] axi_mosi_if_2_awregion;
input [0:0] axi_mosi_if_2_awuser;
input  axi_mosi_if_2_awvalid;
input [31:0] axi_mosi_if_2_wdata;
input [3:0] axi_mosi_if_2_wstrb;
input  axi_mosi_if_2_wlast;
input [0:0] axi_mosi_if_2_wuser;
input  axi_mosi_if_2_wvalid;
input  axi_mosi_if_2_bready;
input [7:0] axi_mosi_if_2_arid;
input [31:0] axi_mosi_if_2_araddr;
input [7:0] axi_mosi_if_2_arlen;
input [2:0] axi_mosi_if_2_arsize;
input [1:0] axi_mosi_if_2_arburst;
input  axi_mosi_if_2_arlock;
input [3:0] axi_mosi_if_2_arcache;
input [2:0] axi_mosi_if_2_arprot;
input [3:0] axi_mosi_if_2_arqos;
input [3:0] axi_mosi_if_2_arregion;
input [0:0] axi_mosi_if_2_aruser;
input  axi_mosi_if_2_arvalid;
input  axi_mosi_if_2_rready;
input [7:0] axi_mosi_if_1_awid;
input [31:0] axi_mosi_if_1_awaddr;
input [7:0] axi_mosi_if_1_awlen;
input [2:0] axi_mosi_if_1_awsize;
input [1:0] axi_mosi_if_1_awburst;
input  axi_mosi_if_1_awlock;
input [3:0] axi_mosi_if_1_awcache;
input [2:0] axi_mosi_if_1_awprot;
input [3:0] axi_mosi_if_1_awqos;
input [3:0] axi_mosi_if_1_awregion;
input [0:0] axi_mosi_if_1_awuser;
input  axi_mosi_if_1_awvalid;
input [31:0] axi_mosi_if_1_wdata;
input [3:0] axi_mosi_if_1_wstrb;
input  axi_mosi_if_1_wlast;
input [0:0] axi_mosi_if_1_wuser;
input  axi_mosi_if_1_wvalid;
input  axi_mosi_if_1_bready;
input [7:0] axi_mosi_if_1_arid;
input [31:0] axi_mosi_if_1_araddr;
input [7:0] axi_mosi_if_1_arlen;
input [2:0] axi_mosi_if_1_arsize;
input [1:0] axi_mosi_if_1_arburst;
input  axi_mosi_if_1_arlock;
input [3:0] axi_mosi_if_1_arcache;
input [2:0] axi_mosi_if_1_arprot;
input [3:0] axi_mosi_if_1_arqos;
input [3:0] axi_mosi_if_1_arregion;
input [0:0] axi_mosi_if_1_aruser;
input  axi_mosi_if_1_arvalid;
input  axi_mosi_if_1_rready;
input [7:0] axi_mosi_if_0_awid;
input [31:0] axi_mosi_if_0_awaddr;
input [7:0] axi_mosi_if_0_awlen;
input [2:0] axi_mosi_if_0_awsize;
input [1:0] axi_mosi_if_0_awburst;
input  axi_mosi_if_0_awlock;
input [3:0] axi_mosi_if_0_awcache;
input [2:0] axi_mosi_if_0_awprot;
input [3:0] axi_mosi_if_0_awqos;
input [3:0] axi_mosi_if_0_awregion;
input [0:0] axi_mosi_if_0_awuser;
input  axi_mosi_if_0_awvalid;
input [31:0] axi_mosi_if_0_wdata;
input [3:0] axi_mosi_if_0_wstrb;
input  axi_mosi_if_0_wlast;
input [0:0] axi_mosi_if_0_wuser;
input  axi_mosi_if_0_wvalid;
input  axi_mosi_if_0_bready;
input [7:0] axi_mosi_if_0_arid;
input [31:0] axi_mosi_if_0_araddr;
input [7:0] axi_mosi_if_0_arlen;
input [2:0] axi_mosi_if_0_arsize;
input [1:0] axi_mosi_if_0_arburst;
input  axi_mosi_if_0_arlock;
input [3:0] axi_mosi_if_0_arcache;
input [2:0] axi_mosi_if_0_arprot;
input [3:0] axi_mosi_if_0_arqos;
input [3:0] axi_mosi_if_0_arregion;
input [0:0] axi_mosi_if_0_aruser;
input  axi_mosi_if_0_arvalid;
input  axi_mosi_if_0_rready;
output  axi_miso_if_3_awready;
output  axi_miso_if_3_wready;
output [7:0] axi_miso_if_3_bid;
output [1:0] axi_miso_if_3_bresp;
output [0:0] axi_miso_if_3_buser;
output  axi_miso_if_3_bvalid;
output  axi_miso_if_3_arready;
output [7:0] axi_miso_if_3_rid;
output [31:0] axi_miso_if_3_rdata;
output [1:0] axi_miso_if_3_rresp;
output  axi_miso_if_3_rlast;
output [0:0] axi_miso_if_3_ruser;
output  axi_miso_if_3_rvalid;
output  axi_miso_if_2_awready;
output  axi_miso_if_2_wready;
output [7:0] axi_miso_if_2_bid;
output [1:0] axi_miso_if_2_bresp;
output [0:0] axi_miso_if_2_buser;
output  axi_miso_if_2_bvalid;
output  axi_miso_if_2_arready;
output [7:0] axi_miso_if_2_rid;
output [31:0] axi_miso_if_2_rdata;
output [1:0] axi_miso_if_2_rresp;
output  axi_miso_if_2_rlast;
output [0:0] axi_miso_if_2_ruser;
output  axi_miso_if_2_rvalid;
output  axi_miso_if_1_awready;
output  axi_miso_if_1_wready;
output [7:0] axi_miso_if_1_bid;
output [1:0] axi_miso_if_1_bresp;
output [0:0] axi_miso_if_1_buser;
output  axi_miso_if_1_bvalid;
output  axi_miso_if_1_arready;
output [7:0] axi_miso_if_1_rid;
output [31:0] axi_miso_if_1_rdata;
output [1:0] axi_miso_if_1_rresp;
output  axi_miso_if_1_rlast;
output [0:0] axi_miso_if_1_ruser;
output  axi_miso_if_1_rvalid;
output  axi_miso_if_0_awready;
output  axi_miso_if_0_wready;
output [7:0] axi_miso_if_0_bid;
output [1:0] axi_miso_if_0_bresp;
output [0:0] axi_miso_if_0_buser;
output  axi_miso_if_0_bvalid;
output  axi_miso_if_0_arready;
output [7:0] axi_miso_if_0_rid;
output [31:0] axi_miso_if_0_rdata;
output [1:0] axi_miso_if_0_rresp;
output  axi_miso_if_0_rlast;
output [0:0] axi_miso_if_0_ruser;
output  axi_miso_if_0_rvalid;
output [2:0] irqs_3_irq_vcs;
output irqs_3_irq_trig;
output [2:0] irqs_2_irq_vcs;
output irqs_2_irq_trig;
output [2:0] irqs_1_irq_vcs;
output irqs_1_irq_trig;
output [2:0] irqs_0_irq_vcs;
output irqs_0_irq_trig;
input [3:0]bypass_cdc;

//OUR NOC SIZE IS 4, THIS WRAPPER WON'T WORK FOR OTHER SIZES !!!!
s_axi_mosi_t [NoCSize-1:0] axi_mosi;
s_axi_miso_t [NoCSize-1:0] axi_miso;
s_irq_ni_t   [NoCSize-1:0] irqs;
logic        [NoCSize-1:0] bypass_cdc_vec;
logic        [NoCSize-1:0] clk_axi_array;
logic        [NoCSize-1:0] arst_axi_array;

//HAD TO DO SOME TYPECASTING SINCE ENUMS TYPES DONT ACCEPTS DEFAULT VALUES
always @(*) begin
    clk_axi_array = clk_axi;
    arst_axi_array = arst_axi;
    //AXI_MOSI_IF_0
    axi_mosi[0].awid     = axi_mosi_if_0_awid;
    axi_mosi[0].awaddr   = axi_mosi_if_0_awaddr;
    axi_mosi[0].awlen    = axi_mosi_if_0_awlen;
    axi_mosi[0].awsize   = axi_size_t'(axi_mosi_if_0_awsize); //EXAMPLE TYPECASTING
    axi_mosi[0].awburst  = axi_burst_t'(axi_mosi_if_0_awburst);
    axi_mosi[0].awlock   = axi_mosi_if_0_awlock;
    axi_mosi[0].awcache  = axi_mosi_if_0_awcache;
    axi_mosi[0].awprot   = axi_prot_t'(axi_mosi_if_0_awprot);
    axi_mosi[0].awqos    = axi_mosi_if_0_awqos;
    axi_mosi[0].awregion = axi_mosi_if_0_awregion;
    axi_mosi[0].awuser   = axi_mosi_if_0_awuser;
    axi_mosi[0].awvalid  = axi_mosi_if_0_awvalid;
    //axi_mosi[0].wid      = axi_mosi_if_0_wid;
    axi_mosi[0].wdata    = axi_mosi_if_0_wdata;
    axi_mosi[0].wstrb    = axi_mosi_if_0_wstrb;
    axi_mosi[0].wlast    = axi_mosi_if_0_wlast;
    axi_mosi[0].wuser    = axi_mosi_if_0_wuser;
    axi_mosi[0].wvalid   = axi_mosi_if_0_wvalid;
    axi_mosi[0].bready   = axi_mosi_if_0_bready;
    axi_mosi[0].arid     = axi_mosi_if_0_arid;
    axi_mosi[0].araddr   = axi_mosi_if_0_araddr;
    axi_mosi[0].arlen    = axi_mosi_if_0_arlen;
    axi_mosi[0].arsize   = axi_size_t'(axi_mosi_if_0_arsize);
    axi_mosi[0].arburst  = axi_burst_t'(axi_mosi_if_0_arburst);
    axi_mosi[0].arlock   = axi_mosi_if_0_arlock;
    axi_mosi[0].arcache  = axi_mosi_if_0_arcache;
    axi_mosi[0].arprot   = axi_prot_t'(axi_mosi_if_0_arprot);
    axi_mosi[0].arqos    = axi_mosi_if_0_arqos;
    axi_mosi[0].arregion = axi_mosi_if_0_arregion;
    axi_mosi[0].aruser   = axi_mosi_if_0_aruser;
    axi_mosi[0].arvalid  = axi_mosi_if_0_arvalid;
    axi_mosi[0].rready   = axi_mosi_if_0_rready;

    //AXI_MOSI_IF_1
    axi_mosi[1].awid     = axi_mosi_if_1_awid;
    axi_mosi[1].awaddr   = axi_mosi_if_1_awaddr;
    axi_mosi[1].awlen    = axi_mosi_if_1_awlen;
    axi_mosi[1].awsize   = axi_size_t'(axi_mosi_if_1_awsize);
    axi_mosi[1].awburst  = axi_burst_t'(axi_mosi_if_1_awburst);
    axi_mosi[1].awlock   = axi_mosi_if_1_awlock;
    axi_mosi[1].awcache  = axi_mosi_if_1_awcache;
    axi_mosi[1].awprot   = axi_prot_t'(axi_mosi_if_1_awprot);
    axi_mosi[1].awqos    = axi_mosi_if_1_awqos;
    axi_mosi[1].awregion = axi_mosi_if_1_awregion;
    axi_mosi[1].awuser   = axi_mosi_if_1_awuser;
    axi_mosi[1].awvalid  = axi_mosi_if_1_awvalid;
    axi_mosi[1].wdata    = axi_mosi_if_1_wdata;
    axi_mosi[1].wstrb    = axi_mosi_if_1_wstrb;
    axi_mosi[1].wlast    = axi_mosi_if_1_wlast;
    axi_mosi[1].wuser    = axi_mosi_if_1_wuser;
    axi_mosi[1].wvalid   = axi_mosi_if_1_wvalid;
    axi_mosi[1].bready   = axi_mosi_if_1_bready;
    axi_mosi[1].arid     = axi_mosi_if_1_arid;
    axi_mosi[1].araddr   = axi_mosi_if_1_araddr;
    axi_mosi[1].arlen    = axi_mosi_if_1_arlen;
    axi_mosi[1].arsize   = axi_size_t'(axi_mosi_if_1_arsize);
    axi_mosi[1].arburst  = axi_burst_t'(axi_mosi_if_1_arburst);
    axi_mosi[1].arlock   = axi_mosi_if_1_arlock;
    axi_mosi[1].arcache  = axi_mosi_if_1_arcache;
    axi_mosi[1].arprot   = axi_prot_t'(axi_mosi_if_1_arprot);
    axi_mosi[1].arqos    = axi_mosi_if_1_arqos;
    axi_mosi[1].arregion = axi_mosi_if_1_arregion;
    axi_mosi[1].aruser   = axi_mosi_if_1_aruser;
    axi_mosi[1].arvalid  = axi_mosi_if_1_arvalid;
    axi_mosi[1].rready   = axi_mosi_if_1_rready;

    //AXI_MOSI_IF_2
    axi_mosi[2].awid     = axi_mosi_if_2_awid;
    axi_mosi[2].awaddr   = axi_mosi_if_2_awaddr;
    axi_mosi[2].awlen    = axi_mosi_if_2_awlen;
    axi_mosi[2].awsize   = axi_size_t'(axi_mosi_if_2_awsize);
    axi_mosi[2].awburst  = axi_burst_t'(axi_mosi_if_2_awburst);
    axi_mosi[2].awlock   = axi_mosi_if_2_awlock;
    axi_mosi[2].awcache  = axi_mosi_if_2_awcache;
    axi_mosi[2].awprot   = axi_prot_t'(axi_mosi_if_2_awprot);
    axi_mosi[2].awqos    = axi_mosi_if_2_awqos;
    axi_mosi[2].awregion = axi_mosi_if_2_awregion;
    axi_mosi[2].awuser   = axi_mosi_if_2_awuser;
    axi_mosi[2].awvalid  = axi_mosi_if_2_awvalid;
    axi_mosi[2].wdata    = axi_mosi_if_2_wdata;
    axi_mosi[2].wstrb    = axi_mosi_if_2_wstrb;
    axi_mosi[2].wlast    = axi_mosi_if_2_wlast;
    axi_mosi[2].wuser    = axi_mosi_if_2_wuser;
    axi_mosi[2].wvalid   = axi_mosi_if_2_wvalid;
    axi_mosi[2].bready   = axi_mosi_if_2_bready;
    axi_mosi[2].arid     = axi_mosi_if_2_arid;
    axi_mosi[2].araddr   = axi_mosi_if_2_araddr;
    axi_mosi[2].arlen    = axi_mosi_if_2_arlen;
    axi_mosi[2].arsize   = axi_size_t'(axi_mosi_if_2_arsize);
    axi_mosi[2].arburst  = axi_burst_t'(axi_mosi_if_2_arburst);
    axi_mosi[2].arlock   = axi_mosi_if_2_arlock;
    axi_mosi[2].arcache  = axi_mosi_if_2_arcache;
    axi_mosi[2].arprot   = axi_prot_t'(axi_mosi_if_2_arprot);
    axi_mosi[2].arqos    = axi_mosi_if_2_arqos;
    axi_mosi[2].arregion = axi_mosi_if_2_arregion;
    axi_mosi[2].aruser   = axi_mosi_if_2_aruser;
    axi_mosi[2].arvalid  = axi_mosi_if_2_arvalid;
    axi_mosi[2].rready   = axi_mosi_if_2_rready;

    //AXI_MOSI_IF_3
    axi_mosi[3].awid     = axi_mosi_if_3_awid;
    axi_mosi[3].awaddr   = axi_mosi_if_3_awaddr;
    axi_mosi[3].awlen    = axi_mosi_if_3_awlen;
    axi_mosi[3].awsize   = axi_size_t'(axi_mosi_if_3_awsize);
    axi_mosi[3].awburst  = axi_burst_t'(axi_mosi_if_3_awburst);
    axi_mosi[3].awlock   = axi_mosi_if_3_awlock;
    axi_mosi[3].awcache  = axi_mosi_if_3_awcache;
    axi_mosi[3].awprot   = axi_prot_t'(axi_mosi_if_3_awprot);
    axi_mosi[3].awqos    = axi_mosi_if_3_awqos;
    axi_mosi[3].awregion = axi_mosi_if_3_awregion;
    axi_mosi[3].awuser   = axi_mosi_if_3_awuser;
    axi_mosi[3].awvalid  = axi_mosi_if_3_awvalid;
    axi_mosi[3].wdata    = axi_mosi_if_3_wdata;
    axi_mosi[3].wstrb    = axi_mosi_if_3_wstrb;
    axi_mosi[3].wlast    = axi_mosi_if_3_wlast;
    axi_mosi[3].wuser    = axi_mosi_if_3_wuser;
    axi_mosi[3].wvalid   = axi_mosi_if_3_wvalid;
    axi_mosi[3].bready   = axi_mosi_if_3_bready;
    axi_mosi[3].arid     = axi_mosi_if_3_arid;
    axi_mosi[3].araddr   = axi_mosi_if_3_araddr;
    axi_mosi[3].arlen    = axi_mosi_if_3_arlen;
    axi_mosi[3].arsize   = axi_size_t'(axi_mosi_if_3_arsize);
    axi_mosi[3].arburst  = axi_burst_t'(axi_mosi_if_3_arburst);
    axi_mosi[3].arlock   = axi_mosi_if_3_arlock;
    axi_mosi[3].arcache  = axi_mosi_if_3_arcache;
    axi_mosi[3].arprot   = axi_prot_t'(axi_mosi_if_3_arprot);
    axi_mosi[3].arqos    = axi_mosi_if_3_arqos;
    axi_mosi[3].arregion = axi_mosi_if_3_arregion;
    axi_mosi[3].aruser   = axi_mosi_if_3_aruser;
    axi_mosi[3].arvalid  = axi_mosi_if_3_arvalid;
    axi_mosi[3].rready   = axi_mosi_if_3_rready;

    //BYPASS_CDC
    bypass_cdc_vec = bypass_cdc;
end
//AXI_MISO_IF_0
assign axi_miso_if_0_awready  = axi_miso[0].awready;
assign axi_miso_if_0_wready   = axi_miso[0].wready;
assign axi_miso_if_0_bid      = axi_miso[0].bid;
assign axi_miso_if_0_bresp    = axi_miso[0].bresp;
assign axi_miso_if_0_buser    = axi_miso[0].buser;
assign axi_miso_if_0_bvalid   = axi_miso[0].bvalid;
assign axi_miso_if_0_arready  = axi_miso[0].arready;
assign axi_miso_if_0_rid      = axi_miso[0].rid;
assign axi_miso_if_0_rdata    = axi_miso[0].rdata;
assign axi_miso_if_0_rresp    = axi_miso[0].rresp;
assign axi_miso_if_0_rlast    = axi_miso[0].rlast;
assign axi_miso_if_0_ruser    = axi_miso[0].ruser;
assign axi_miso_if_0_rvalid   = axi_miso[0].rvalid;
//AXI_MISO_IF_1
assign axi_miso_if_1_awready  = axi_miso[1].awready;
assign axi_miso_if_1_wready   = axi_miso[1].wready;
assign axi_miso_if_1_bid      = axi_miso[1].bid;
assign axi_miso_if_1_bresp    = axi_miso[1].bresp;
assign axi_miso_if_1_buser    = axi_miso[1].buser;
assign axi_miso_if_1_bvalid   = axi_miso[1].bvalid;
assign axi_miso_if_1_arready  = axi_miso[1].arready;
assign axi_miso_if_1_rid      = axi_miso[1].rid;
assign axi_miso_if_1_rdata    = axi_miso[1].rdata;
assign axi_miso_if_1_rresp    = axi_miso[1].rresp;
assign axi_miso_if_1_rlast    = axi_miso[1].rlast;
assign axi_miso_if_1_ruser    = axi_miso[1].ruser;
assign axi_miso_if_1_rvalid   = axi_miso[1].rvalid;
//AXI_MISO_IF_2
assign axi_miso_if_2_awready  = axi_miso[2].awready;
assign axi_miso_if_2_wready   = axi_miso[2].wready;
assign axi_miso_if_2_bid      = axi_miso[2].bid;
assign axi_miso_if_2_bresp    = axi_miso[2].bresp;
assign axi_miso_if_2_buser    = axi_miso[2].buser;
assign axi_miso_if_2_bvalid   = axi_miso[2].bvalid;
assign axi_miso_if_2_arready  = axi_miso[2].arready;
assign axi_miso_if_2_rid      = axi_miso[2].rid;
assign axi_miso_if_2_rdata    = axi_miso[2].rdata;
assign axi_miso_if_2_rresp    = axi_miso[2].rresp;
assign axi_miso_if_2_rlast    = axi_miso[2].rlast;
assign axi_miso_if_2_ruser    = axi_miso[2].ruser;
assign axi_miso_if_2_rvalid   = axi_miso[2].rvalid;
//AXI_MISO_IF_3
assign axi_miso_if_3_awready  = axi_miso[3].awready;
assign axi_miso_if_3_wready   = axi_miso[3].wready;
assign axi_miso_if_3_bid      = axi_miso[3].bid;
assign axi_miso_if_3_bresp    = axi_miso[3].bresp;
assign axi_miso_if_3_buser    = axi_miso[3].buser;
assign axi_miso_if_3_bvalid   = axi_miso[3].bvalid;
assign axi_miso_if_3_arready  = axi_miso[3].arready;
assign axi_miso_if_3_rid      = axi_miso[3].rid;
assign axi_miso_if_3_rdata    = axi_miso[3].rdata;
assign axi_miso_if_3_rresp    = axi_miso[3].rresp;
assign axi_miso_if_3_rlast    = axi_miso[3].rlast;
assign axi_miso_if_3_ruser    = axi_miso[3].ruser;
assign axi_miso_if_3_rvalid   = axi_miso[3].rvalid;
//IRQS
assign irqs_0_irq_vcs = irqs[0].irq_vcs;
assign irqs_0_irq_trig = irqs[0].irq_trig;
assign irqs_1_irq_vcs = irqs[1].irq_vcs;
assign irqs_1_irq_trig = irqs[1].irq_trig;
assign irqs_2_irq_vcs = irqs[2].irq_vcs;
assign irqs_2_irq_trig = irqs[2].irq_trig;
assign irqs_3_irq_vcs = irqs[3].irq_vcs;
assign irqs_3_irq_trig = irqs[3].irq_trig;


 ravenoc #(
    .AXI_CDC_REQ('1)
  ) u_ravenoc (
    .clk_axi        (clk_axi_array),
    .clk_noc        (clk_noc),
    .arst_axi       (arst_axi_array),
    .arst_noc       (arst_noc),
    .axi_mosi_if    (axi_mosi),
    .axi_miso_if    (axi_miso),
    .irqs           (irqs),
    .bypass_cdc     (bypass_cdc_vec)
  );
    
endmodule