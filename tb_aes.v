`timescale 1ns / 1ps

module AES128_tb;

    // Test bench signals
    reg  [127:0] plaintext;    // 128-bit input plaintext
    reg  [127:0] key;          // 128-bit input key
    wire [127:0] ciphertext;   // 128-bit output ciphertext

    // Instantiate the AES128 module
    AES128 dut (
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext)
    );

    // VCD generation for GTKWave
    initial begin
        $dumpfile("simulation.vcd");  // Generate VCD file
        $dumpvars(0, AES128_tb);  // Record all variables
    end

    // Test procedure
    initial begin
        // Test case: All zeros
        plaintext = 128'h000102030405060708090A0B0C0D0E0F;
        key       = 128'h000102030405060708090A0B0C0D0E0F;
        #100;
        // End simulation
        $finish;
    end

endmodule