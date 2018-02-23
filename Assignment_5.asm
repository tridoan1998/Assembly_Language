;Tri Doan / 02/22/2018 
comment ! 
Clears the screen, locates the cursor near the middle of the screen.
Prompts the user for two signed integers.
Displays their sum and difference.
Repeats the same steps three times. 
Clears the screen after each loop iteration
!

include Irvine32.inc

.data

;create strings 
enter_string BYTE "Enter a sign integer: ", 0
sum_string BYTE "The sum is: ", 0
different_string BYTE "The difference is: ", 0
press_key_string BYTE "Press any key ...", 0

;create three variables 
var1 DWORD  ?		;first variable
var2 DWORD ?		;secondvariable 
row BYTE 10			;set row back to position 10 after every loop

.code
main proc
	mov ecx, 3				;set loop counter

	L1:						;run the program 3 times
		mov row, 10			;make row = 10ReadChar					
		call ClrScr			;clear the screen
		call Locate			;set the string to the middle 
		call Input		;this procedure prompts the user and saves the input
		call DisplaySum		;displays the sum
		call DisplayDiff	;displays the difference
		call WaitForKey		;displays "Press any key..." & wait for input
		Loop L1	

	call Locate			;locate the "Press any key to continue..."

	exit
main endp

	;paramter needed: row which use to set the position of string 
	Locate PROC				;needs to be called before anything displays
							;on the screen. Where it sets the cursor position
		mov   dh,row		; row 10
		mov   dl,20			;column 20
		call  Gotoxy		;locate cursor
		inc row				;increate by 1
		ret					;return the postition for the string 
	Locate ENDP

	;parameter needed: var1, var2 to add 
	DisplaySum PROC			;displays the sum.
		call Locate			;sets the cursor position
		mov eax, var1		;move var1 to register eax
		add eax, var2		;perform the addition
		mov edx, offset sum_string	;set string into edx
		call writeString		;cout string
		call writeInt			;cout the sum result
		ret					;returns the sum of three 32-bit integers
	DisplaySum ENDP

	;parameter needed: var1, var2 to sub
	DisplayDiff PROC		;displays the difference.
		call Locate			;sets the cursor position
		mov eax, var1		;move var1 to register eax
		sub eax, var2		;perform subtraciton 
		mov edx, offset different_string	 ;set string to edx
		call writeString		;cout string 
		call writeInt			;cout the subtraciton result 
		ret					;returns the differnet of three 32-bit integers
	DisplayDiff ENDP


	;parameter needed: Locate procedure to set position of the string
	WaitForKey PROC		;displays "Press any key..." and waits for an input
		call Locate							;sets the cursor position
		mov edx, offset press_key_string	;move string to edx
		call writeString	;cout string 
		call readChar		;input any char
		ret					;return from a procedure
	WaitForKey ENDP

	;parameter needed: strings to promts user
	Input PROC			;this procedure prompts the user and saves the input
		mov edx, offset enter_string	; move string to edx	
		call WriteString				;cout string
		call readInt					;cin valuable 
		mov var1, eax					;move varluable to var1 
		call Locate						;sets the cursor position
		mov edx, offset enter_string	;move string to edx	
		call WriteString				;cout string
		call readInt					;cin variable 
		mov var2, eax					;move variable to var2
		ret								;return from a procedure
	Input ENDP

end main

comment

sample run:
	
Enter a sign integer: 1
Enter a sign integer: 2
The sum is: +3
The difference is: -1
Press any key ...

Enter a sign integer: 2
Enter a sign integer: 3
The sum is: +5
The difference is: -1
Press any key ...

Enter a sign integer: 5
Enter a sign integer: 1
The sum is: +6
The difference is: +4
Press any key ...
Press any key to continue...

!