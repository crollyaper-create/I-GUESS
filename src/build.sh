#!/usr/bin/env bash
set -e

echo "=== Building HoneOptimizer.exe (Windows x86_64) ==="
gcc -O2 -c -fno-builtin -fno-ident -fno-stack-protector -m64 src/main.c -o src/main.o
objcopy -R .comment -R .note.gnu.property src/main.o
ld -m i386pep --oformat pei-x86-64 --image-base 0x140000000 -e mainCRTStartup src/main.o -o HoneOptimizer.exe
cp HoneOptimizer.exe Hone.exe
echo "=== HoneOptimizer.exe build completed successfully! ==="
