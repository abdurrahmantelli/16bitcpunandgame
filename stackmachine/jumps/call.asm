# --- CALL BAŞLAT ---

# 1. ARGS'ı manuel yığına it (push ARGS)
A = 1
D = *A
A = 0
A = *A
*A = D
A = 0
*A = *A + 1

# 1. LOCALS'ı manuel yığına it (push LOCALS)
A = 2
D = *A
A = 0
A = *A
*A = D
A = 0
*A = *A + 1

# 2. Dönüş adresini (L1) manuel yığına it
A = L1
D = A
A = 0
A = *A
*A = D
A = 0
*A = *A + 1

# 3. Yeni ARGS adresini hesapla (ARGS = SP - nArgs - 3)
A = 0
D = *A
A = argumentCount
D = D - A
A = 3
D = D - A
A = 1
*A = D

# 4. Fonksiyona zıpla
A = functionName
JMP

label L1

# 5. LOCALS'ı geri yükle (Manuel POP)
A = 0
*A = *A - 1    # SP'yi bir geri çek
A = *A         # Yığının son elemanına git
D = *A         # Değeri al
A = 2          # LOCALS adresine git
*A = D         # Değeri yaz

# 5. ARGS'ı geri yükle (Manuel POP)
A = 0
*A = *A - 1
A = *A
D = *A
A = 1
*A = D

# 6. RETVAL'i yığına it (Manuel PUSH)
A = 6
D = *A
A = 0
A = *A
*A = D
A = 0
*A = *A + 1