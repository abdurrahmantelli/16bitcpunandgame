# Assembler code 
# 1. SP'yi (RAM 0) bir azalt (Yığının en üstündeki dolu hücreye git)
A=0
*A=*A-1

# 2. Güncel SP'nin gösterdiği adresteki değeri D register'ına al
A=*A
D=*A

# 3. Bu değeri 'address' ile belirtilen hedef hücreye yaz
A=address
*A=D