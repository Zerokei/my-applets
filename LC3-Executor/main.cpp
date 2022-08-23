#include<cstdio>
#include<iostream>
#include<string>
#include<cassert>
using namespace std;

const int MAX_C = 655360; // The size of memory, and the code start at 65536
const int MAX_R = 8; // The number of registers
const int XLEN  = 16;

// #define DEBUG

typedef unsigned short uint16_t;
uint16_t Reg[MAX_R], pc;
uint16_t Mem[MAX_C];

uint16_t Get_inst(const string inst_str) {
    uint16_t inst_int = 0x0000;
    for(int i = 0; i < XLEN; i++) {
        inst_int |= (inst_str[i] == '1') << (XLEN - i - 1);
    }
    return inst_int;
}

bool Is_ImmExt(const uint16_t inst) {
    return (inst >> 5) & 1;
}

bool Is_JSRExt(const uint16_t inst) {
    return ((inst >> 11) & 1) == 0;
}

bool Is_halt(const uint16_t inst) {
    return inst == 0b1111000000100101;
}

bool Is_BRneg(const uint16_t inst) {
    return (inst >> 11) & 1;
}

bool Is_BRzero(const uint16_t inst) {
    return (inst >> 10) & 1;
}

bool Is_BRpos(const uint16_t inst) {
    return (inst >> 9) & 1;
}


uint16_t Get_imm5(const uint16_t inst) {
    return inst & 0b10000 ? (inst & 0b11111) | 0xFFE0 : inst & 0b11111;
}

uint16_t Get_offset6(const uint16_t inst) {
    return inst & 0b100000 ? (inst & 0b111111) | 0xFFC0 : inst & 0b111111;
}

uint16_t Get_offset9(const uint16_t inst) {
    return inst & 0b100000000 ? (inst & 0b111111111) | 0xFE00 : inst & 0b111111111;
}

uint16_t Get_offset11(const uint16_t inst) {
    return inst & 0b10000000000 ? (inst & 0b11111111111) | 0xF800 : inst & 0b11111111111;
}

uint16_t Get_SR2(const uint16_t inst) {
    return inst & 0b111;
}

uint16_t Get_SR1(const uint16_t inst) {
    return (inst >> 6) & 0b111;
}

uint16_t Get_DR(const uint16_t inst) {
    return (inst >> 9) & 0b111;
}

uint16_t Get_BaseR(const uint16_t inst) {
    return Get_SR1(inst);
}

struct StateM{
    bool isNeg, isPos, isZero;
    StateM(){
        isNeg = false;
        isPos = false;
        isZero = false;
    }
    void Update(const uint16_t last_reg) {
        isNeg  = (last_reg >> 15) & 1;
        isZero = last_reg == 0;
        isPos  = !isZero && !isNeg;
#ifdef DEBUG
        printf("lastreg = %04hX, %d %d %d\n", last_reg, isNeg, isZero, isPos);
#endif
    }
} State;

int main() {
#ifdef DEBUG
    freopen("case2.in", "r", stdin);
#endif

    // Init
    for (int i = 0; i < MAX_C; i++) Mem[i] = 0x7777;
    for (int i = 0; i < MAX_R; i++) Reg[i] = 0x7777;

    // Input
    string str;
    getline(cin,str);
    uint16_t position = Get_inst(str);
    pc = position;
    while(getline(cin,str)) {
        if(str.empty()) break;
        Mem[position++] = Get_inst(str);
    }
    // Process

    while (!Is_halt(Mem[pc])) {
        assert(pc < MAX_C);
        uint16_t inst = Mem[pc];
        // assert(inst != 0x7777);
        uint16_t DR = Get_DR(inst), SR = DR;
        uint16_t SR1 = Get_SR1(inst);
        uint16_t SR2 = Get_SR2(inst);
        uint16_t IMM = Get_imm5(inst);
        uint16_t BaseR = Get_BaseR(inst);
        uint16_t OFFSET6 = Get_offset6(inst);
        uint16_t OFFSET9 = Get_offset9(inst);
        uint16_t OFFSET11 = Get_offset11(inst);

#ifdef DEBUG
        printf("pc = %04hX, inst = %04hX\n", pc, inst);
#endif

        // if (inst == 0x7777) {
        //     printf("ERROR!\n");
        //     break;
        // }

        bool br = false;
        pc = pc + 1;
        uint16_t ra = pc, addr;
        switch (inst >> 12) {
        case 0b0001: // ADD
            if (Is_ImmExt(inst)) Reg[DR] = Reg[SR1] + IMM; // ADDI
            else Reg[DR] = Reg[SR1] + Reg[SR2];            // ADD
            State.Update(Reg[DR]);
            break;
        case 0b0101: // AND
            if (Is_ImmExt(inst)) Reg[DR] = Reg[SR1] & IMM; // ANDI
            else Reg[DR] = Reg[SR1] & Reg[SR2];            // AND
            State.Update(Reg[DR]);
            break;
        case 0b0000: // BR
            if (Is_BRneg(inst)  && State.isNeg ) br = true;
            if (Is_BRzero(inst) && State.isZero) br = true;
            if (Is_BRpos(inst)  && State.isPos ) br = true;
            pc = br ? pc + OFFSET9 : pc;
            break;
        case 0b1100: // JMP
            pc = Reg[BaseR];
            break;
        case 0b0100: // JSR
            if (Is_JSRExt(inst)) pc = Reg[BaseR];          // JSRR
            else pc = pc + OFFSET11;                       // JSR
            Reg[7] = ra;
            break;
        case 0b0010: // LD
            addr = pc+OFFSET9;
            Reg[DR] = Mem[addr];
            State.Update(Reg[DR]);
            break;
        case 0b1010: // LDI
            addr = pc+OFFSET9;
            Reg[DR] = Mem[Mem[addr]];
            State.Update(Reg[DR]);
            break;
        case 0b0110: // LDR
            addr = Reg[BaseR]+OFFSET6;
            Reg[DR] = Mem[addr];
            State.Update(Reg[DR]);
            break;
        case 0b1110: // LEA
            Reg[DR] = pc + OFFSET9;
            break;
        case 0b1001: // NOT
            Reg[DR] = ~Reg[SR1];
            State.Update(Reg[DR]);
            break;
        case 0b0011: // ST
            Mem[pc + OFFSET9] = Reg[SR];
            break;
        case 0b1011: // STI
            Mem[Mem[pc + OFFSET9]] = Reg[SR];    
            break;
        case 0b0111: // STR
            Mem[Reg[BaseR] + OFFSET6] = Reg[SR];
            break;
        default:
            break;
        }

#ifdef DEBUG
        for (int i = 0; i < 4; i++) printf("R%d = x%04hX ", i, Reg[i]);
        puts("");
        for (int i = 4; i < 8; i++) printf("R%d = x%04hX ", i, Reg[i]);
        puts("");
#endif

#ifdef DEBUG
        puts("******************");
#endif
    }

    // Output
    for (int i = 0; i < MAX_R; i++) printf("R%d = x%04hX\n", i, Reg[i]);

}