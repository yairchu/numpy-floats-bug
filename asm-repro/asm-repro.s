// Note: am a noob in assembly. Feedback welcome!

.macro LOAD_DATA_ADDRESS reg, label
    adrp \reg, \label @PAGE
    add \reg, \reg, \label @PAGEOFF
.endm

.macro START_STACK_FRAME
    stp x29, x30, [sp, #-16]!   // Save frame pointer and return address
    mov x29, sp                 // Set frame pointer to current stack pointer
.endm

.macro RET_STACK_FRAME
    ldp x29, x30, [sp], #16 // Restore frame pointer and return address
    ret
.endm

.section __DATA, __data
fmt:    .asciz "Res0=%.16e!\nRes1=%.16e!\nDiff=%e!\n"

.align 4
input_vec:
        .double -5.171866611150749e-07
        .double 2.5618634555957426e-07
        .fill 4, 8, 0.0

.align 4
output_vec0:
        .fill 6, 8, 0.0

.align 4
output_vec1:
        .fill 6, 8, 0.0

.align 4
size:
        .quad 3

.align 4
steps:
        .fill 2, 8, 16

.align 4
args:
        .fill 2, 8, 0

.section __TEXT, __text
.globl _main
.extern _printf

_main:
    START_STACK_FRAME

    LOAD_DATA_ADDRESS x0, output_vec0
    bl compute

    LOAD_DATA_ADDRESS x0, output_vec1
    bl compute

    LOAD_DATA_ADDRESS x0, output_vec0
    ldr q0, [x0]
    LOAD_DATA_ADDRESS x0, output_vec1
    ldr q1, [x0]
    fsub v2.2d, v1.2d, v0.2d

    sub sp, sp, #32
    str q0, [sp]
    str q1, [sp, #8]
    str q2, [sp, #16]
    LOAD_DATA_ADDRESS x0, fmt
    bl _printf
    add sp, sp, #32

    mov x0, #0 // Set exit status to 0
    RET_STACK_FRAME

// x0: pointer to output vector in
compute:
    // Noob question: I don't use the stack, and neither does _cdouble_square
    // But if I don't do the stack frame ceremonies it doesn't work. Unsure why.
    START_STACK_FRAME

    mov x2, x0
    LOAD_DATA_ADDRESS x0, args
    LOAD_DATA_ADDRESS x1, input_vec
    str x1, [x0]
    str x2, [x0, #8]

    LOAD_DATA_ADDRESS x1, size
    LOAD_DATA_ADDRESS x2, steps

    bl _cdouble_square

    RET_STACK_FRAME

xor_to_negate_second:
        .quad 0x8000000000000000

// _cdouble_square
//   (defined in numpy/core/src/umath/loops.c.src as @TYPE@_square for CDOUBLE ??)
// Inputs:
//   x0: char **args (char *in_pointer = args[0], *out_pointer = args[1])
//   x1: npy_intp const *dimensions
//   x2: npy_intp const *steps (npy_intp in_steps = steps[0], out_steps = steps[1])
.include "cdouble_square.s"
