ram[0] <=8'b00_001_101;  // mov R1,R5
ram[1] <=8'b01_010_001;  // mvi R0,1110




ram[2] <=8'b01_110_010;  // lrotate R2

ram[3] <=8'b01_110_110;  // mvi R0,1110
ram[4] <=8'b01_010_101;  // and R0,R1

ram[5] <=8'b01_110_101;  // add R0,R2
ram[6] <=8'b00_110_000;  // mov R6,R0
ram[7] <=8'b1001_0000;   // jmp 0
