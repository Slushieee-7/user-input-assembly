.MODEL SMALL
.STACK 100H

;this is how to comment in assembly 

.DATA 

MSG1 DB "Enter your Name: $" ;these MSG1 and MSG2 syntax displays what is inside
MSG2 DB "Your name is: $" 
VAR  DB 100 DUP('$') ;is an array of characters that will store the user's input

;this is the public class main { public static void main(String[] args) chuchuchuhcuh
.CODE
MAIN PROC

;in Java, these are the initializers
MOV AX,@DATA
MOV DS,AX ;this translates the data segment "DS" into a much higher bit or 16-bit 
MOV SI,OFFSET VAR  ;this line of code declares the characters stored in the array which then converts it to a 16 bit 

;these code are the "System.out.println" in Java
LEA DX,MSG1 ; "LEA DX" is the "System.out.println" in Java
MOV AH,9 ; this registers to 9, whihc is the function code for displaying a string
INT 21H ;this reads the character from the console

COME:   
MOV AH,1 ;the "MOV AH" registers the system and the number 1 initiates the SOH (Start of Heading) in ASCII
INT 21H ;this reads the character from the console

; user input
CMP AL,13 ; Compare the value in AL with 13        
JE HERE ;this is the while loop in java
MOV [SI],AL ; Move the value in AL to the memory location pointed by SI
INC SI ; Increment the SI register (pointer)              
JMP COME  ; Jump to label 'COME' (loop back)
;in Java terms this is 
;Scanner scanner = new Scanner(System.in);
;while (true) {
;    char input = scanner.next().charAt(0);
;    if (input == '\r') { // equivalent to the CMP AL, 13 instruction
;        break;
;    }
;    var[si++] = input;
;}

;displaying the entered name
HERE:
MOV AH,2 ;moves the 2 values into the AH register which will print the said character to the console 
MOV DL,0DH ;this hold the character to be printed
INT 21H ;prints or displays the line "MOV DL, 0DH" to the console          
MOV DL,0AH ;moves the ASCII value of the line feed character into DL register
INT 21H ;prints or displays the line "MOV DL, 0AH" to the console
;in java this would be equivalent to
;System.out.println();
;System.out.print(msg2);
;System.out.println(new String(var, 0, si));

;exiting the program
LEA DX,MSG2       
MOV AH,9
INT 21H
;in java this would be equivalent to:
; System.exit(0)
          
MOV Dl,OFFSET VAR ; gets the address of the variable
MOV AH,9 ; reads the character from the console (initiator number 9)
INT 21H ;in Java terms this is "System.out.print(string)"
MOV AH,4CH ;AH is the high order byte which means it converts it to like float or double or anything that holds a higher amount of memory
INT 21H ;this is "System.exit(0)" in Java
 
MAIN ENDP
END MAIN ;end lines 