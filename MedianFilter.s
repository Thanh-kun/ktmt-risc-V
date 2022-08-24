addi x24, x0, 0x750 #contain base address of arr to sort
addi x25, x0, 0x400 #contain base address of input array
addi x26, x0, 0x600 #contain base address of output array
addi x2, x0, 7 #length of array sort -2 = size window - 2
addi x3, x0, 36 #length of input array
addi x4, x0, 0 #index
addi x5, x0, 6 #row of input
addi x6, x0, 6 #col of input
addi x10, x0, 0 #k = 0
addi x11 , x0, 0 #tmp
addi x1, x0,1
sb x1, 0(x25)
addi x1, x0,4
sb x1, 1(x25)
addi x1, x0,0
sb x1, 2(x25)
addi x1, x0,1
sb x1, 3(x25)
addi x1, x0,3
sb x1, 4(x25)
addi x1, x0,1
sb x1, 5(x25)
addi x1, x0,2
sb x1, 6(x25)
addi x1, x0,2
sb x1, 7(x25)
addi x1, x0,4
sb x1, 8(x25)
addi x1, x0,2
sb x1, 9(x25)
addi x1, x0,2
sb x1, 10(x25)
addi x1, x0,3
sb x1, 11(x25)
addi x1, x0,1
sb x1, 12(x25)
addi x1, x0,0
sb x1, 13(x25)
addi x1, x0,1
sb x1, 14(x25)
addi x1, x0,0
sb x1, 15(x25)
addi x1, x0,1
sb x1, 16(x25)
addi x1, x0,0
sb x1, 17(x25)
addi x1, x0,1
sb x1, 18(x25)
addi x1, x0,2
sb x1, 19(x25)
addi x1, x0,1
sb x1, 20(x25)
addi x1, x0,0
sb x1, 21(x25)
addi x1, x0,2
sb x1, 22(x25)
addi x1, x0,2
sb x1, 23(x25)
addi x1, x0,2
sb x1, 24(x25)
addi x1, x0,5
sb x1, 25(x25)
addi x1, x0,3
sb x1, 26(x25)
addi x1, x0,1
sb x1, 27(x25)
addi x1, x0,2
sb x1, 28(x25)
addi x1, x0,5
sb x1, 29(x25)
addi x1, x0,1
sb x1, 30(x25)
addi x1, x0,1
sb x1, 31(x25)
addi x1, x0,4
sb x1, 32(x25)
addi x1, x0,2
sb x1, 33(x25)
addi x1, x0,3
sb x1, 34(x25)
addi x1, x0,0
sb x1, 35(x25)
# output = input
copyInput:
bgt x4, x3, exitcopyInput # index >= lenghth input arr => exitcopyInput
add x15, x4, x25
lb x16, 0(x15)
add x15, x4, x26
sb x16, 0(x15)
addi x4, x4, 1 # index++
beq x0, x0, copyInput
exitcopyInput:
addi x12, x0, 1 #row
addi x13, x0, 1 #col
addi x21, x5, -1
addi x22, x6, -1
row:
bge x12, x21 , exitRow # row >= row input => exit
addi x13, x0, 1
col:
bge x13, x22 , exitCol # row >= row input => exit
#window[0] = array[row-1][col-1]
addi x19, x12, -1 #[row-1]
addi x20, x13, -1 #[col-1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row-1][col-1]
lb x20, 0(x19) #array[row-1][col-1]
sb x20, 0(x24)
#window[1] = array[row-1][col]
addi x19, x12, -1 #[row-1]
addi x20, x13, 0 #[col]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row-1][col]
lb x20, 0(x19) #array[row-1][col]
sb x20, 1(x24)
#window[2] = array[row-1][col+1]
addi x19, x12, -1 #[row-1]
addi x20, x13, 1 #[col+1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row-1][col+1]
lb x20, 0(x19) #array[row-1][col+1]
sb x20, 2(x24)
#window[3] = array[row][col-1]
addi x19, x12, 0 #[row]
addi x20, x13, -1 #[col-1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row][col-1]
lb x20, 0(x19) #array[row][col-1]
sb x20, 3(x24)
#window[4] = array[row][col]
addi x19, x12, 0 #[row]
addi x20, x13, 0 #[col]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row][col]
lb x20, 0(x19) #array[row][col]
sb x20, 4(x24)
#window[5] = array[row][col+1]
addi x19, x12, 0 #[row]
addi x20, x13, 1 #[col+1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row][col+1]
lb x20, 0(x19) #array[row][col+1]
sb x20, 5(x24)
#window[6] = array[row+1][col-1]
addi x19, x12, 1 #[row+1]
addi x20, x13, -1 #[col-1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row+1][col-1]
lb x20, 0(x19) #array[row+1][col-1]
sb x20, 6(x24)
#window[7] = array[row+1][col]
addi x19, x12, 1 #[row+1]
addi x20, x13, 0 #[col]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row+1][col]
lb x20, 0(x19) #array[row+1][col]
sb x20, 7(x24)
#window[8] = array[row+1][col+1]
addi x19, x12, 1 #[row+1]
addi x20, x13, 1 #[col+1]
mul x19, x5, x19
add x19, x19, x20
add x19, x19, x25 #&array[row+1][col+1]
lb x20, 0(x19) #array[row+1][col+1]
sb x20, 8(x24)
#sort window ---------------selction sort
addi x8, x0, 0 #i = 0
addi x9, x0, 0 #j = 0
loop:
bgt x8, x2 , exitSort # i > lenghth arr => exit
addi x9, x0, 0
loop2:
bgt x9, x2 , exit2 # j > lenghth arr => exit2
addi x11 , x0, 0 #tmp
addi x15, x9, 0 
add x15 , x15, x24 #&arr[j]
lb x16, 0(x15) # arr[j]
addi x14 ,x9, 1
add x14 ,x14 ,x24 #&arr[j+1]
lb x17, 0(x14) # arr[j+1]
bltu x16, x17, exit3
#addi x11, x16, 0 # tmp = arr[j]
sb x17, 0(x15) #arr[j] = arr[j + 1]
sb x16,0(x14) #arr[j + 1] = tmp;
exit3:
addi x9, x9, 1 # j++
beq x0, x0, loop2 
exit2:
addi x8, x8, 1 # i++
beq x0, x0, loop
exitSort:
addi x1, x0, 0
lb x1, 4(x24) # get 4 th in sorted array
addi x19, x0, 0
mul x19, x5, x12
add x19, x19, x13
add x19, x19, x26 
sb x1, 0(x19) #update
addi x13, x13, 1 # col++
beq x0, x0, col
exitCol:
addi x12, x12, 1 # row++
beq x0, x0, row
exitRow:
exit:
nop
