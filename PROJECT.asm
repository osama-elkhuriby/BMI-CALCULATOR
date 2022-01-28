.MODEL SMALL 

.DATA

X DB 'BMI CALCULATOR','$'

W DB 'ENTER YOUR WEIGHT : ','$'

W1 DB 0AH,9H,9H,'1)  50 : 60','$'
W2 DB 0AH,9H,9H,'2)  61 : 70','$'
W3 DB 0AH,9H,9H,'3)  71 : 80','$'
W4 DB 0AH,9H,9H,'4)  81 : 90','$'
W5 DB 0AH,9H,9H,'5)  91 : 100','$'
W6 DB 0AH,9H,9H,'6) 101 : 110','$'
W7 DB 0AH,9H,9H,'7) 111 : 120','$'
W8 DB 0AH,9H,9H,'8) 121 : 130','$'
W9 DB 0AH,9H,9H,'9) 131 : 140','$'
W10 DB 0AH,9H,9H,'-->  ','$'


H DB 'ENTER YOUR HEIGHT : ','$'


H1 DB 0AH,9H,9H,'1) 130 : 140','$'
H2 DB 0AH,9H,9H,'2) 141 : 150','$'
H3 DB 0AH,9H,9H,'3) 151 : 160','$'
H4 DB 0AH,9H,9H,'4) 161 : 170','$'
H5 DB 0AH,9H,9H,'5) 171 : 180','$'
H6 DB 0AH,9H,9H,'6) 181 : 190','$'
H7 DB 0AH,9H,9H,'7) 191 : 200','$'

WEIGHT DB ?
THEWEIGHT DB ?

HEIGHT DB ?
THEHEIGHT DB ?

RESULT DB 'THE RESULT IS : ','$'

RESULT1 DB 'UNDERWEIGHT','$'
RESULT1ADVISE DB 0AH,'Eat five to six smaller meals during the day rather than two or three',0AH,'large meals.',0AH,'Choose nutrient-rich foods.',0AH,'As part of an overall healthy diet, choose whole-grain breads,',0AH,'pastas and cereals; fruits and vegetables; dairy products; lean protein sources',0AH,'; and nuts and seeds.',0AH,'Try smoothies and shakes.','$'

RESULT2 DB 'HEALTHY WEIGHT','$'
RESULT2ADVISE DB 0AH,'Emphasizes vegetables, fruits, whole grains, and fat-free or low-fat dairy',0AH,'products.',0AH,'Includes lean meats, poultry, fish, beans, eggs, and nuts.',0AH,'Limits saturated and trans fats, sodium, and added sugars.',0AH,'Controls portion sizes.','$'

RESULT3 DB 'OVERWEIGHT','$'
RESULT3ADVISE DB 0AH,'Intermittent fasting is a dietary strategy that cycles between periods of',0AH,'fasting and eating.',0AH,'including the 16/8 method, which involves limiting your calorie intake to',0AH,'8 hours per day.','$'

RESULT4 DB 'OBESITY','$'
RESULT4ADVISE DB 0AH,'Bump up the protein. One gram of protein has four calories, while a gram of fat has nine.',0AH,'Ditch hidden sugars',0AH,'Drink more water.',0AH,'Sort your sleep.',0AH,'Exercise regularly.','$'

.CODE 
    MAIN PROC FAR 
    .STARTUP
    
     
    
    CALL ENDOFLINE
    
    
    ; BMI CALCULATOR
    LEA DX,X
    CALL PRINT
    
    CALL ENDOFLINE
    CALL ENDOFLINE
    
    ; WEIGHT
    LEA DX,W
    CALL PRINT
    
    LEA DX,W1
    CALL PRINT
    LEA DX,W2
    CALL PRINT
    LEA DX,W3
    CALL PRINT
    LEA DX,W4
    CALL PRINT
    LEA DX,W5
    CALL PRINT
    LEA DX,W6
    CALL PRINT
    LEA DX,W7
    CALL PRINT
    LEA DX,W8
    CALL PRINT
    LEA DX,W9
    CALL PRINT
    
    CALL ENDOFLINE
    
    LEA DX,W10
    CALL PRINT
  
    CALL READCHAR
    
    MOV WEIGHT, AL
    
    CALL ENDOFLINE
   
    
    
    ; HEIGHT
    
    LEA DX,H
    CALL PRINT
    
    LEA DX,H1
    CALL PRINT
    LEA DX,H2
    CALL PRINT
    LEA DX,H3
    CALL PRINT
    LEA DX,H4
    CALL PRINT
    LEA DX,H5
    CALL PRINT
    LEA DX,H6
    CALL PRINT
    LEA DX,H7
    CALL PRINT
   
    CALL ENDOFLINE
    
    LEA DX,W10
    CALL PRINT
    
    
    CALL READCHAR
    MOV HEIGHT, AL

    CALL ENDOFLINE
   
    
    LEA DX,RESULT
    CALL PRINT
    
            ; FINDING THE WEIGHT
    
            ; HERE I USED THE AVERAGE VALUE 
    
    CMP WEIGHT,31H
    JE A
    JNE M
    A:
    MOV THEWEIGHT,55D  
    JMP STOP
    M:
    CMP WEIGHT,32H
    JNE N
    JE B
    B:
    MOV THEWEIGHT,65D  
    JMP STOP
    N:
    CMP WEIGHT,33H
    JE C
    JNE O
    C:
    MOV THEWEIGHT,75D  
    JMP STOP
    O:
    CMP WEIGHT,34H
    JNE P
    JE D
    D:
    MOV THEWEIGHT,85D  
    JMP STOP
    P:
    CMP WEIGHT,35H
    JNE Q
    JE E
    E:
    MOV THEWEIGHT,95D 
    JMP STOP
    Q:
    CMP WEIGHT,36H
    JNE R
    JE F
    F:
    MOV THEWEIGHT,105D 
    JMP STOP 
    R:
    CMP WEIGHT,37H
    JNE S
    JE G
    G:
    MOV THEWEIGHT,115D  
    JMP STOP
    S:
    CMP WEIGHT,38H
    JNE T
    JE J
    J:
    MOV THEWEIGHT,125D  
    JMP STOP
    T:
    CMP WEIGHT,39H
    JNE STOP
    JE K  
    K:
    MOV THEWEIGHT,135D  
    JMP STOP
       
    STOP:
     
                ; FINDING THE HEIGHT
    
              
                ; IT SHOULD BE HEIGHT*HEIGHT IN METER .. I CAN'T DO IT WITH DEV SO I USED THE VALUE DIRECTLY
               ; IT'S  ~ 
                
    CMP HEIGHT,31H
    JE AA
    JNE MM
    AA:
    MOV THEHEIGHT,2D  
    JMP STOPP
    MM:
    CMP HEIGHT,32H
    JNE NN
    JE BB
    BB:
    MOV THEHEIGHT,2D  
    JMP STOPP
    NN:
    CMP HEIGHT,33H
    JE CC
    JNE OO
    CC:
    MOV THEHEIGHT,2D
    JMP STOPP
    OO:
    CMP HEIGHT,34H
    JNE PP
    JE DM
    DM:
    MOV THEHEIGHT,3D 
    JMP STOPP
    PP:
    CMP HEIGHT,35H
    JNE QQ
    JE EE
    EE:
    MOV THEHEIGHT,3D 
    JMP STOPP
    QQ:
    CMP HEIGHT,36H
    JNE RR
    JE FF
    FF:
    MOV THEHEIGHT,4D 
    JMP STOPP 
    RR:
    CMP HEIGHT,37H
    JNE STOPP
    JE GG
    GG:
    MOV THEHEIGHT, 4D 
    JMP STOPP
 
    STOPP:
    
    
    ; FINDING BMI 
    ; BMI = WEIGHT/ (HEIGHT*HEIGHT)
            
    MOV AL,THEWEIGHT
    
    MOV BL,THEHEIGHT
    MOV AH,0
    DIV BL
    
     ; BMI RESULT 
    
    CMP AL,18
    JL RES
    JG AGAIN
    RES:
    LEA DX,RESULT1  ;  Underweight
    CALL PRINT
    
    CALL ENDOFLINE
    
    LEA DX,RESULT1ADVISE
    CALL PRINT
    
    JMP FINAL 
    
    AGAIN:
    CMP AL,25
    JL RESA
    JG AGAINA
    RESA:
    LEA DX,RESULT2 ; Healthy Weight
    CALL PRINT
    
    CALL ENDOFLINE
    
    LEA DX,RESULT2ADVISE
    CALL PRINT
    
    JMP FINAL
    AGAINA:
    CMP AL,30
    JL RESB
    JG AGAINB
    RESB:
    LEA DX,RESULT3 ;  Overweight
    CALL PRINT
    
    CALL ENDOFLINE
    
    LEA DX,RESULT3ADVISE
    CALL PRINT
    
    JMP FINAL
    AGAINB:
    LEA DX,RESULT4 ; Obesity
    CALL PRINT
    
    CALL ENDOFLINE
    
    LEA DX,RESULT4ADVISE
    CALL PRINT
    
    JMP FINAL
    
    FINAL:  
    
    CALL ENDOFLINE
    
    .EXIT    
    MAIN ENDP 
    
    ; FUN FOR PRINT STR
   
    PRINT PROC NEAR
        MOV AH,09H
        INT 21H
        RET
    PRINT ENDP
    
    ;READ CHAR FROM THE USER
    
    READCHAR PROC NEAR
        MOV AH,01H
        INT 21H
        RET
    READCHAR ENDP
   
    ; PRINT NEW LINE
    
    ENDOFLINE PROC NEAR
        MOV AH,02H
        MOV DL,0AH
        INT 21H
        RET
    ENDOFLINE ENDP
    
    ; SORRY FOR BEING TOO LONG BUT IT'S BECAUSE I TRIED HARDLY TO USE THE CONTENT OF THE SECTIONS ONLY.
    ; SORRY FOR BEING LATE TOO,
    
    ;OSAMA AHMED ELKHURIBY
    ;MOTAZ MOHAMED ELZUHERY
    
    
END