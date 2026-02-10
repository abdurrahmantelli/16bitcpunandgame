# Assembler code 
# 1. Yığının en üstündeki VERİYİ (value) al ve D'ye sakla
A=0
# SP'yi bir geri çek
*A=*A-1   
# Verinin olduğu adrese odaklan
A=*A      
# D = Veri
D=*A      

# 2. Yığının bir altındaki ADRESİ (target address) al ve A'ya yükle
A=0
 # SP'yi bir kez daha geri çek
*A=*A-1  
# Adresin saklandığı hücreye odaklan
A=*A  
# A = Hedef Adres (Dolaylı erişim)    
A=*A      

# 3. Veriyi (D), hedef adrese (A) yaz
*A=D