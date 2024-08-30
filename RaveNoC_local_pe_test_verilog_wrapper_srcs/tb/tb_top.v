`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 03:42:37 PM
// Design Name: 
// Module Name: tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_top;

// Clock and Reset signals
reg [3:0] clk_axi;
//reg clk_axi_0;
//reg clk_axi_3;
reg clk_noc;
reg [3:0] arst_axi;
//reg arst_axi_0;
//reg arst_axi_3;
reg arst_noc;

// AXI Master control signals
reg INIT_AXI_TXN_M_AXI_0;
wire TXN_DONE_M_AXI_0;
wire ERROR_M_AXI_0;

reg INIT_AXI_TXN_M_AXI_3;
wire TXN_DONE_M_AXI_3;
wire ERROR_M_AXI_3;

// IRQs and bypass CDC
wire [2:0] irqs_3_irq_vcs;
wire irqs_3_irq_trig;
wire [2:0] irqs_2_irq_vcs;
wire irqs_2_irq_trig;
wire [2:0] irqs_1_irq_vcs;
wire irqs_1_irq_trig;
wire [2:0] irqs_0_irq_vcs;
wire irqs_0_irq_trig;
reg [3:0] bypass_cdc;

// Clock Generation
//always #10 clk_axi_0 = ~clk_axi_0;   // 50 MHz
//always #10 clk_axi_3 = ~clk_axi_3;   // 50 MHz
always #10 clk_noc = ~clk_noc;      // 50 MHz
always #10 clk_axi = ~clk_axi;      // 50 MHz for all clocks in clk_axi

initial begin
    // Initialize clocks and resets
    bypass_cdc = 4'b1111;
    //clk_axi_0 = 0;
    //clk_axi_3 = 0;
    clk_noc = 0;
    clk_axi = 4'b0000;

    //arst_axi_0 = 1; // Reset is active high
    //arst_axi_3 = 1;
    arst_noc = 1;
    arst_axi = 4'b1111;

    INIT_AXI_TXN_M_AXI_0 = 0;
    INIT_AXI_TXN_M_AXI_3 = 0;

    bypass_cdc = 4'b1111;

    // Wait for 100 ns and then deassert reset
    #100;
    //arst_axi_0 = 0;
    //arst_axi_3 = 0;
    arst_noc = 0;
    arst_axi = 4'b0000;

    // Wait for some time for the module to stabilize
    #100;

    // Start AXI transaction for Master 0
    INIT_AXI_TXN_M_AXI_0 = 1;
    INIT_AXI_TXN_M_AXI_3 = 1;
    //#10;
    //INIT_AXI_TXN_M_AXI_0 = 0;

    // Wait for transaction to complete
    //wait(TXN_DONE_M_AXI_0 == 1);
    //$display("AXI Master 0 Transaction Completed");

    // Start AXI transaction for Master 3
    //INIT_AXI_TXN_M_AXI_3 = 1;
    //#10;
    //INIT_AXI_TXN_M_AXI_3 = 0;

    // Wait for transaction to complete
   // wait(TXN_DONE_M_AXI_3 == 1);
    //$display("AXI Master 3 Transaction Completed");

    // Check for errors
    if (ERROR_M_AXI_0 || ERROR_M_AXI_3) begin
        $display("ERROR: AXI transaction failed");
    end else begin
        $display("SUCCESS: All AXI transactions completed successfully");
    end

    // End simulation
    #22000;
    $stop;
end

// Instantiate the DUT (Device Under Test)
ravenoc_local_pe_test uut (
    .clk_axi(clk_axi),
    //.clk_axi_0(clk_axi[0]),
    //.clk_axi_3(clk_axi[3]),
    .clk_noc(clk_noc),
    .arst_axi(arst_axi),
    //.arst_axi_0(arst_axi[0]),
    //.arst_axi_3(arst_axi[3]),
    .arst_noc(arst_noc),
    .INIT_AXI_TXN_M_AXI_0(INIT_AXI_TXN_M_AXI_0),
    .TXN_DONE_M_AXI_0(TXN_DONE_M_AXI_0),
    .ERROR_M_AXI_0(ERROR_M_AXI_0),
    .INIT_AXI_TXN_M_AXI_3(INIT_AXI_TXN_M_AXI_3),
    .TXN_DONE_M_AXI_3(TXN_DONE_M_AXI_3),
    .ERROR_M_AXI_3(ERROR_M_AXI_3),
    .irqs_3_irq_vcs(irqs_3_irq_vcs),
    .irqs_3_irq_trig(irqs_3_irq_trig),
    .irqs_2_irq_vcs(irqs_2_irq_vcs),
    .irqs_2_irq_trig(irqs_2_irq_trig),
    .irqs_1_irq_vcs(irqs_1_irq_vcs),
    .irqs_1_irq_trig(irqs_1_irq_trig),
    .irqs_0_irq_vcs(irqs_0_irq_vcs),
    .irqs_0_irq_trig(irqs_0_irq_trig),
    .bypass_cdc(bypass_cdc)
);

endmodule
