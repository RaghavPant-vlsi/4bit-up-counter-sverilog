// 4-Bit Synchronous Counter
module counter_4bit (
    input  logic clk,      // Clock (100MHz)
    input  logic rst_n,    // Active-low reset
    input  logic en,       // Enable
    output logic [3:0] q   // Counter output
);
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            q <= 4'b0000;  // Reset to zero
        end else if (en) begin
            q <= q + 1'b1; // Increment
        end
        // Hold value when en=0
    end
endmodule
