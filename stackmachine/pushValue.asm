# 1. Değeri önce D register'ına güvene al
A=value
D=A

# 2. SP'nin (RAM 0) değerini A'ya yükle
A=0
A=*A

# 3. Artık A yığının tepesini gösteriyor, D'yi oraya yaz
*A=D

# 4. SP'yi (RAM 0) bir artır
A=0
*A=*A+1