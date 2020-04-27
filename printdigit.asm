;*******************************Milad Eslaminia 810185259*****************************************
PAGE 300,310

;**********************************************************
;		DEFINING STACK SEGEMENT
;**********************************************************

STSEG   SEGMENT STACK 'STACK'
	DW 32 DUP(0)
STSEG   ENDS
;*********************************************************
;		DEFINING DATA SEGEMENT
;*********************************************************
DSEG    SEGMENT


TMP1		DB ?
TMP2		DB ?
TMP3		DB ?
TMP4		DB ?
N0      DB 'O','$'		;DIFFERNET PARTS OF EVERY DIGIT STORED HERE FOR LATER USE		
N2	DB 'O O','$'
N1      DB '  O','$'
N3      DB 'OOO','$'
N4      DB 'Press space key to exit!','$'
DSEG    ENDS
;********************************************************
;		CODE SEGEMENT STARTS HERE!
;********************************************************
CSEG    SEGMENT
START   PROC FAR
	ASSUME CS:CSEG, DS:DSEG, SS:STSEG
	MOV AX,DSEG	
	MOV DS,AX	

;***********************************************************
MOV CX,0000
MOV DX,0001
INPUT_LOOP:
	
	MOV AH,01					
	INT 16H
	JZ INPUT_LOOP
	MOV AH,00
	INT 16H	
	CMP AL,13
	JE DONE
	CMP DX,0001
	JE STORE1
	JNE STORE2

			;STORING FIRST AND SECOND DIGIT IN TMP3 AND TMP4
STORE1:
	MOV TMP3,AL
	DEC DX
	JMP INPUT_LOOP
STORE2:
	MOV TMP4,AL
	INC DX
	JMP INPUT_LOOP


DONE:
	
	mov	ah, 06H			;SET BACKGROUND COLOR
	mov 	al, 00
	mov	BX, 00FFH
	MOV 	BH,BL
	mov	cx, 0000H
	mov	dx, 184FH
	int	10H


	MOV AL, 00	
	MOV AH, 06
	MOV BH,80
	mov cx, 060FH
	mov dx, 1240H
	INT 10H

	
	mov ah, 02H		;MOVE CURSOR TO CENTER OF SCREEN
	mov bh, 00
	mov dh, 10
	mov dl, 35
	int 10h
	MOV AL,TMP3
	MOV TMP1,dl
	MOV CL,02			;CL IS FLAG FOR DETECTING EOP
	
NUM0:	CMP AL,'0'		;CHECK INPUT AND FIND THE ENTERED NUMBER AND PRINT IT, IF CL IS 				;ZERO IT MEANS ALL DIGITS ARE ALREADY PRINTED
	JNE NUM1
	CMP CL,00
	JE NUM1								
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	MOV TMP2,11        
LOOP0:	mov ah, 02H
	mov bh, 00
	mov dh, TMP2
	mov dl, TMP1
	int 10h
	CMP TMP2,14
	JE DONE0
	INC TMP2
	MOV AH,9H       				
	LEA DX,N2
	INT 21H	      
	JMP LOOP0
DONE0:	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1
	int 10h
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H         
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0			;WHEN DONE JUMP TO TOP TO DO THE SAME CHECK AGAIN

	
NUM1:	CMP AL,'1'			;DIGIT 1
	JNE NUM2
	CMP CL,00
	JE NUM2					
	MOV TMP2,10    
LOOP1:	mov ah, 02H
	mov bh, 00
	mov dh, TMP2
	mov dl, TMP1
	int 10h
	CMP TMP2,15
	JE DONE1
	INC TMP2
	MOV AH,9H       				
	LEA DX,N1
	INT 21H	      
	JMP LOOP1
DONE1:	
        
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM2:	CMP AL,'2'					;DIGIT 2
	JNE NUM3
	CMP CL,00
	JE NUM3
	
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N1
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N0 
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM3:	CMP AL,'3'			;DIGIT 3
	JNE NUM4
	CMP CL,00
	JE NUM4

	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N1
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N1
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0


NUM4:	CMP AL,'4'			;DIGIT 4
	JNE NUM5
	CMP CL,00
	JE NUM5

	MOV AH,9H       				
	LEA DX,N2 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N2
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N1 
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N1 
	INT 21H 
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM5:	CMP AL,'5'			;DIGIT 5
	JNE NUM6
	CMP CL,00
	JE NUM6

	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N0
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N1
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	CMP CL,00
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM6:	CMP AL,'6'			;DIGIT 6
	JNE NUM7
	CMP CL,00
	JE NUM7

	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N0
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N2 
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	CMP CL,00
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM7:	CMP AL,'7'			;DIGIT 7
	JNE NUM8
	CMP CL,00
	JE NUM8
	MOV AH,9H       				
	LEA DX,N3
	INT 21H
	MOV TMP2,11   
LOOP7:	mov ah, 02H
	mov bh, 00
	mov dh, TMP2
	mov dl, TMP1
	int 10h
	CMP TMP2,15
	JE DONE7
	INC TMP2
	MOV AH,9H       				
	LEA DX,N1
	INT 21H	      
	JMP LOOP7
	
DONE7:	
        
	DEC CL	
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	jmp NUM0

NUM8:	CMP AL,'8'			;DIGIT 8
	JNE NUM9
	CMP CL,00
	JE NUM9
	
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N2
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N2
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	CMP CL,00
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0

NUM9:	CMP AL,'9'			;DIGIT 9
	JNE EXIT_LOOP
	CMP CL,00
	JE EXIT_LOOP

	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 	  
   	mov ah, 02H
	mov bh, 00
	mov dh, 11
	mov dl, TMP1
	int 10h	
	MOV AH,9H       				
	LEA DX,N2
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 12
	mov dl, TMP1  
	int 10h  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
        mov ah, 02H
	mov bh, 00
	mov dh, 13
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N1
	INT 21H 
	mov ah, 02H
	mov bh, 00
	mov dh, 14
	mov dl, TMP1  
	INT 10H  
	MOV AH,9H       				
	LEA DX,N3 
	INT 21H 
	DEC CL	
	CMP CL,00
	mov ah, 02H
	mov bh, 00
	mov dh, 10
	mov dl, 40
	int 10h 
	MOV AL,TMP4
	MOV TMP1,dl
	JMP NUM0


			;ALL THE ABOVE SECTIONS FOLLOW THE SAME PATTERN FOR EVERY DIGIT
			;PRINT, MOVE CUROR, LOAD NEXT DIGIT, JUMP TO TOP AND START OVER


EXIT_LOOP:	
	MOV AH,01			;wait for space key to terminate program.	
	INT 16H
	JZ EXIT_LOOP
	MOV AH,00
	INT 16H	
	CMP AL,' '
	JNE EXIT_LOOP	


	       
	
	MOV AX,4C00H         
	INT 21H        
START   ENDP		
CSEG    ENDS		
	END START	

;*******************************************EOP*********************************	