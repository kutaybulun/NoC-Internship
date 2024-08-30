`timescale 1 ns / 1 ps
module vivado_axi_master_write_only_with_full_ports
#(
    // Base address of targeted slave
    parameter  C_M_TARGET_SLAVE_BASE_ADDR  = 32'h40000000,
    // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    parameter integer C_M_AXI_BURST_LEN    = 16,
    // Thread ID Width
    parameter integer C_M_AXI_ID_WIDTH     = 1,
    // Width of Address Bus
    parameter integer C_M_AXI_ADDR_WIDTH   = 32,
    // Width of Data Bus
    parameter integer C_M_AXI_DATA_WIDTH   = 32,
    // Width of User Write Address Bus
    parameter integer C_M_AXI_AWUSER_WIDTH = 0,
    // Width of User Read Address Bus
    parameter integer C_M_AXI_ARUSER_WIDTH = 0,
    // Width of User Write Data Bus
    parameter integer C_M_AXI_WUSER_WIDTH  = 0,
    // Width of User Read Data Bus
    parameter integer C_M_AXI_RUSER_WIDTH  = 0,
    // Width of User Response Bus
    parameter integer C_M_AXI_BUSER_WIDTH  = 0
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
    // number of write transactions.
    localparam integer C_TRANSACTIONS_NUM = clogb2(C_M_AXI_BURST_LEN-1);

    // Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
    // Non-2^n lengths will eventually cause bursts across 4K address boundaries.
    localparam integer C_MASTER_LENGTH  = 12;
    // total number of burst transfers is master length divided by burst length and burst size
    localparam integer C_NO_BURSTS_REQ = C_MASTER_LENGTH-clogb2((C_M_AXI_BURST_LEN*C_M_AXI_DATA_WIDTH/8)-1);

    // Example State machine to initialize counter, initialize write transactions, 
    // and comparison of written data with the expected data.
    parameter [1:0] IDLE = 2'b00, // This state initiates AXI4 transaction 
        // after the state machine changes state to INIT_WRITE 
        // when there is 0 to 1 transition on INIT_AXI_TXN
    INIT_WRITE   = 2'b01, // This state initializes write transaction
    INIT_COMPARE = 2'b11; // This state issues the status of comparison 

    reg [1:0] mst_exec_state;

    // AXI4LITE signals
    //AXI4 internal temp signals
    reg [C_M_AXI_ADDR_WIDTH-1 : 0]  axi_awaddr;
    reg   axi_awvalid;
    reg [C_M_AXI_DATA_WIDTH-1 : 0]  axi_wdata;
    reg   axi_wlast;
    reg   axi_wvalid;
    reg   axi_bready;
    //write beat count in a burst
    reg [C_TRANSACTIONS_NUM : 0]  write_index;
    //size of C_M_AXI_BURST_LEN length burst in bytes
    wire [C_TRANSACTIONS_NUM+2 : 0]  burst_size_bytes;
    //The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
    reg [C_NO_BURSTS_REQ : 0]  write_burst_counter;
    reg   start_single_burst_write;
    reg   writes_done;
    reg   error_reg;
    reg   compare_done;
    reg   burst_write_active;
    reg [C_M_AXI_DATA_WIDTH-1 : 0]  expected_wdata;
    //Interface response error flags
    wire   write_resp_error;
    wire   wnext;
    reg   init_txn_ff;
    reg   init_txn_ff2;
    reg   init_txn_edge;
    wire   init_txn_pulse;

    // I/O Connections assignments

    //I/O Connections. Write Address (AW)
    assign M_AXI_AWID = 'b0;
    //The AXI address is a concatenation of the target base address + active offset range
    assign M_AXI_AWADDR = C_M_TARGET_SLAVE_BASE_ADDR + axi_awaddr;
    //Burst LENgth is number of transaction beats, minus 1
    assign M_AXI_AWLEN = C_M_AXI_BURST_LEN - 1;
    //Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
    assign M_AXI_AWSIZE = clogb2((C_M_AXI_DATA_WIDTH/8)-1);
    //INCR burst type is usually used, except for keyhole bursts
    assign M_AXI_AWBURST = 2'b01;
    assign M_AXI_AWLOCK = 1'b0;
    assign M_AXI_AWCACHE = 4'b0010;
    assign M_AXI_AWPROT = 3'h0;
    assign M_AXI_AWQOS = 4'h0;
    assign M_AXI_AWUSER = 'b1;
    assign M_AXI_AWVALID = axi_awvalid;
    //Write Data(W)
    assign M_AXI_WDATA = axi_wdata;
    //All bursts are complete and aligned in this example
    assign M_AXI_WSTRB = {(C_M_AXI_DATA_WIDTH/8){1'b1}};
    assign M_AXI_WLAST = axi_wlast;
    assign M_AXI_WUSER = 'b0;
    assign M_AXI_WVALID = axi_wvalid;
    //Write Response (B)
    assign M_AXI_BREADY = axi_bready;
    
    // Default assignments for read-related signals (not used)
    assign M_AXI_ARID = 'b0;
    assign M_AXI_ARADDR = 'b0;
    assign M_AXI_ARLEN = 'b0;
    assign M_AXI_ARSIZE = 'b0;
    assign M_AXI_ARBURST = 2'b01;
    assign M_AXI_ARLOCK = 1'b0;
    assign M_AXI_ARCACHE = 4'b0010;
    assign M_AXI_ARPROT = 3'h0;
    assign M_AXI_ARQOS = 4'h0;
    assign M_AXI_ARUSER = 'b0;
    assign M_AXI_ARVALID = 1'b0;
    assign M_AXI_RREADY = 1'b0;

    //Example design I/O
    assign TXN_DONE = compare_done;
    //Burst size in bytes
    assign burst_size_bytes = C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
    assign init_txn_pulse = (!init_txn_ff2) && init_txn_ff;

    //Generate a pulse to initiate AXI transaction.
    always @(posedge M_AXI_ACLK)                                            
    begin                                                                        
        // Initiates AXI transaction delay    
        if (M_AXI_ARESETN == 0 )                                                   
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
    //Write Address Channel
    //--------------------

    always @(posedge M_AXI_ACLK)                                   
    begin                                                                
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                           
        begin                                                            
            axi_awvalid <= 1'b0;                                           
        end                                                              
        else if (~axi_awvalid && start_single_burst_write)                 
        begin                                                            
            axi_awvalid <= 1'b1;                                           
        end                                                              
        else if (M_AXI_AWREADY && axi_awvalid)                             
        begin                                                            
            axi_awvalid <= 1'b0;                                           
        end                                                              
        else                                                               
            axi_awvalid <= axi_awvalid;                                      
    end

    // Next address after AWREADY indicates previous address acceptance    
    always @(posedge M_AXI_ACLK)                                         
    begin                                                                
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                            
        begin                                                            
            axi_awaddr <= 'b0;                                             
        end                                                              
        else if (M_AXI_AWREADY && axi_awvalid)                             
        begin                                                            
            axi_awaddr <= axi_awaddr; //+ burst_size_bytes;               
        end                                                              
        else                                                               
            axi_awaddr <= axi_awaddr;                                        
    end                                                                

    //--------------------
    //Write Data Channel
    //--------------------

    assign wnext = M_AXI_WREADY & axi_wvalid;                                   

    always @(posedge M_AXI_ACLK)                                                      
    begin                                                                             
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                        
        begin                                                                         
            axi_wvalid <= 1'b0;                                                         
        end                                                                           
        else if (~axi_wvalid && start_single_burst_write)                               
        begin                                                                         
            axi_wvalid <= 1'b1;                                                         
        end                                                                           
        else if (wnext && axi_wlast)                                                    
            axi_wvalid <= 1'b0;                                                           
        else                                                                            
            axi_wvalid <= axi_wvalid;                                                     
    end

    always @(posedge M_AXI_ACLK)                                                      
    begin                                                                             
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                        
        begin                                                                         
            axi_wlast <= 1'b0;                                                          
        end                                                                           
        else if (((write_index == C_M_AXI_BURST_LEN-2 && C_M_AXI_BURST_LEN >= 2) && wnext) || (C_M_AXI_BURST_LEN == 1 ))
        begin                                                                         
            axi_wlast <= 1'b1;                                                          
        end                                                                           
        else if (wnext)                                                                 
            axi_wlast <= 1'b0;                                                            
        else if (axi_wlast && C_M_AXI_BURST_LEN == 1)                                   
            axi_wlast <= 1'b0;                                                            
        else                                                                            
            axi_wlast <= axi_wlast;                                                       
    end

    always @(posedge M_AXI_ACLK)                                                      
    begin                                                                             
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || start_single_burst_write == 1'b1)    
        begin                                                                         
            write_index <= 0;                                                           
        end                                                                           
        else if (wnext && (write_index != C_M_AXI_BURST_LEN-1))                         
        begin                                                                         
            write_index <= write_index + 1;                                             
        end                                                                           
        else                                                                            
            write_index <= write_index;                                                   
    end

    always @(posedge M_AXI_ACLK)                                                      
    begin                                                                             
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                         
            axi_wdata <= {1'b1, 1'b1, 8'h11, 22'b0};                                                             
        else if (wnext)                                                                 
            axi_wdata <= axi_wdata + 1;                                                   
        else                                                                            
            axi_wdata <= axi_wdata;                                                       
    end                                                                             

    //----------------------------
    //Write Response (B) Channel
    //----------------------------

    always @(posedge M_AXI_ACLK)                                     
    begin                                                                 
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                            
        begin                                                             
            axi_bready <= 1'b0;                                             
        end                                                               
        else if (M_AXI_BVALID && ~axi_bready)                               
        begin                                                             
            axi_bready <= 1'b1;                                             
        end                                                               
        else if (axi_bready)                                                
        begin                                                             
            axi_bready <= 1'b0;                                             
        end                                                               
        else                                                                
            axi_bready <= axi_bready;                                         
    end

    assign write_resp_error = axi_bready & M_AXI_BVALID & M_AXI_BRESP[1]; 

    //----------------------------------
    //Example design error register
    //----------------------------------

    always @(posedge M_AXI_ACLK)                                 
    begin                                                              
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                          
        begin                                                          
            error_reg <= 1'b0;                                           
        end                                                            
        else if (write_resp_error)   
        begin                                                          
            error_reg <= 1'b1;                                           
        end                                                            
        else                                                             
            error_reg <= error_reg;                                        
    end

    //----------------------------------------
    //Example design throttling
    //----------------------------------------

    always @(posedge M_AXI_ACLK)                                                                              
    begin                                                                                                     
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                                                 
        begin                                                                                                 
            write_burst_counter <= 'b0;                                                                         
        end                                                                                                   
        else if (M_AXI_AWREADY && axi_awvalid)                                                                  
        begin                                                                                                 
            if (write_burst_counter[C_NO_BURSTS_REQ] == 1'b0)                                                   
            begin                                                                                             
                write_burst_counter <= write_burst_counter + 1'b1;                                              
            end                                                                                               
        end                                                                                                   
        else                                                                                                    
            write_burst_counter <= write_burst_counter;                                                           
    end

    always @ ( posedge M_AXI_ACLK)                                                                            
    begin                                                                                                     
        if (M_AXI_ARESETN == 1'b0 )                                                                             
        begin                                                                                                 
            mst_exec_state      <= IDLE;                                                                
            start_single_burst_write <= 1'b0;                                                                   
            compare_done      <= 1'b0;                                                                          
            ERROR <= 1'b0;   
        end                                                                                                   
        else                                                                                                    
        begin                                                                                                 
            case (mst_exec_state)                                                                               
                IDLE:                                                                                     
                if ( init_txn_pulse == 1'b1)                                                      
                begin                                                                                         
                    mst_exec_state  <= INIT_WRITE;                                                              
                    ERROR <= 1'b0;
                    compare_done <= 1'b0;
                end                                                                                           
                else                                                                                            
                begin                                                                                         
                    mst_exec_state  <= IDLE;                                                            
                end                                                                                           
                INIT_WRITE:                                                                                       
                if (writes_done)                                                                                
                begin                                                                                         
                    mst_exec_state <= INIT_COMPARE;                                                              
                end                                                                                           
                else                                                                                            
                begin                                                                                         
                    mst_exec_state  <= INIT_WRITE;                                                              
                    if (~axi_awvalid && ~start_single_burst_write && ~burst_write_active)                       
                    begin                                                                                     
                        start_single_burst_write <= 1'b1;                                                       
                    end                                                                                       
                    else                                                                                        
                    begin                                                                                     
                        start_single_burst_write <= 1'b0;                                                       
                    end                                                                                       
                end                                                                                           
                INIT_COMPARE:                                                                                     
                begin                                                                                           
                    ERROR <= error_reg;
                    mst_exec_state <= IDLE;                                                               
                    compare_done <= 1'b1;                                                                         
                end                                                                                             
                default :                                                                                         
                begin                                                                                           
                    mst_exec_state  <= IDLE;                                                              
                end                                                                                             
            endcase                                                                                             
        end                                                                                                   
    end

    always @(posedge M_AXI_ACLK)                                                                              
    begin                                                                                                     
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
            burst_write_active <= 1'b0;                                                                           
        else if (start_single_burst_write)                                                                      
            burst_write_active <= 1'b1;                                                                           
        else if (M_AXI_BVALID && axi_bready)                                                                    
            burst_write_active <= 0;                                                                              
    end

    always @(posedge M_AXI_ACLK)                                                                              
    begin                                                                                                     
        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
            writes_done <= 1'b0;                                                                                  
        else if (M_AXI_BVALID && (write_burst_counter[C_NO_BURSTS_REQ]) && axi_bready)                          
            writes_done <= 1'b1;                                                                                  
        else                                                                                                    
            writes_done <= writes_done;                                                                           
    end

endmodule
