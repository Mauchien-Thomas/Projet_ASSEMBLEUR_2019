code segment

    assume cs:code, ds:data
	mov ax ,data 
    mov ds, ax

data segment

     mess db 'M',13,10,'$' ;caractère du personnage
     MESSAGE DB "t", 0DH, 0AH ;touche enfoncée
     mess_menu db 'M',13,10,'$' ;caractère du personnage
     mess_fin DB "p", 0DH, 0AH ;touche enfoncée
	instruction db "veiliez appuyer soit sur s ou d ou z ou q pour demarrer le jeu",13,10,'$'
	synopsis db "Michel aillerie s'est fait capture par  le terrible Bernard Heuilly. Aide le a  trouver la sortie du jardin de ce terrible Bernard!!!!",13,10,'$'
	ligne db 2
	colonne db 30
	nom_jeu db "Le Labyrinthe",13,10,'$'
	go_quit db "Appuie sur q pour quitter le programme",13,10,'$'
	go_jeu db "Appuie sur r pour jouer",13,10,'$'
	fin_jeu db "Bravo tu as gagne ",13,10,'$'
	fin_jeu1 db "Appuie sur une touche pour aller au menu",13,10,'$'
 
 data ends
 
debut1 : 

	MOV ax, data  										
	MOV ds, ax 												
												
; Création d'un nouvel écran

    MOV AH, 0h                								; Fonction pour changer de mode vidéo
	MOV AL, 13h 											; Mode vidéo 320x200
	INT 10h 												; Appel de l'interruption 10h
	
; Positionnement du curseur 

	MOV AH, 02h												
	MOV BH, 0d 												
	MOV DH, 4d 												
	MOV DL, 13d 											
    INT 10h													
    
; Affichage du message
 
    MOV AH,	09h												
    MOV DX,	offset nom_jeu									
    INT 21h 												

; Positionnement du curseur 

	MOV AH, 02h												
	MOV BH, 0d 												
	MOV DH, 8d 												 
	MOV DL, 0d 											
    INT 10h													
    
; Affichage du message
 
    MOV AH,	09h												
    MOV DX,	offset synopsis								
    INT 21h 												
    
; Positionnement du curseur 

	MOV AH, 02h												
	MOV BH, 0d 												
	MOV DH, 18d 												 
	MOV DL, 1d 											 
    INT 10h													
    
; Affichage du message
 
    MOV AH,	09h												
    MOV DX,	offset go_quit						
    INT 21h 												

; Positionnement du curseur 

	MOV AH, 02h												
	MOV BH, 0d 												
	MOV DH, 15d 												 
	MOV DL, 8d 											 
    INT 10h													
    
; Affichage du message
 
    MOV AH,	09h												
    MOV DX,	offset go_jeu					
    INT 21h 											

; Lecture clavier 

	MOV AH,	3FH											
	MOV BX, 001H											
	LEA DX,	mess_menu 									
	MOV CX,	1d 												
	INT 21H													
 
; Conditions de la touche enfoncée

	CMP mess_menu, 71h 										; Compare la touche enfoncée avec q minuscule (71h)
	JE quitter												; Si la touche enfoncée est q alors saut vers 'quitter :'
	CMP mess_menu, 72h 										; Compare la touche enfoncée avec r minuscule (72h)
	JE jeu												; Si la touche enfoncée est r alors saut vers 'regles :'
	
	JMP debut1												; Si la touche enfoncée ne correspond pas alors on revient au début

; Si la touche enfoncée est q (Interruption du programme)

quitter :
	
	MOV AH, 4CH 											; Fonction permettant l'interruption du programme
	INT 21H													; Appel de l'interruption 21h
						; Appel de l'interruption 21h
jeu : 


;effacement de l'écran au démarrage

    mov ah, 0h
    mov al, 13h ;mode vidéo 320x200 et 256 couleurs
    int 10h
    
 debut:
		
		;bordure bas  
      		 MOV AH,0CH
		MOV AL,2
       		MOV CX,255
		MOV DX,180 
		MOV BX,25  
		
                
BORD1:
		INT 10H
		DEC CX
                CMP BX,CX
		JNE BORD1
	;bordure gauche 
		MOV BX,20
		MOV CX,0
		MOV DX,180 

BORD2:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE BORD2
	;bordure haut
		MOV CX,240
		MOV DX,20
BORD3:
		INT 10H
		DEC CX
		JNZ BORD3
	;bordure droite 
		MOV BX,20
		MOV CX,255
		MOV DX,180

BORD4:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE BORD4 
		
		;interieur du labyrinthe
		
		
		MOV BX,200
		MOV DX,40 
		MOV CX,240
CHEM1:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM1  
		
		MOV BX,40
		MOV DX,20
		MOV CX,240
        
		
CHEM2:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM2  
		
		MOV BX,140
		MOV DX,60
		MOV CX,255
        
		
CHEM3:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM3 
		
		MOV BX,40
		MOV DX,60
		MOV CX,140
        
		
CHEM4:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM4 
		
                MOV BX,95
		MOV DX,30
		MOV CX,0
        
		
CHEM5:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM5   
		
		MOV BX,110
		MOV DX,60
		MOV CX,95
        
		
CHEM6:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM6
		
	        MOV BX,40
		MOV DX,60
		MOV CX,110
        
		
CHEM7:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM7
		
	        MOV BX,100
		MOV DX,30
		MOV CX,95
        
		
CHEM8:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM8
		
	        MOV BX,100
		MOV DX,60
		MOV CX,200
        
		
CHEM9:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM9 
		
	        MOV BX,150
		MOV DX,75
		MOV CX,200
        
		
CHEM10:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM10
		
	        MOV BX,160
		MOV DX,100
		MOV CX,95
        
		
CHEM11:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM11
		
		MOV BX,135
		MOV DX,100
		MOV CX,160
        
		
CHEM12:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM12 
		
		MOV BX,230
		MOV DX,125
		MOV CX,160
        
		
CHEM13:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM13
		
		MOV BX,100
		MOV DX,125
		MOV CX,230
        
		
CHEM14:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM14 
		
		MOV BX,100
		MOV DX,125
		MOV CX,215
        
		
CHEM15:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM15 
				
		MOV BX,230
		MOV DX,140
		MOV CX,255
        
		
CHEM16:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM16 
		
		MOV BX,80
		MOV DX,150
		MOV CX,255
        
		
CHEM17:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM17
		
		MOV BX,50
		MOV DX,150
		MOV CX,80
        
		
CHEM18:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM18
		
		MOV BX,40
		MOV DX,50
		MOV CX,80
        
		
CHEM19:
		INT 10H
		DEC CX
		CMP BX,CX
		JNE CHEM19 
		
		MOV BX,20
		MOV DX,70
		MOV CX,0
        
		
CHEM20:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM20
		
		MOV BX,40
		MOV DX,90
		MOV CX,0
        
		
CHEM21:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM21
		
		MOV BX,150
		MOV DX,110
		MOV CX,20
        
		
CHEM22:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM22
		
		MOV BX,130
		MOV DX,90
		MOV CX,40
        
		
CHEM23:
		INT 10H
		INC DX
		CMP BX,DX
		JNE CHEM23 
		
		MOV BX,60
		MOV DX,150
		MOV CX,20
        
		
CHEM24:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM24 
		
				
		MOV BX,100
		MOV DX,150
		MOV CX,60
        
		
CHEM25:
		INT 10H
		DEC DX
		CMP BX,DX
		JNE CHEM25
		
				
		MOV BX,80
		MOV DX,125
		MOV CX,60
        
		
CHEM26:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM26
		
		MOV BX,200
		MOV DX,165
		MOV CX,0
        
		
CHEM27:
		INT 10H
		INC CX
		CMP BX,CX
		JNE CHEM27
		
 

;positionnement du curseur pour le synopsis
	mov AH,02h
	mov BH,0 ;numéro de page
   mov DH, 0 ;coordonnée ligne (Y)
   mov DL, 0 ;coordonnée colonne (X)
    int 10h
    

;Lecture clavier 
    MOV BX, 001H
    LEA DX,MESSAGE ;touche enfoncée
    MOV CX,1d ;nombre de caractère a lire
    MOV AH,3FH
    INT 21H
 
	
;condition

    CMP MESSAGE, 73h ; compare message avec 73h s minuscule
    JE descendre
    CMP MESSAGE, 64h ; compare message avec 64h d minuscule
    JE droite
    CMP MESSAGE, 7ah ; compare message avec 7ah z minuscule
    JE monter
    CMP MESSAGE, 71h ; compare message avec 71h q minuscule
    JE gauche
    CMP MESSAGE, 74h ; compare message avec 74h h minuscule
    JE retour 

	
;interruption du programme

    MOV AH, 4CH 
    INT 21H

;condition bis
descendre :
    add ligne, 1d
    jmp affichage 

droite :
    add colonne, 1d
    jmp affichage 

monter :
    sub ligne, 1d
    jmp affichage 

gauche :
    sub colonne, 1d
    jmp affichage 

retour :

	MOV colonne, 30d
	MOV ligne, 2d
	
	jmp debut1
	
affichage :

;Effacement de l'écran entre chaque touche enfoncée

    mov ah, 0h
    mov al, 13h 
    int 10h 

;Positionnement du curseur

    mov AH, 02h
    mov BH, 0 ;numéro de page
    mov DH, ligne ;coordonnée ligne 
    mov DL, colonne ;coordonnée colonne 
    int 10h
    
;Affichage du caractère qui se déplace
     
   mov ah, 09h
   mov dx, offset mess
   int 21h
    
;Voir si les coordonnées du pion sont celles de l'arrivé
	
	mov ah, colonne
	cmp ah, 1d
	jne saut
	mov bh, ligne
	cmp bh, 22d
	jne saut
	
;Effacement de l'écran 

    mov ah, 0h
    mov al, 13h 
    int 10h 
    
;Positionnement du curseur 

	mov AH, 02h
	mov BH, 0 ;numéro de page
	mov DH, 10 ;coordonnée ligne 
	mov DL, 12 ;coordonnée colonne 
    int 10h
    
;Affichage du message 

    mov ah, 09h
    mov dx, offset fin_jeu ; message voulant être affiché
    int 21h 
    
;Positionnement du curseur 

	mov AH, 02h
	mov BH, 0 ;numéro de page
	mov DH, 14 ;coordonnée ligne 
	mov DL, 0 ;coordonnée colonne 
    int 10h
    
;Affichage du message 

    mov ah, 09h
    mov dx, offset fin_jeu1 ; message voulant être affiché
    int 21h 

;Lecture clavier 
    MOV BX, 001H
    LEA DX,mess_fin ;touche enfoncée
    MOV CX,1d ;nombre de caractère a lire
    MOV AH,3FH
    INT 21H
 
	MOV colonne, 30d
	MOV ligne, 2d
	
   JMP debut1
   
saut :
	
	JMP debut

 code ends
 end
