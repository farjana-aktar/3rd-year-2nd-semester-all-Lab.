.MODEL SMALL
.STACK 100H

.DATA

    STR DB 100 DUP ("$")
    
    INMSG DB "ENTER THE STRING : $"
    OUTMSG DB "THE CASE REVERSED STRING : $"
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, INMSG
    MOV AH, 09H
    INT 21H
    
    MOV SI, 0
    
    INPUT:
    
        MOV AH, 01H
        INT 21H
        
        CMP AL, 0DH
        JZ EXIT_INPUT
        
        MOV STR[SI], AL
        INC SI
        
        JMP INPUT
        
    EXIT_INPUT:
        
        CALL NEWLINE
        
        LEA DX, OUTMSG
        MOV AH, 09H
        INT 21H 
        
        MOV DI, 0 
        
    OUTPUT: 
    
        CMP DI, SI
        JE EXIT
        
        MOV AL, STR[DI]
        
        CMP AL, 'z'
        JG NOCHANGE
        
        CMP AL, 'A'
        JL NOCHANGE
        
        CMP AL, 'Z'
        JG CHECK 
        
        JMP CONVERSION
        
    CHECK:
    
        CMP AL, 'a'
        JL NOCHANGE
        
        JMP CONVERSION
        
    NOCHANGE:
    
        MOV DL, AL
        MOV AH, 02H
        INT 21H
        
        INC DI
        JMP OUTPUT
        
    CONVERSION:
    
        XOR AL, 32
        MOV DL, AL
        
        MOV AH, 02H
        INT 21H
        
        INC DI
        JMP OUTPUT
        
    EXIT:
    
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP

NEWLINE PROC
    
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    
    RET
    
    NEWLINE ENDP

END MAIN
    
        
        
     


