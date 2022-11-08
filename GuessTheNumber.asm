;Ecrire un programme qui lit un caractere au clavier entre '0' et '9', le compare à '5' et afficher
;plus grand, plus petit ou bien egal selon la valeur du caractere. 
;Faire ceci en boucle jusqu'à l'introduction du caractere 'q' ou 'Q'

;Donner un caractere : 4
;plus petit   

;Donner un caractere : 7
;plus grand   

;Donner un caractere : 5
;egal     

;Donner un caractere : 8
;plus grand  

;Donner un caractere : q
;Au revoir



; multi-segment executable file template.

data segment
    ; add your data here!
    mainMsg db "Enter a number b/w 0 and 9: $"
	lessMsg db "Oh! The number is less then your guess$"
	equalMsg db "WOW! Your guess is correct the number is: $"
	greaterMsg db "Oh! The number is greater then your guess$"                             
ends
     
     
stack segment
    dw   128  dup(0)
ends
        
        
code segment  
    
start:
; set segment registers:
    mov ax, data                            
    mov ds, ax
    mov es, ax     
    

    ; add your code here
    
    mov bl, 0     ;bl=0
    mov al, 5     ;al=0
    cmp al, bl    ;compare!  
    jl less       ; jump if less than
	je equal      ; jump if equal to
	jg greater    ; jump if greater than

     
less:

greater:   

equal:



	quit:

           
           
           
           
           
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.