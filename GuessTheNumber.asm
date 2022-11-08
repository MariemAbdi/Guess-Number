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

                   
org 100h      ; ORG 100h is a compiler directive (it tells compiler how to handle the source code)

start:
       mov dx, offset output_msg     ; Show the output text
       mov ah, 9                     ; 9 or 09h function for printing string  
       int 21h                       ; Reads a character from the standard input device without copying it to the display. 
                                     ;If no character is ready it waits until one is available.
       
       
       ; read character in al:
       mov ah, 1    ; 1 or 01h function to accept a single digit    2 for two digits etc.
       int 21h      ; call interrupt

       cmp al, 'q'  ; compare
       je stop      ; jump if equal

       cmp al, 'Q'  
       je stop     
       
       cmp al, '0'
       jb error
       
       cmp al, '9'
       ja error

       cmp al, '5'
       jb less      ; jump below
       ja more      ; jump above
  
equal:
       mov dx, offset equal_5   ; print the message
       jmp print                ; jump to print = skip anything in between
                                
less: mov dx, offset below_5     
      jmp print              
       
more: mov dx, offset above_5   
        
error: 
       mov dx, offset error_msg 
       jmp print
       
print: mov ah, 09h
       int 21h    
       jmp start  ; loop. 
       
 


stop: ret  ; stop  => Return from Procedure(ret)


output_msg db "Enter A Number Between 0-9 :  $"
equal_5 db " is equal ! Congrats ^^", 0Dh,0Ah, "$"    ; 0Dh,0Ah => \n
below_5 db " is less than the number" , 0Dh,0Ah, "$"
above_5 db " is bigger than the number" , 0Dh,0Ah, "$"   
error_msg db " Input Is Not A Digit! ", 0Dh,0Ah, "$"  

end start ; set entry point and stop the assembler.