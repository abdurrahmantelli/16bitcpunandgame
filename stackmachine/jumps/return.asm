# 1. Yığının tepesindeki değeri yani sonucu al
A = 0
*A = *A - 1
# SP bir azaldı sonuç şu an bu adreste
A = *A
D = *A
# Sonucu RETVAL yani Adres 6 hücresine yaz
A = 6
*A = D

# 2. SP değerini LOCALS değerine eşitle
A = 2
D = *A
A = 0
*A = D

# 3. Dönüş adresini yığından çek
# SP şu an tam dönüş adresinin üstünde duruyor
A = 0
*A = *A - 1
# SP bir azaldı dönüş adresi burada
A = *A
D = *A

# 4. Elde edilen adrese zıpla
A = D
JMP