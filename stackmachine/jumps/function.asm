# 1. Fonksiyonun başlangıç etiketini tanımla
label functionName

# 2. LOCALS (2) işaretçisini mevcut SP (0) değerine eşitle
A = 0
D = *A
A = 2
*A = D

# 3. Yerel değişkenler için yığında yer aç (SP = SP + localsCount)
A = localsCount
D = D + A
A = 0
*A = D