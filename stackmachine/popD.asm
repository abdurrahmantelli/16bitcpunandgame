# Assembler code 

A=0      
*A=*A-1    

# 2. D = RAM[SP] (Retrieve the value)
# Set Address to the new SP value
A=*A   
# Load the data from that memory location into D  
D=*A     