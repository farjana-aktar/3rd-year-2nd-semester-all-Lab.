; FIND SMALLEST NUMBER

.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB "ENTER THE NUMBERS(0-9) : $"
    OUTMSG DB "THE SMALLEST NUMBER IS : $"
    
    ARR DB 100 DUP ("$") ?
    MINI DB 9
    
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, INMSG
    MOV AH, 09H
    INT 21H 
    
    MOV MINI,'9'
    
    INPUT:
    
        MOV AH,01H
        INT 21H
        
        CMP AL,0DH
        JE OUTPUT 
        
        
        CMP AL,MINI
        JL MIN2 
        
        JMP INPUT 
        
        MIN2:
            CMP AL,' '
            JNE MIN
            JMP INPUT
        
        MIN:
        
            MOV MINI,AL
            JMP INPUT
    
    OUTPUT:
    
        CALL NEWLINE
       ; add mini,48
       
        LEA DX, OUTMSG
        MOV AH, 09H
        INT 21H
        
        MOV DL,MINI
        
        MOV AH,02H
        INT 21H
    
    EXIT:
    
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
    
    NEWLINE PROC
        
        MOV DL,0DH
        MOV AH, 02H
        INT 21H
        
        MOV DL,0AH
        MOV AH, 02H
        INT 21H
        
        RET
        
    NEWLINE ENDP 

END MAIN
    
        


