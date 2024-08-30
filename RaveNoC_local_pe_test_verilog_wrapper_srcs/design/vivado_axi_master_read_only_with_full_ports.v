`timescale 1 ns / 1 ps

module vivado_axi_master_read_only_with_full_ports #
(
    // Base address of targeted slave
    parameter  C_M_TARGET_SLAVE_BASE_ADDR = 32'h40000000,
    // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    parameter integer C_M_AXI_BURST_LEN = 16,
    // Thread ID Width
    parameter integer C_M_AXI_ID_WIDTH = 1,
    // Width of Address Bus
    parameter integer C_M_AXI_ADDR_WIDTH = 32,
    // Width of Data Bus
    parameter integer C_M_AXI_DATA_WIDTH = 32,
    // Width of User Write Address Bus
    parameter integer C_M_AXI_AWUSER_WIDTH = 0,
    // Width of User Read Address Bus
    parameter integer C_M_AXI_ARUSER_WIDTH = 0,
    // Width of User Write Data Bus
    parameter integer C_M_AXI_WUSER_WIDTH = 0,
    // Width of User Read Data Bus
    parameter integer C_M_AXI_RUSER_WIDTH = 0,
    // Width of User Response Bus
    parameter integer C_M_AXI_BUSER_WIDTH = 0
)
(
    // Initiate AXI transactions
    input wire  INIT_AXI_TXN,
    // Asserts when transaction is complete
    output wire  TXN_DONE,
    // Asserts when ERROR is detected
    output reg  ERROR,
    // Global Clock Signal.
    input M_AXI_ACLK,
    // Global Reset Signal. This Signal is Active Low
    input M_AXI_ARESETN,
    // Master Interface Write Address ID
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
    // Master Interface Write Address
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0] M_AXI_AWLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0] M_AXI_AWSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0] M_AXI_AWBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    output wire  M_AXI_AWLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    output wire [3 : 0] M_AXI_AWCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_AWPROT,
    // Quality of Service, QoS identifier sent for each write transaction.
    output wire [3 : 0] M_AXI_AWQOS,
    // Optional User-defined signal in the write address channel.
    output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
    // Write address valid. This signal indicates that
    // the channel is signaling valid write address and control information.
    output wire  M_AXI_AWVALID,
    // Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
    input wire  M_AXI_AWREADY,
    // Master Interface Write Data.
    output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
    // Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
    // Write last. This signal indicates the last transfer in a write burst.
    output wire  M_AXI_WLAST,
    // Optional User-defined signal in the write data channel.
    output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
    // Write valid. This signal indicates that valid write
    // data and strobes are available
    output wire  M_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    input wire  M_AXI_WREADY,
    // Master Interface Write Response.
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
    // Write response. This signal indicates the status of the write transaction.
    input wire [1 : 0] M_AXI_BRESP,
    // Optional User-defined signal in the write response channel
    input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
    // Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
    input wire  M_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    output wire  M_AXI_BREADY,
    // Master Interface Read Address.
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
    // Read address. This signal indicates the initial
    // address of a read burst transaction.
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0] M_AXI_ARLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0] M_AXI_ARSIZE,
    // Burst type. The burst type and the size information,
    // determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0] M_AXI_ARBURST,
    // Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
    output wire  M_AXI_ARLOCK,
    // Memory type. This signal indicates how transactions
    // are required to progress through a system.
    output wire [3 : 0] M_AXI_ARCACHE,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_ARPROT,
    // Quality of Service, QoS identifier sent for each read transaction
    output wire [3 : 0] M_AXI_ARQOS,
    // Optional User-defined signal in the read address channel.
    output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
    // Write address valid. This signal indicates that
    // the channel is signaling valid read address and control information
    output wire  M_AXI_ARVALID,
    // Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
    input wire  M_AXI_ARREADY,
    // Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
    // Master Read Data
    input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
    // Read response. This signal indicates the status of the read transfer
    input wire [1 : 0] M_AXI_RRESP,
    // Read last. This signal indicates the last transfer in a read burst
    input wire  M_AXI_RLAST,
    // Optional User-defined signal in the read address channel.
    input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
    // Read valid. This signal indicates that the channel
    // is signaling the required read data.
    input wire  M_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    output wire  M_AXI_RREADY
);

    // function called clogb2 that returns an integer which has the 
    // value of the ceiling of the log base 2.
    function integer clogb2 (input integer bit_depth);
    begin
        for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
            bit_depth = bit_depth >> 1;
    end
    endfunction

    // C_TRANSACTIONS_NUM is the width of the index counter for 
    // number of read transactions.
    localparam integer C_TRANSACTIONS_NUM = clogb2(C_M_AXI_BURST_LEN-1);

    // Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
    // Non-2^n lengths will eventually cause bursts across 4K address boundaries.
    localparam integer C_MASTER_LENGTH = 12;
    // Total number of burst transfers is master length divided by burst length and burst size
    localparam integer C_NO_BURSTS_REQ = C_MASTER_LENGTH-clogb2((C_M_AXI_BURST_LEN*C_M_AXI_DATA_WIDTH/8)-1);
    
    // Example State machine to initialize counter, initialize read transactions,
    // and comparison of read data with the expected data.
    parameter [1:0] IDLE = 2'b00, // This state initiates AXI transaction
                 INIT_READ = 2'b01, // This state initializes read transaction
                 INIT_COMPARE = 2'b11; // This state issues the status of comparison
    
    reg [1:0] mst_exec_state;

    // AXI4 internal temp signals
    reg [C_M_AXI_ADDR_WIDTH-1 : 0]  axi_araddr;
    reg   axi_arvalid;
    reg   axi_rready;
    reg [C_TRANSACTIONS_NUM : 0]  read_index;
    wire [C_TRANSACTIONS_NUM+2 : 0]  burst_size_bytes;
    reg [C_NO_BURSTS_REQ : 0]  read_burst_counter;
    reg   start_single_burst_read;
    reg   reads_done;
    reg   error_reg;
    reg   compare_done;
    reg   read_mismatch;
    reg   burst_read_active;
    reg [C_M_AXI_DATA_WIDTH-1 : 0]  expected_rdata;
    wire   read_resp_error;
    wire   rnext;
    reg   init_txn_ff;
    reg   init_txn_ff2;
    wire   init_txn_pulse;

    // MEMORY BY KUTAY
    reg [31:0] mem [0:255];
    reg [7:0] mem_addr;

    // I/O Connections assignments
    // Default assignments for write-related signals (not used)
    assign M_AXI_AWID = 'b0;
    assign M_AXI_AWADDR = 'b0;
    assign M_AXI_AWLEN = 'b0;
    assign M_AXI_AWSIZE = clogb2((C_M_AXI_DATA_WIDTH/8)-1);
    assign M_AXI_AWBURST = 2'b01;
    assign M_AXI_AWLOCK = 1'b0;
    assign M_AXI_AWCACHE = 4'b0010;
    assign M_AXI_AWPROT = 3'h0;
    assign M_AXI_AWQOS = 4'h0;
    assign M_AXI_AWUSER = 'b0;
    assign M_AXI_AWVALID = 1'b0;
    assign M_AXI_WDATA = 'b0;
    assign M_AXI_WSTRB = 'b0;
    assign M_AXI_WLAST = 1'b0;
    assign M_AXI_WUSER = 'b0;
    assign M_AXI_WVALID = 1'b0;
    assign M_AXI_BREADY = 1'b0;

    // I/O Connections for read operations
    assign M_AXI_ARID = 'b0;
    assign M_AXI_ARADDR = C_M_TARGET_SLAVE_BASE_ADDR + axi_araddr;
    assign M_AXI_ARLEN = C_M_AXI_BURST_LEN - 1;
    assign M_AXI_ARSIZE = clogb2((C_M_AXI_DATA_WIDTH/8)-1);
    assign M_AXI_ARBURST = 2'b01;
    assign M_AXI_ARLOCK = 1'b0;
    assign M_AXI_ARCACHE = 4'b0010;
    assign M_AXI_ARPROT = 3'h0;
    assign M_AXI_ARQOS = 4'h0;
    assign M_AXI_ARUSER = 'b0;
    assign M_AXI_ARVALID = axi_arvalid;
    assign M_AXI_RREADY = axi_rready;
    assign TXN_DONE = compare_done;
    assign burst_size_bytes = C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
    assign init_txn_pulse = (!init_txn_ff2) && init_txn_ff;

    // Generate a pulse to initiate AXI transaction
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0)
        begin
            init_txn_ff <= 1'b0;
            init_txn_ff2 <= 1'b0;
        end
        else
        begin
            init_txn_ff <= INIT_AXI_TXN;
            init_txn_ff2 <= init_txn_ff;
        end
    end

    //--------------------
    // Read Address Channel
    //--------------------

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            axi_arvalid <= 1'b0;
        end
        else if (~axi_arvalid && start_single_burst_read)
        begin
            axi_arvalid <= 1'b1;
        end
        else if (M_AXI_ARREADY && axi_arvalid)
        begin
            axi_arvalid <= 1'b0;
        end
        else
        begin
            axi_arvalid <= axi_arvalid;
        end
    end

    // Next address after ARREADY indicates previous address acceptance
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            axi_araddr <= 'b0;
        end
        else if (M_AXI_ARREADY && axi_arvalid)
        begin
            axi_araddr <= axi_araddr; //+ burst_size_bytes;
        end
        else
        begin
            axi_araddr <= axi_araddr;
        end
    end

    //--------------------------------
    // Read Data (and Response) Channel
    //--------------------------------

    assign rnext = M_AXI_RVALID && axi_rready;

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || start_single_burst_read)
        begin
            read_index <= 0;
        end
        else if (rnext && (read_index != C_M_AXI_BURST_LEN-1))
        begin
            read_index <= read_index + 1;
        end
        else
        begin
            read_index <= read_index;
        end
    end

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            axi_rready <= 1'b0;
        end
        else if (M_AXI_RVALID)
        begin
            if (M_AXI_RLAST && axi_rready)
            begin
                axi_rready <= 1'b0;
            end
            else
            begin
                axi_rready <= 1'b1;
            end
        end
    end

    // Check received read data against expected data
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            read_mismatch <= 1'b0;
        end
        else if (rnext && (M_AXI_RDATA != expected_rdata))
        begin
            read_mismatch <= 1'b1;
        end
        else
        begin
            read_mismatch <= 1'b0;
        end
    end

    // Flag any read response errors
    assign read_resp_error = axi_rready & M_AXI_RVALID & M_AXI_RRESP[1];

    // Example design read check data generator
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            expected_rdata <= {1'b1, 1'b1, 8'h11, 22'b0};
        end
        else if (M_AXI_RVALID && axi_rready)
        begin
            expected_rdata <= expected_rdata + 1;
        end
    end

    //----------------------------------
    // Example design error register
    //----------------------------------

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            error_reg <= 1'b0;
        end
        else if (read_mismatch || read_resp_error)
        begin
            error_reg <= 1'b1;
        end
        else
        begin
            error_reg <= error_reg;
        end
    end

    //--------------------------------
    // Example design throttling
    //--------------------------------

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            read_burst_counter <= 'b0;
        end
        else if (M_AXI_ARREADY && axi_arvalid)
        begin
            if (read_burst_counter[C_NO_BURSTS_REQ] == 1'b0)
            begin
                read_burst_counter <= read_burst_counter + 1'b1;
            end
        end
        else
        begin
            read_burst_counter <= read_burst_counter;
        end
    end

    // Implement master command interface state machine
    always @ ( posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 1'b0 )
        begin
            mst_exec_state <= IDLE;
            start_single_burst_read <= 1'b0;
            compare_done <= 1'b0;
            ERROR <= 1'b0;
        end
        else
        begin
            case (mst_exec_state)
                IDLE:
                begin
                    if (init_txn_pulse == 1'b1)
                    begin
                        mst_exec_state  <= INIT_READ;
                        ERROR <= 1'b0;
                        compare_done <= 1'b0;
                    end
                    else
                    begin
                        mst_exec_state  <= IDLE;
                    end
                end

                INIT_READ:
                begin
                    if (reads_done)
                    begin
                        mst_exec_state <= INIT_COMPARE;
                    end
                    else
                    begin
                        mst_exec_state  <= INIT_READ;
                        if (~axi_arvalid && ~burst_read_active && ~start_single_burst_read)
                        begin
                            start_single_burst_read <= 1'b1;
                        end
                        else
                        begin
                            start_single_burst_read <= 1'b0; // Negate to generate a pulse
                        end
                    end
                end

                INIT_COMPARE:
                begin
                    ERROR <= error_reg;
                    mst_exec_state <= IDLE;
                    compare_done <= 1'b1;
                end

                default:
                begin
                    mst_exec_state  <= IDLE;
                end
            endcase
        end
    end

    // burst_read_active signal is asserted when a burst read transaction is initiated
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
            burst_read_active <= 1'b0;
        else if (start_single_burst_read)
            burst_read_active <= 1'b1;
        else if (M_AXI_RVALID && axi_rready && M_AXI_RLAST)
            burst_read_active <= 0;
    end

    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
            reads_done <= 1'b0;
        else if (M_AXI_RVALID && axi_rready && (read_index == C_M_AXI_BURST_LEN-1) && (read_burst_counter[C_NO_BURSTS_REQ]))
            reads_done <= 1'b1;
        else
            reads_done <= reads_done;
    end

    // Write received data to memory
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
        begin
            mem_addr <= 0;
        end
        else if (rnext)
        begin
            mem[mem_addr] <= M_AXI_RDATA;
            mem_addr <= mem_addr + 1;
        end
        else
        mem[mem_addr] <= M_AXI_RDATA;
    end

endmodule
