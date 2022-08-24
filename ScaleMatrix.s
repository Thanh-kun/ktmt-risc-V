addi x22, x0, 0 #i
addi x25, x0, 0x200 #contain base address of input array
addi x26, x0, 0x400 #contain base address of output array
addi x24, x0, 6 #length of array
addi x2, x0, 2 #row
addi x3, x0, 3 #column
addi x23, x0, 4 #number
addi x1, x0,1
sb x1, 0(x25)
addi x1, x0,3
sb x1, 1(x25)
addi x1, x0,5
sb x1, 2(x25)
addi x1, x0,2
sb x1, 3(x25)
addi x1, x0,4
sb x1, 4(x25)
addi x1, x0,6
sb x1, 5(x25)
loop:
bgt x22, x24 , exit
add x10, x22, x25
add x11, x22, x26
lb x9, 0(x10)
mul x1, x9, x23
sb x1, 0(x11)
addi x22, x22,1
beq x0, x0, loop
exit:
nop