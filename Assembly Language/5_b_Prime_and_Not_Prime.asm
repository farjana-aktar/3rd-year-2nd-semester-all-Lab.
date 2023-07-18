;PRIME AND NON-PRIME NUMBER CHECK

.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB "ENTER THE NUMBER(0-9) : $"
    PRIME_MSG DB " IS THE NUMBER A PRIME$"
    NON_PRIME_MSG DB " IS THE NUMBER A NON PRIME$"
    
    N DB ?
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, INMSG
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    MOV N, AL
    
    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H 
    
    MOV AL, N
    
    CMP AL, '0'
    JE NOT_PRIME
    
    CMP AL, '1'
    JE NOT_PRIME
    
    CMP AL, '2'
    JE PRIME
    
    SUB AL, '0'
    MOV BL, AL
    MOV CL,AL
    DEC CL
    
    LOOP1:
        
        MOV AH, 0H
        DIV CL
        MOV AL, BL
        
        CMP AH, 0H
        JE NOT_PRIME
        
        CMP CL, 2
        JE PRIME
        
        LOOP LOOP1
        
    PRIME:
    
        ;CALL NEWLINE
        
        MOV DL, N
        MOV AH, 02H
        INT 21H
        
        ;CALL NEWLINE
        
        LEA DX, PRIME_MSG
        MOV AH, 09H
        INT 21H
        
        
        JMP EXIT
        
    NOT_PRIME:
    
        ;CALL NEWLINE
        MOV DL, N
        MOV AH, 02H
        INT 21H
        
        LEA DX, NON_PRIME_MSG
        MOV AH, 09H
        INT 21H
        
        JMP EXIT
        
    EXIT:
    
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP

NEWLINE PROC
    
    MOV DL, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    
    RET
    
    
    NEWLINE ENDP

END MAIN
    
    



