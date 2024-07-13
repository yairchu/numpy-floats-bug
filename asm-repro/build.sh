#!/bin/bash
set -e

cd "$(dirname $0)"
python extract-func-asm.py
as -arch arm64 -o asm-repro.o asm-repro.s
ld -L$(xcrun --sdk macosx --show-sdk-path)/usr/lib -lSystem -o asm-repro asm-repro.o
echo Success building asm-repro
