# Assembler code 
# 1. RAM[SP] = D
# Address of Stack Pointer
A=0       
# Get the value stored in RAM[0] (e.g., 256) and set it as current address
A=*A      
# Store the value of D at that address (e.g., RAM[256] = D)
*A=D      


# 2. SP = SP + 1
# Address of Stack Pointer