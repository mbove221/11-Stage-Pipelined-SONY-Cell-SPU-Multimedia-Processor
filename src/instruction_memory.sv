module instruction_memory #(
    // Default is relative to the repository root (the expected simulation working
    // directory). Override with the +INSTR_FILE=<path> plusarg when running the
    // simulator from somewhere else.
    parameter string INSTR_FILE = "tb/assembler/instructions.txt"
)(
    input [0:31] address, //word
    output logic [0:31] instr1,
    output logic [0:31] instr2
);

    logic [0:31] ram[0:511]; //2 kB instruction memory

    string instr_file;

    initial begin
        if (!$value$plusargs("INSTR_FILE=%s", instr_file)) instr_file = INSTR_FILE;
        $readmemh(instr_file, ram);
    end

    assign instr1 = ram[address[0:29]];
    assign instr2 = ram[address[0:29] + 1];

endmodule
