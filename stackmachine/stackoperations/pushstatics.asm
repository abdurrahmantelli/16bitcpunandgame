# Assembler code 
# 1. 'address' içindeki değeri D register'ına al
A=address
D=*A

# 2. SP'nin (RAM 0) gösterdiği adresi bul
A=0
A=*A

# 3. Değeri (D) yığına yaz
*A=D

# 4. Stack Pointer'ı (SP) 1 artır
A=0
*A=*A+1