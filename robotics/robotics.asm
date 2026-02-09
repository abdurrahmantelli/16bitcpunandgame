# Programın başlangıç noktası
begin:
# Donanım adresi olan 7FFF (32767) seçilir
A = 0x7FFF
# Donanımdan gelen mevcut durum verisi okunur
D = *A
# Robot dönüyor mu (Bit 9) veya ilerliyor mu (Bit 10) kontrolü (512 + 1024 = 1536)
A = 1536
# Mevcut durum ile bu bitler 'AND' işlemine sokulur
D = D & A
# Eğer robot hala meşgulse (D > 0), hiçbir şey yapma ve en başa dönüp bekle
A = begin
D; JGT

# --- ROBOT DURDU, ŞİMDİ SENSÖRÜ OKU ---
# Donanım adresi tekrar seçilir
A = 0x7FFF
# Güncel veri tekrar okunur
D = *A
# Engel biti olan Bit 8'i (256) kontrol etmek için sınır değer yüklenir
A = 256
# Sensör verisi ile engel biti 'AND' işlemine sokulur (D & A)
D = D & A
# Eğer sonuç 0 değilse (Engel Varsa), 'tl' (Turn Left) etiketine zıpla
A = tl
D; JGT

# --- ÖNÜ TAMAMEN BOŞSA: İLERİ GİT ---
# İleri gitme biti (Bit 2 = 4) seçilir
A = 4
# Komut değeri D'ye alınır
D = A
# Donanım adresi seçilir
A = 0x7FFF
# Komut donanıma gönderilir
*A = D
# Döngüyü tazelemek için başlangıca dönülür
A = begin
JMP

# --- ÖNÜ DOLUYSA: SOLA DÖN ---
tl:
# Sola dönme biti (Bit 3 = 8) seçilir
A = 8
# Komut değeri D'ye alınır
D = A
# Donanım adresi seçilir
A = 0x7FFF
# Komut donanıma gönderilir
*A = D
# Döngüyü tazelemek için başlangıca dönülür
A = begin
JMP