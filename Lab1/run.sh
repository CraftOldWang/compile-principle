#!/bin/bash
# 编译 RISC-V 汇编并链接 SysY 运行时库，然后运行

SRC="$1"                 # 第一个参数是汇编文件名，比如 main.s
OUT="${2:-main}"        # 第二个参数是输出文件名，默认 a.out
LIB_DIR="./lib"          # 运行时库所在目录
LIB_NAME="sysy_riscv"    # 库名

# 1. 编译汇编文件为目标文件
riscv64-unknown-elf-gcc "$SRC" -c -o "${OUT}.o" -w

# 2. 链接目标文件和运行时库
riscv64-unknown-elf-gcc "${OUT}.o" -o "$OUT" -L"$LIB_DIR" -l"$LIB_NAME" -static -mcmodel=medany -Wl,--no-relax,-Ttext=0x90000000

# 3. 使用 QEMU 运行
qemu-riscv64 "$OUT"

