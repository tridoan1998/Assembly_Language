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
	call Crlf						;go down one line
	call readDec					;read in unsigned integer

	push offset array1
	push offset array2
	push offset array3 
	call createArr


exit
main endp



;this proc promt the user to enter input and create an array holding 

createArr PROC
	push ebp 
	mov ebp, esp
	push eax
	push ebx	

	mov eax, [ebp-4]
	mov ebx, eax

	shl eax, 0
	call writeDec
	call Crlf


	mov eax, [ebp-4]
	mov ebx, eax
	shl eax, 1
	call writeDec
	call Crlf

	mov eax, [ebp-4]
	mov ebx, eax
	shl eax, 0
	shl ebx, 1
	add eax, ebx
	call writeDec
	call Crlf

	mov eax, [ebp-4]
	mov ebx, eax
	shl eax, 2
	call writeDec
	call Crlf

	mov eax, [ebp-4]
	mov ebx, eax
	shl eax, 2
	shl ebx, 0
	add eax, ebx
	call writeDec
	call Crlf

	pop ebx 
	pop eax 
	pop ebp
	ret 
createArr ENDP

end main




comment!


Sample run:

Enter a number in the range 1 – 10: 5

The multiples of your number are:

5, 10, 15, 20, 25

Enter a number in the range 1 – 10: 7

The multiples of your number are:

7, 14, 21, 28, 35

The new array after merging the two arrays: 5, 7, 10, 14, 15, 20, 21, 25, 28, 35

!