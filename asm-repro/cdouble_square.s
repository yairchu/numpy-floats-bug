// Auto-generated by extract-func-asm.py
// NOTE: This is actually the compiled code from numpy, so it inherits numpy's BSD license.

_cdouble_square:
    ldr x10, [x1]
    ldp x9, x8, [x0]
    ldp x11, x12, [x2]
    mul x13, x11, x10
    mul x14, x12, x10
    add x15, x9, x13
    cmp x13, #0
    csel x13, x15, x9, lt
    csel x15, x9, x15, lt
    add x16, x8, x14
    cmp x14, #0
    csel x14, x16, x8, lt
    csel x16, x8, x16, lt
    cmp x16, x15
    ccmp x13, x14, #0, eq
    ccmp x13, x16, #2, ne
    ccmp x14, x15, #2, ls
    and x13, x12, #0x7
    and x14, x11, #0x7
    ccmp x13, #0, #0, hi
    ccmp x14, #0, #0, eq
    b.eq _cdouble_square_a0
_cdouble_square_58:
    cmp x10, #1
    b.lt _cdouble_square_9c
    add x10, x10, #1
    add x9, x9, #8
    add x8, x8, #8
_cdouble_square_6c:
    ldp d0, d1, [x9, #-8]
    fmul d2, d0, d0
    fmul d3, d1, d1
    fsub d2, d2, d3
    fmul d0, d0, d1
    fadd d0, d0, d0
    stp d2, d0, [x8, #-8]
    sub x10, x10, #1
    add x9, x9, x11
    add x8, x8, x12
    cmp x10, #1
    b.gt _cdouble_square_6c
_cdouble_square_9c:
    ret
_cdouble_square_a0:
    lsr x13, x11, #3
    lsr x14, x12, #3
    cmp x13, #2
    b.ne _cdouble_square_104
    cmp x14, #2
    b.ne _cdouble_square_104
    cmp x10, #1
    b.le _cdouble_square_1c8
    nop
    ldr q0, xor_to_negate_second
_cdouble_square_c8:
    mov x11, x10
    ldp q1, q2, [x9], #32
    ext.16b v3, v1, v1, #8
    fmul.2d v3, v3, v1[1]
    eor.16b v3, v3, v0
    fmla.2d v3, v1, v1[0]
    ext.16b v1, v2, v2, #8
    fmul.2d v1, v1, v2[1]
    eor.16b v1, v1, v0
    fmla.2d v1, v2, v2[0]
    stp q3, q1, [x8], #32
    sub x10, x10, #2
    cmp x11, #3
    b.gt _cdouble_square_c8
    b _cdouble_square_1c8
_cdouble_square_104:
    cmp x13, #2
    b.ne _cdouble_square_168
    cmp x10, #1
    b.le _cdouble_square_1c8
    lsl x11, x14, #3
    lsl x12, x14, #4
    nop
    ldr q0, xor_to_negate_second
_cdouble_square_124:
    mov x13, x10
    ldp q1, q2, [x9], #32
    ext.16b v3, v1, v1, #8
    fmul.2d v3, v3, v1[1]
    eor.16b v3, v3, v0
    fmla.2d v3, v1, v1[0]
    ext.16b v1, v2, v2, #8
    fmul.2d v1, v1, v2[1]
    eor.16b v1, v1, v0
    fmla.2d v1, v2, v2[0]
    str q3, [x8]
    str q1, [x8, x11]
    sub x10, x10, #2
    add x8, x8, x12
    cmp x13, #3
    b.gt _cdouble_square_124
    b _cdouble_square_1c8
_cdouble_square_168:
    cmp x14, #2
    b.ne _cdouble_square_58
    cmp x10, #1
    b.le _cdouble_square_1c8
    lsl x11, x13, #3
    lsl x12, x13, #4
    nop
    ldr q0, xor_to_negate_second
_cdouble_square_188:
    mov x13, x10
    ldr q1, [x9]
    ldr q2, [x9, x11]
    ext.16b v3, v1, v1, #8
    fmul.2d v3, v3, v1[1]
    eor.16b v3, v3, v0
    fmla.2d v3, v1, v1[0]
    ext.16b v1, v2, v2, #8
    fmul.2d v1, v1, v2[1]
    eor.16b v1, v1, v0
    fmla.2d v1, v2, v2[0]
    stp q3, q1, [x8], #32
    sub x10, x10, #2
    add x9, x9, x12
    cmp x13, #3
    b.gt _cdouble_square_188
_cdouble_square_1c8:
    cmp x10, #1
    b.lt _cdouble_square_9c
    ldr q0, [x9]
    ext.16b v1, v0, v0, #8
    fmul.2d v1, v1, v0[1]
    nop
    ldr q2, xor_to_negate_second
    eor.16b v1, v1, v2
    fmla.2d v1, v0, v0[0]
    str q1, [x8]
    ret