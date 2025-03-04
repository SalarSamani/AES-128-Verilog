`timescale 1ns / 1ps

module sbox (
    input  [7:0] oriByte,   // Original byte
    output [7:0] subByte    // Corresponding sub_byte
);
    // S-Box Lookup Table as parameter
    parameter [2047:0] sboxTable = {
        8'h63, 8'h7c, 8'h77, 8'h7b, 8'hf2, 8'h6b, 8'h6f, 8'hc5, 
        8'h30, 8'h01, 8'h67, 8'h2b, 8'hfe, 8'hd7, 8'hab, 8'h76, 
        8'hca, 8'h82, 8'hc9, 8'h7d, 8'hfa, 8'h59, 8'h47, 8'hf0, 
        8'had, 8'hd4, 8'ha2, 8'haf, 8'h9c, 8'ha4, 8'h72, 8'hc0, 
        8'hb7, 8'hfd, 8'h93, 8'h26, 8'h36, 8'h3f, 8'hf7, 8'hcc, 
        8'h34, 8'ha5, 8'he5, 8'hf1, 8'h71, 8'hd8, 8'h31, 8'h15, 
        8'h04, 8'hc7, 8'h23, 8'hc3, 8'h18, 8'h96, 8'h05, 8'h9a, 
        8'h07, 8'h12, 8'h80, 8'he2, 8'heb, 8'h27, 8'hb2, 8'h75, 
        8'h09, 8'h83, 8'h2c, 8'h1a, 8'h1b, 8'h6e, 8'h5a, 8'ha0, 
        8'h52, 8'h3b, 8'hd6, 8'hb3, 8'h29, 8'he3, 8'h2f, 8'h84, 
        8'h53, 8'hd1, 8'h00, 8'hed, 8'h20, 8'hfc, 8'hb1, 8'h5b, 
        8'h6a, 8'hcb, 8'hbe, 8'h39, 8'h4a, 8'h4c, 8'h58, 8'hcf, 
        8'hd0, 8'hef, 8'haa, 8'hfb, 8'h43, 8'h4d, 8'h33, 8'h85, 
        8'h45, 8'hf9, 8'h02, 8'h7f, 8'h50, 8'h3c, 8'h9f, 8'ha8, 
        8'h51, 8'ha3, 8'h40, 8'h8f, 8'h92, 8'h9d, 8'h38, 8'hf5, 
        8'hbc, 8'hb6, 8'hda, 8'h21, 8'h10, 8'hff, 8'hf3, 8'hd2, 
        8'hcd, 8'h0c, 8'h13, 8'hec, 8'h5f, 8'h97, 8'h44, 8'h17, 
        8'hc4, 8'ha7, 8'h7e, 8'h3d, 8'h64, 8'h5d, 8'h19, 8'h73, 
        8'h60, 8'h81, 8'h4f, 8'hdc, 8'h22, 8'h2a, 8'h90, 8'h88, 
        8'h46, 8'hee, 8'hb8, 8'h14, 8'hde, 8'h5e, 8'h0b, 8'hdb, 
        8'he0, 8'h32, 8'h3a, 8'h0a, 8'h49, 8'h06, 8'h24, 8'h5c, 
        8'hc2, 8'hd3, 8'hac, 8'h62, 8'h91, 8'h95, 8'he4, 8'h79, 
        8'he7, 8'hc8, 8'h37, 8'h6d, 8'h8d, 8'hd5, 8'h4e, 8'ha9, 
        8'h6c, 8'h56, 8'hf4, 8'hea, 8'h65, 8'h7a, 8'hae, 8'h08, 
        8'hba, 8'h78, 8'h25, 8'h2e, 8'h1c, 8'ha6, 8'hb4, 8'hc6, 
        8'he8, 8'hdd, 8'h74, 8'h1f, 8'h4b, 8'hbd, 8'h8b, 8'h8a, 
        8'h70, 8'h3e, 8'hb5, 8'h66, 8'h48, 8'h03, 8'hf6, 8'h0e, 
        8'h61, 8'h35, 8'h57, 8'hb9, 8'h86, 8'hc1, 8'h1d, 8'h9e, 
        8'he1, 8'hf8, 8'h98, 8'h11, 8'h69, 8'hd9, 8'h8e, 8'h94, 
        8'h9b, 8'h1e, 8'h87, 8'he9, 8'hce, 8'h55, 8'h28, 8'hdf, 
        8'h8c, 8'ha1, 8'h89, 8'h0d, 8'hbf, 8'he6, 8'h42, 8'h68, 
        8'h41, 8'h99, 8'h2d, 8'h0f, 8'hb0, 8'h54, 8'hbb, 8'h16
    };

    // Lookup logic
    assign subByte = sboxTable[2047 - oriByte * 8 -: 8];

endmodule

module SubBytes (
    input  [127:0] ori_bytes, // Original input bytes
    output [127:0] sub_bytes  // Corresponding SubBytes output
);

    // Instantiate sbox module for each byte
    sbox sbox0  (.oriByte(ori_bytes[127:120]), .subByte(sub_bytes[127:120]));
    sbox sbox1  (.oriByte(ori_bytes[119:112]), .subByte(sub_bytes[119:112]));
    sbox sbox2  (.oriByte(ori_bytes[111:104]), .subByte(sub_bytes[111:104]));
    sbox sbox3  (.oriByte(ori_bytes[103:96]),  .subByte(sub_bytes[103:96]));
    sbox sbox4  (.oriByte(ori_bytes[95:88]),   .subByte(sub_bytes[95:88]));
    sbox sbox5  (.oriByte(ori_bytes[87:80]),   .subByte(sub_bytes[87:80]));
    sbox sbox6  (.oriByte(ori_bytes[79:72]),   .subByte(sub_bytes[79:72]));
    sbox sbox7  (.oriByte(ori_bytes[71:64]),   .subByte(sub_bytes[71:64]));
    sbox sbox8  (.oriByte(ori_bytes[63:56]),   .subByte(sub_bytes[63:56]));
    sbox sbox9  (.oriByte(ori_bytes[55:48]),   .subByte(sub_bytes[55:48]));
    sbox sbox10 (.oriByte(ori_bytes[47:40]),   .subByte(sub_bytes[47:40]));
    sbox sbox11 (.oriByte(ori_bytes[39:32]),   .subByte(sub_bytes[39:32]));
    sbox sbox12 (.oriByte(ori_bytes[31:24]),   .subByte(sub_bytes[31:24]));
    sbox sbox13 (.oriByte(ori_bytes[23:16]),   .subByte(sub_bytes[23:16]));
    sbox sbox14 (.oriByte(ori_bytes[15:8]),    .subByte(sub_bytes[15:8]));
    sbox sbox15 (.oriByte(ori_bytes[7:0]),     .subByte(sub_bytes[7:0]));

endmodule

module ShiftRows(
    input  [127:0] in,
    output [127:0] out
);
    // Byte positions in the input block
    // Row 0 (no shift)
    assign out[127:120] = in[127:120]; // S(0,0)
    assign out[95:88]   = in[95:88];   // S(0,1)
    assign out[63:56]   = in[63:56];   // S(0,2)
    assign out[31:24]   = in[31:24];   // S(0,3)

    // Row 1 (left shift by 1)
    assign out[119:112] = in[87:80];   // S(1,0) <- S(1,1)
    assign out[87:80]   = in[55:48];   // S(1,1) <- S(1,2)
    assign out[55:48]   = in[23:16];   // S(1,2) <- S(1,3)
    assign out[23:16]   = in[119:112]; // S(1,3) <- S(1,0)

    // Row 2 (left shift by 2)
    assign out[111:104] = in[47:40];   // S(2,0) <- S(2,2)
    assign out[79:72]   = in[15:8];    // S(2,1) <- S(2,3)
    assign out[47:40]   = in[111:104]; // S(2,2) <- S(2,0)
    assign out[15:8]    = in[79:72];   // S(2,3) <- S(2,1)

    // Row 3 (left shift by 3)
    assign out[103:96]  = in[7:0];     // S(3,0) <- S(3,3)
    assign out[71:64]   = in[103:96];  // S(3,1) <- S(3,0)
    assign out[39:32]   = in[71:64];   // S(3,2) <- S(3,1)
    assign out[7:0]     = in[39:32];   // S(3,3) <- S(3,2)

endmodule

module MixColumns(
    input  [127:0] state_in,  // 4x4 AES state matrix (128-bit input)
    output [127:0] state_out  // 4x4 AES state matrix (128-bit output)
);

    // Function: Multiply by 2 in GF(2^8)
    function [7:0] gf_mul2;
        input [7:0] byte_in;
        begin
            gf_mul2 = (byte_in[7] == 1) ? ((byte_in << 1) ^ 8'h1B) : (byte_in << 1);
        end
    endfunction

    // Function: Multiply by 3 in GF(2^8) (3 * x = (2 * x) ⊕ x)
    function [7:0] gf_mul3;
        input [7:0] byte_in;
        begin
            gf_mul3 = gf_mul2(byte_in) ^ byte_in;
        end
    endfunction

    genvar col;
    generate
        for (col = 0; col < 4; col = col + 1) begin : mix_columns
            wire [7:0] s0, s1, s2, s3; // Original column bytes
            wire [7:0] m0, m1, m2, m3; // Transformed column bytes

            // Extract column from state_in
            assign s0 = state_in[32*col+24+:8]; // Row 0, Column col
            assign s1 = state_in[32*col+16+:8]; // Row 1, Column col
            assign s2 = state_in[32*col+8 +:8]; // Row 2, Column col
            assign s3 = state_in[32*col   +:8]; // Row 3, Column col

            // Compute MixColumns transformation for this column
            assign m0 = gf_mul2(s0) ^ gf_mul3(s1) ^ s2 ^ s3;  // 2*s0 + 3*s1 + 1*s2 + 1*s3
            assign m1 = s0 ^ gf_mul2(s1) ^ gf_mul3(s2) ^ s3;  // 1*s0 + 2*s1 + 3*s2 + 1*s3
            assign m2 = s0 ^ s1 ^ gf_mul2(s2) ^ gf_mul3(s3);  // 1*s0 + 1*s1 + 2*s2 + 3*s3
            assign m3 = gf_mul3(s0) ^ s1 ^ s2 ^ gf_mul2(s3);  // 3*s0 + 1*s1 + 1*s2 + 2*s3

            // Store the transformed column back into state_out
            assign state_out[32*col+24+:8] = m0;
            assign state_out[32*col+16+:8] = m1;
            assign state_out[32*col+8 +:8] = m2;
            assign state_out[32*col   +:8] = m3;
        end
    endgenerate

endmodule

module AddRoundKey(
    input  [127:0] state_in,     // AES state matrix (128-bit input)
    input  [127:0] round_key,    // Round key (128-bit)
    output [127:0] state_out     // Output state after XOR with round key
);

    assign state_out = state_in ^ round_key;

endmodule

module KeyExpansionRound (
    input [3:0] roundCount,
    input [127:0] keyIn,
    output [127:0] keyOut
);
    // Split the key into 4 words
    wire [31:0] words[3:0];
    
    assign words[0] = keyIn[127:96];
    assign words[1] = keyIn[95:64];
    assign words[2] = keyIn[63:32];
    assign words[3] = keyIn[31:0];

    // Rotate the last word (rotWord)
    wire [31:0] w3Rot = {words[3][23:0], words[3][31:24]};

    // Perform substitution on rotated word (subWord)
    wire [31:0] w3Sub;
    sbox sbox0 (.oriByte(w3Rot[7:0]),   .subByte(w3Sub[7:0]));
    sbox sbox1 (.oriByte(w3Rot[15:8]),  .subByte(w3Sub[15:8]));
    sbox sbox2 (.oriByte(w3Rot[23:16]), .subByte(w3Sub[23:16]));
    sbox sbox3 (.oriByte(w3Rot[31:24]), .subByte(w3Sub[31:24]));

    // Round constant based on roundCount (for AES-128, up to 10 rounds)
    wire [7:0] roundConstantStart = roundCount == 1 ? 8'h01
                                 : roundCount == 2 ? 8'h02
                                 : roundCount == 3 ? 8'h04
                                 : roundCount == 4 ? 8'h08
                                 : roundCount == 5 ? 8'h10
                                 : roundCount == 6 ? 8'h20
                                 : roundCount == 7 ? 8'h40
                                 : roundCount == 8 ? 8'h80
                                 : roundCount == 9 ? 8'h1b
                                 : roundCount == 10 ? 8'h36
                                 : 8'h00;
    wire [31:0] roundConstant = {roundConstantStart, 24'h00};

    // Key expansion for all 4 words
    assign keyOut[127:96] = words[0] ^ w3Sub ^ roundConstant;
    assign keyOut[95:64]  = words[1] ^ keyOut[127:96];
    assign keyOut[63:32]  = words[2] ^ keyOut[95:64];
    assign keyOut[31:0]   = words[3] ^ keyOut[63:32];
endmodule

module KeyExpansion (
    input  [127:0] initial_key,
    output [127:0] round_keys [0:10]
);
    // Assign the initial key as round key 0
    assign round_keys[0] = initial_key;

    // Generate 10 additional round keys using KeyExpansionRound
    genvar i;
    generate
        for (i = 1; i <= 10; i = i + 1) begin : key_expansion
            KeyExpansionRound keyRound (
                .roundCount(i[3:0]),
                .keyIn(round_keys[i-1]),
                .keyOut(round_keys[i])
            );
        end
    endgenerate
endmodule

module AESRound (
    input  [127:0] state_in,   // 128-bit input state (data to encrypt)
    input  [127:0] key,        // 128-bit input key
    output [127:0] state_out   // 128-bit output state (encrypted result)
);

    // Wires for intermediate states after each transformation
    wire [127:0] subByteOut;    // Output of SubBytes
    wire [127:0] shiftRowsOut;  // Output of ShiftRows
    wire [127:0] mixColumnsOut; // Output of MixColumns

    // Single round of AES:
    // SubBytes -> ShiftRows -> MixColumns -> AddRoundKey
    SubBytes sub (
        .ori_bytes(state_in),
        .sub_bytes(subByteOut)
    );
    
    ShiftRows shft (
        .in(subByteOut),
        .out(shiftRowsOut)
    );
    
    MixColumns mix (
        .state_in(shiftRowsOut),
        .state_out(mixColumnsOut)
    );
    
    AddRoundKey addkey (
        .state_in(mixColumnsOut),
        .round_key(key),        // Using the input key directly
        .state_out(state_out)
    );

endmodule

module AESLastRound (
    input  [127:0] state_in,   // 128-bit input state (data to encrypt)
    input  [127:0] key,        // 128-bit input key for this round
    output [127:0] state_out   // 128-bit output state (encrypted result)
);

    // Wires for intermediate states after each transformation
    wire [127:0] subByteOut;    // Output of SubBytes
    wire [127:0] shiftRowsOut;  // Output of ShiftRows

    // Last round transformations:
    // SubBytes -> ShiftRows -> AddRoundKey
    SubBytes sub (
        .ori_bytes(state_in),
        .sub_bytes(subByteOut)
    );
    
    ShiftRows shft (
        .in(subByteOut),
        .out(shiftRowsOut)
    );
    
    AddRoundKey addkey (
        .state_in(shiftRowsOut),
        .round_key(key),        // Using the provided round key
        .state_out(state_out)
    );

endmodule

module AES128 (
    input  [127:0] plaintext,  // 128-bit input plaintext
    input  [127:0] key,        // 128-bit input key
    output [127:0] ciphertext  // 128-bit output ciphertext
);

    // Wires for round keys and intermediate states
    wire [127:0] round_keys [0:10];          // 11 round keys
    wire [127:0] state_after_initial_key;    // After initial AddRoundKey
    wire [127:0] state_after_round [1:9];    // After each of 9 regular rounds
    wire [127:0] state_after_last_round;     // After final round

    // Key expansion to generate all round keys
    KeyExpansion key_exp (
        .initial_key(key),
        .round_keys(round_keys)
    );

    // Initial round: AddRoundKey only
    AddRoundKey initial_round (
        .state_in(plaintext),
        .round_key(round_keys[0]),
        .state_out(state_after_initial_key)
    );

    // Rounds 1-9: Full AES rounds (SubBytes -> ShiftRows -> MixColumns -> AddRoundKey)
    AESRound round1 (
        .state_in(state_after_initial_key),
        .key(round_keys[1]),
        .state_out(state_after_round[1])
    );

    AESRound round2 (
        .state_in(state_after_round[1]),
        .key(round_keys[2]),
        .state_out(state_after_round[2])
    );

    AESRound round3 (
        .state_in(state_after_round[2]),
        .key(round_keys[3]),
        .state_out(state_after_round[3])
    );

    AESRound round4 (
        .state_in(state_after_round[3]),
        .key(round_keys[4]),
        .state_out(state_after_round[4])
    );

    AESRound round5 (
        .state_in(state_after_round[4]),
        .key(round_keys[5]),
        .state_out(state_after_round[5])
    );

    AESRound round6 (
        .state_in(state_after_round[5]),
        .key(round_keys[6]),
        .state_out(state_after_round[6])
    );

    AESRound round7 (
        .state_in(state_after_round[6]),
        .key(round_keys[7]),
        .state_out(state_after_round[7])
    );

    AESRound round8 (
        .state_in(state_after_round[7]),
        .key(round_keys[8]),
        .state_out(state_after_round[8])
    );

    AESRound round9 (
        .state_in(state_after_round[8]),
        .key(round_keys[9]),
        .state_out(state_after_round[9])
    );

    // Final round (10): SubBytes -> ShiftRows -> AddRoundKey (no MixColumns)
    AESLastRound last_round (
        .state_in(state_after_round[9]),
        .key(round_keys[10]),
        .state_out(state_after_last_round)
    );

    // Output assignment
    assign ciphertext = state_after_last_round;

endmodule