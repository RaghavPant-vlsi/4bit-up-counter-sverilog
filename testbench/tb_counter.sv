// Testbench - Auto-generates waveforms
module tb_counter;
    logic clk, rst_n, en;
    logic [3:0] q;
    
    // Instantiate Design Under Test
    counter_4bit dut (
        .clk(clk), .rst_n(rst_n), .en(en), .q(q)
    );
    
    // Clock generator (10ns period = 100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        $dumpfile("counter.vcd"); $dumpvars;
        
        // Test reset
        rst_n = 0; en = 0; #30;
        rst_n = 1; #10;
        
        // Test counting
        en = 1; #200;  // Count 0-15-overflow
        
        $finish;
    end
endmodule
