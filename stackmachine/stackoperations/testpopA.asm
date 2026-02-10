# Assembler code 
# 1. SP = SP - 1
# Address of SP
A=0 
# Decrement pointer (points to the top value)     
*A=*A-1    

# 2. A = RAM[SP]
# A now holds the address of the data (e.g., 256)
A=*A  
# A now holds the actual VALUE stored at that address    
A=*A   