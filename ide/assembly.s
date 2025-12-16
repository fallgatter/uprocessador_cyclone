#Validação escolhida: Final de loop por detecção do MSB setado usando SHIFT RIGHT

LD A,0    
LD R0,0   
LD R1,1  
LD R2,5   

MOV A,R0  
ADD R1    
MOV R0,A  
SW A,R0   
SRLI R2   
CMPI 0    
BLE -6    

LD R0,2   
LD R1,2   

MOV A,R0    
ADD R1    
MOV R0,A  
LD A,0    
SW A,R0   
MOV A,R0  
SRLI R2   
CMPI 0    
BLE -8    

LD R0,3   
LD R1,3   

MOV A,R0  
ADD R1   
MOV R0,A 
LD A,0    
SW A,R0   
MOV A,R0  
SRLI R2   
CMPI 0    
BLE -8    

LD R0,5   
LD R1,5   

MOV A,R0  
ADD R1    
MOV R0,A  
LD A,0    
SW A,R0   
MOV A,R0  
SRLI R2   
CMPI 0    
BLE -8    

LD R0,1   
LD R1,1

MOV A,R0  
ADD R1   
MOV R0,A 
LW A,R0   
MOV R6,A  
MOV A,R0  
SRLI R2   
CMPI 0    
BLE -8    
