;Factorial

.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB "ENTER THE NUMBER(1-3) : $"
    OUTMSG DB "THE FACTORIAL IS : $"
    
    N DB ?
    DV DB 2

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, INMSG
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    SUB AL, 48
    
    MOV BL, AL
    MOV AL, 1
    MOV N, 1
    
    CMP BL, 0
    JZ ENDTOP
    
    TOP:
    
        MUL N
        
        CMP BL, N
        JZ ENDTOP
        
        INC N
        JMP TOP
    
    ENDTOP:
        
        MOV N, AL 
        
        CALL NEWLINE
        
        LEA DX, OUTMSG
        MOV AH, 09H
        INT 21H
        
        MOV DL, N
        ADD DL, 48
        MOV AH, 02H
        INT 21H
        
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




