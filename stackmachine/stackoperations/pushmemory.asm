# Assembler code 
# 1. Yığındaki adresi al (Pop)
A=0
# SP'yi bir geri çek
*A=*A-1 
# A artık yığındaki adresi tutan hücreyi gösteriyor  
A=*A   
 # A artık yığının içindeki 'hedef adresi' tutuyor   
A=*A     

# 2. Hedef adresteki içeriği oku
D=*A     

# 3. Bu içeriği tekrar yığına yaz (Push)
# Not: SP'yi az önce azaltmıştık, şimdi aynı yere yazıp tekrar artıracağız
A=0
# A = Eski SP konumu
A=*A   
# RAM[SP] = D

*A=D      
# 4. SP'yi tekrar eski haline getir (Sonraki boş slot)
A=0
*A=*A+1