;Tri Doan / 02/15/2018 
;1. Prompts the user to enter 5 numbers.
;2. saves those numbers in a 32-bit integer array.
;3. Calculates the sum of the numbers and displays it.
;4. Calculates the mean of the array and displays it.
;5. Prints the array in the same order it was entered.
;6. Rotates the members in the array backward one position for 
;   5 times. so the last rotation will display the array in original order
;7.  Print the array after each rotation.
;    check the sample run.


include Irvine32.inc

.data

;create a string 
str1 BYTE "Please enter a number: ", 0
str2 BYTE "The mean of the integer array is: ", 0
space BYTE " ", 0
str3 BYTE "/", 0
str4 BYTE "The integer array you entered is: ", 0

;create an array 
arrayT DWORD 5 dup(?)

;create a variable to hold sum
Sum DWORD ?

.code
main proc
	
	mov edx, OFFSET str1		;put address of str1 to edx 

	mov ecx, LENGTHOF arrayT    ;set loop counter
	mov esi, OFFSET arrayT		;hold address of arrayT

	mov eax, 0					;zero the accumulator

	L1: 
		call writeString		;cout str
		call Crlf				;go down one line
		call readInt  			;cin the variable (32-bit integer array)

		mov [esi], eax			;put input into position esi 
		add esi, TYPE arrayT	;increate esi by 1 
		Loop L1					;input 5 elements 

	mov esi, OFFSET arrayT		;point esi to the beginning of arrayT
	mov eax, 0					;set eax to 0
	mov ecx, LENGTHOF arrayT	;set loop counter 
	mov edx, OFFSET str2		;put address of str2 into edx
	call writeString			;write str2
	
	L2:
		add eax, [esi]			;add data from position esi to eax 
		add esi, TYPE arrayT	;invreate esi by 1
		Loop L2					;sum of 5 elements
	
	mov ecx, LENGTHOF arrayT	;get length of the array 
	mov edx, 0					;set edx to 0 before division 
	div ecx						;divide eax with ecx put mean into edx:eax
	call WriteDec				;cout the quotient
	mov eax, edx 
	mov edx, OFFSET space		;set space string into edx 
	call writeString			; cout the space 
	call writeDec				;cout the remainder 
	mov edx, OFFSET str3		;put string "/" into edx
	call writeString			;cout "/""
	mov eax, LENGTHOF arrayT	
	call writeDec
	call Crlf					;go down one line 


	mov edx, OFFSET str4 
	call writeString			
	call Crlf					;go down one line 

	mov edx, OFFSET space		;set space to edx 
	mov ecx, LENGTHOF  arrayT	;set loop counter
	mov esi, OFFSET arrayT		;point esi to arrayT
	L3:
		mov eax, [esi]
		add esi, TYPE arrayT
		call writeDec
		call writeString
		Loop L3						;cout the elements in the array






	exit
main endp
end main



