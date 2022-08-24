addi x24, x0, 0x200 #contain base address of input array1
addi x25, x0, 0x400 #contain base address of input array2
addi x26, x0, 0x600 #contain base address of output array
addi x2, x0, 2 #row1 = rowAnswer
addi x3, x0, 3 # (col1 = row2)
addi x4, x0, 2 #col2 = colAnswer
addi x8, x0, 0 #i = 0
addi x9, x0, 0 #j = 0
addi x10, x0, 0 #k = 0
addi x12 , x0, 0 #sum
addi x1, x0,1
sb x1, 0(x24)
addi x1, x0,2
sb x1, 1(x24)
addi x1, x0,3
sb x1, 2(x24)
addi x1, x0,4
sb x1, 3(x24)
addi x1, x0,5
sb x1, 4(x24)
addi x1, x0,6
sb x1, 5(x24)
addi x1, x0,1
sb x1, 0(x25)
addi x1, x0,2
sb x1, 1(x25)
addi x1, x0,3
sb x1, 2(x25)
addi x1, x0,4
sb x1, 3(x25)
addi x1, x0,5
sb x1, 4(x25)
addi x1, x0,6
sb x1, 5(x25)
loop:
bgt x8, x2 , exit # i >= row1 rowAns => exit
addi x9, x0, 0
loop2:
bgt x9, x4 , exit2 # j >= col2 colAns => exit2
addi x12 , x0, 0 #sum
addi x10, x0, 0
loop3:
bge x10, x3 , exit3 # k >= col1 => exit3
mul x15, x8, x3  #i * col1 
add x15, x15, x10 #i * col1 + k
add x15, x15, x24 # &a[i * col1 + k] -- a is matrix 1
lb x16, 0(x15) # a[i * col1 + k]
mul x15, x10, x4  #k * col2
add x15, x15, x9 #k * col2 + j
add x15, x15, x25 # &a[i * col1 + k] -- b is matrix 2
lb x17, 0(x15) # b[k * col2 + j]
mul x18, x16, x17 #a[i * col1 + k] * b[k * col2 + j]
add x12 , x12, x18 #sum = sum + a[i * col1 + k] * b[k * col2 + j]
addi x10, x10, 1 # k++
beq x0, x0, loop3 
exit3:
mul x19, x4, x8 #i * col2
add x19,x19, x9 #i * col2 + j
add x19,x19, x26 #&d[i * col2 + j]
sb x12, 0(x19) #d[i * col2 + j] = sum -- d is output matrix
addi x9, x9, 1 # j++
beq x0, x0, loop2 
exit2:
addi x8, x8, 1 # i++
beq x0, x0, loop
exit:
nop