`timescale 1ns / 1ps

module instruction_mem (
    input  logic [31:0] instr_addr,
    output logic [31:0] instr_code
);

    logic [31:0] instr_rom[0:127];
`ifdef TEST_SIMULATION
    initial begin
        // Project example

        // R_TYPE
        //instr_rom[0] = 32'h00418333;  // ADD  x6, x3, x4  
        //instr_rom[1] = 32'h40418333;  // SUB  x6, x3, x4  
        //instr_rom[2] = 32'h00419333;  // SLL  x6, x3, x4 
        //instr_rom[3] = 32'h00412333;  // SLT  x6, x2, x4  
        //instr_rom[4] = 32'h00413333;  // SLTU x6, x2, x4  
        //instr_rom[5] = 32'h0030c333;  // XOR  x6, x1, x3  
        //instr_rom[6] = 32'h0040d333;  // SRL  x6, x1, x4  
        //instr_rom[7] = 32'h4040d333;  // SRA  x6, x1, x4  
        //instr_rom[8] = 32'h00526333;  // OR   x6, x4, x5  
        //instr_rom[9] = 32'h00527333;  // AND  x6, x4, x5  

        // I_TYPE
        //instr_rom[0] = 32'h00518293;  // ADDI  x5, x3, 5
        //instr_rom[1] = 32'hffb18293;  // ADDI  x5, x3, -5
        //instr_rom[2] = 32'h00319293;  // SLLI  x5, x3, 3
        //instr_rom[3] = 32'h00312293;  // SLTI  x5, x2, 3
        //instr_rom[4] = 32'h00313293;  // SLTIU x5, x2, 3
        //instr_rom[5] = 32'h0060c293;  // XORI  x5, x1, 6
        //instr_rom[6] = 32'h0030d293;  // SRLI  x5, x1, 3
        //instr_rom[7] = 32'h4030d293;  // SRAI  x5, x1, 3
        //instr_rom[8] = 32'h00926293;  // ORI   x5, x4, 9
        //instr_rom[9] = 32'h00927293;  // ANDI  x5, x4, 9

        // IL_TYPE
        //instr_rom[0] = 32'h00c00193;    // ADDI x3, x0, 12 
        //instr_rom[1] = 32'h0041a383;    // LW   x7, 4(x3) 
        //instr_rom[2] = 32'h00419383;    // LH   x7, 4(x3) 
        //instr_rom[3] = 32'h0041d383;    // LHU  x7, 4(x3)
        //instr_rom[4] = 32'h00418383;    // LB   x7, 4(x3) 
        //instr_rom[5] = 32'h0041c383;    // LBU  x7, 4(x3) 

        // S_TYPE   
        //instr_rom[0] = 32'h00c00193;    // ADDI x3, x0, 12
        //instr_rom[1] = 32'h0071a223;    // SW   x7, 4(x3)  
        //instr_rom[2] = 32'h00719423;    // SH   x7, 8(x3)   
        //instr_rom[3] = 32'h00718623;    // SB   x7, 12(x3)  

        // B_TYPE
        //instr_rom[0] = 32'h00208463;  // BEQ x1, x2, 8
        //instr_rom[1] = 32'h00209463;  // BNE x1, x2, 4
        //instr_rom[2] = 32'h00000013;  // nop
        //instr_rom[3] = 32'h0020C463;  // BLT x1, x2, 8

        // U_TYPE
        //instr_rom[0] = 32'h123450B7;  // LUI x1, 0x12345
        //instr_rom[1] = 32'h12345117;  // AUIPC x2, 0x12345

        // J_TYPE
        //instr_rom[0] = 32'h008000ef;  // JAL x1, 8
        //instr_rom[1] = 32'h00000013;  // nop
        //instr_rom[2] = 32'hff9ff16f;  // JAL x2, -8

        // JL_TYPE
        //instr_rom[0] = 32'h00408167;  // JALR x2, x1, 4


    end
`endif

    initial begin
        $readmemh("instruction_code.mem", instr_rom);
        //$readmemh("instruction_mem_sort.mem", instr_rom);
    end

    assign instr_code = instr_rom[instr_addr[31:2]];


endmodule
