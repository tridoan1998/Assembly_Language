comment !
03/15/2018
Asks the user to enter a number. Assume that the user 
enters an unsigned integer that is between 1 -10.
Displays the first five multiples of the number 
and save them into an array called arr1.
Askes the user again to enter a number. 
Assume that the user enters an unsigned 
integer that is between       1 - 10.
Displays the first five multiples of 
the number and save them into an array called arr2.
Merges the two arrays into one array 
called arr3. Save the numbers in ascending order.
Displays arr3
!
INCLUDE Irvine32.inc

.data
;create 4 strings to display and 3 arrays to hold datas  
string1 byte "Enter a number in the range 1 - 10: ", 0
string2 byte "The multiples of your number are: ", 0
string3 byte "The new array after merging the two arrays: ", 0
comma byte ", ", 0

array1 dword 5 DUP (?)
array2 dword 5 DUP (?)
array3 dword 5 DUP (?)


.code
main proc

	mov edx, offset string1			; move string1 to edx 
	call writeString				;display string1 
	call readDec					;read in unsigned integer

	push offset array1				; move address of array1 into stack
	push offset array2				;move address of array2 into stack 
	push offset array3				; move address of array3 into stack
	call createArr					;call proceture


	call Crlf						;go own one line
	mov edx, offset string1			; move string1 to edx 
	call writeString				;display string1 
	call readDec					;read in unsigned integer

	call createArr					;call proceture
	call Crlf						;go own one line

	mov edx, offset string3			;set string
	call writeString				;show string

	shl eax, 0						;shift left 0 meaning 2^0
	call writeDec					;show the result 
	mov edx, offset comma			;set string 
	call writeString				;output string

	shl eax, 1						;shift left 0 meaning 2^1
	call writeDec					;show result 
	mov edx, offset comma			;set string
	call writeString				;show string


	call Crlf						;go down one line
exit
main endp



;this proc promt the user to enter input and create an array holding 
;the value and five others number that multiple by the first 
createArr PROC
	push ebp			; push ebp into the stack
	mov ebp, esp		; make ebp point at wheere esp point at 
	push eax			;push eax value into the stack
	push ebx			;pish ebx value into the stack	
	mov eax, [ebp-4]	;make eax = the value that ebp-4 point at
	mov ebx, eax		;ebx = eax
	shl eax, 0			;shift left 0 meaning 2^0
	call writeDec		;show the result 
	mov edx, offset comma	;set string 
	call writeString		;output string


	mov eax, [ebp-4]			;make eax = the value that ebp-4 point at
	mov ebx, eax				;ebx = eax
	shl eax, 1					;shift left 0 meaning 2^1
	call writeDec				;show result 
	mov edx, offset comma		;set string
	call writeString			;show string

	mov eax, [ebp-4]			;make eax = the value that ebp-4 point at
	mov ebx, eax				;ebx = eax
	shl eax, 0					;shift left 0 meaning 2^0
	shl ebx, 1					;shift left 1 meaning 2^1
	add eax, ebx				;eax += ebx
	call writeDec				;show result 
	mov edx, offset comma		;set string
	call writeString			;show string	


	mov eax, [ebp-4]			;make eax = the value that ebp-4 point at
	mov ebx, eax				;ebx = eax
	shl eax, 2					;shift left 2 meaning 2^2
	call writeDec				;show result 
	mov edx, offset comma		;set string
	call writeString			;show string


	mov eax, [ebp-4]	;make eax = the value that ebp-4 point at
	mov ebx, eax		;ebx = eax
	shl eax, 2			;shift left 2 meaning 2^2
	shl ebx, 0			;shift left 0 meaning 2^0
	add eax, ebx		;eax += ebx
	call writeDec		;show result

	
	mov eax, [ebp-4]	;make eax = the value that ebp-4 point at
	pop ebx				;pop ebx back out of the stack
	pop eax				;pop eax back out of the stack
	pop ebp             ;pop ebp back out of the stack
	ret 
createArr ENDP

end main




comment!


Sample run:

Enter a number in the range 1 - 10: 2
2, 4, 6, 8, 10
Enter a number in the range 1 - 10: 3
3, 6, 9, 12, 15
The new array after merging the two arrays: 3, 6,
Press any key to continue . . .
!