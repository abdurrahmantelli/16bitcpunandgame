# pop.argument <index>
# --- Adres Hesapla ve Sakla ---
A = 1
# D = Argument taban adresi
D = *A       
A = index
 # D = Hedef Adres (Örn: 12)
D = D + A   
# Geçici slot seç
A = 13     
# Hedef adresi RAM[13]'e kaydet
*A = D      
# --- Değeri Stack'ten Çek ve Yerleştir ---
# Stack'teki en üst değeri D'ye al
pop.D   
# Geçici slotu tekrar seç     
A = 13      
# A = RAM[13] içindeki değer (Hedef Adres) 
A = *A 
# D'deki değeri hedef adrese yaz      
*A = D       