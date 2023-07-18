; Series Summation {n(n+1)}/2

.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB "ENTER THE NUMBER(1-3) : $"
    OUTMSG DB "tHE SUMMATION IS : $"
    
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
    
    ;SUMMATION
    
    SUB AL, '0'
    MOV BL, AL
    INC BL
    MUL BL
    
    MOV BL, 02H
    DIV BL
    ADD AL, '0'
    MOV N, AL
    
    CALL NEWLINE
    
    
    LEA DX, OUTMSG
    MOV AH, 09H
    INT 21H
    
    MOV DL, N
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