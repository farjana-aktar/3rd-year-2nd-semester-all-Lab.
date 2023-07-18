.MODEL SMALL
.STACK 100H

.DATA

    INMSG DB 'ENTER THE NUMBER : $'
    OUTMSG DB 'FACTORIAL IS : $'
    
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
    MOV BL, AL
    
    MOV AH, 02H
    MOV DL, 10
    INT 21H
    
    MOV DL, 13
    INT 21H
    
    LEA DX, OUTMSG
    MOV AH, 09H
    INT 21H
    
    ;PROCESS
    
    SUB BL, 48
    MOV AL, 1
    
    FACT:
    
        CMP BL, 0
        JE ENDINPUT
        
        MUL BL
        DEC BL
        
        JMP FACT
        
        
    ENDINPUT:
    
        ADD AL, 48
        MOV DL,AL
        
        MOV AH, 02H
        INT 21H
        
END MAIN
    
    
    