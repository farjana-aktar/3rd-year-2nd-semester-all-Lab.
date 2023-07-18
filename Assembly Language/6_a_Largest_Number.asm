; FIND THE LARGEST NUMBER

.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB "ENTER THE NUMBER(0-9) : $"
    OUTMSG DB "THE LARGEST NUMBER IS : $"
    
    ARR DB 100 DUP("$") ?
    MX DB 0
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, INMSG
    MOV AH, 09H
    INT 21H 
    
    MOV MX, 0
    
    INPUT:
        
        MOV AH, 01H
        INT 21H
        
        CMP AL, 0DH
        JE EXIT_INPUT
        
        CMP AL, MX
        JG MAX
        JMP INPUT
        
    MAX:
    
        MOV MX, AL
        JMP INPUT
    
    EXIT_INPUT:
    
        CALL NEWLINE
        
        LEA DX, OUTMSG
        MOV AH, 09H
        INT 21H
        
        MOV DL, MX
        MOV AH, 02H
        INT 21H
        
    EXIT:
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP

NEWLINE PROC
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    
    MOV DL, 0AH
    MOV AH, 02H
    INT 21H
    
    RET
    
    NEWLINE ENDP

END MAIN



