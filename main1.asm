comment !
03/22/2018
Write a program that builds a two-dimensional array using 
the inputs from the userand finds the sum of a selected row.
Your program must do the following:
Ask the user to enter how many elements the array has. The maxSize is 40.
Ask the user to enter how many elements in each row in the array.
Ask the user what type the array is. It could be a byte, word or dword array.
Ask the user to enter the elements of the array.
Ask the user for the row index and display the sum of the selected row.
Your program must have a procedure called calcRowSum PROC that 
calculates the sum of one row 
in the two-dimensional array of bytes, words, 
or doublewords and returns it to main proc.
The header of the proc in C++ is as follows:
int calcRowSum ( int *array, int rowSize, int type, int rowIndex);
For the parameters and the return value use the stack.
!

INCLUDE Irvine32.inc

.data
;create strings
string0 BYTE "The element must be from 1 to 40", 0

string1 BYTE "Enter how many elements in your array: ", 0
string2 BYTE "Enter the row size: ", 0
string3 BYTE "Enter the type of your array.", 0
string4 BYTE " 1 for byte.", 0
string5 BYTE " 2 for word.", 0
string6 BYTE " 4 for doubleword.", 0
string7 BYTE "Enter an element in your array: ", 0
string8 BYTE "Enter row number that you want me to sum: ", 0
string9 BYTE "The sum is: ", 0
string10 BYTE "Wrong input. Please run the program again", 0
 
;create arrays with different size
maxElement = 40
arrayB byte maxElement dup (0)
arrayW word maxElement dup(0)
arrayD dword maxElement dup(0)







;create variables to keep user input
ArrayElement dword  ?			;keep how many elements from user input 
ArrayRow     dword  ?			;keep how many row from user input
ArrayType    dword  ?			;keep what type	from user input
ArrayRowIndex	dword ?			;keep row index


.code	
main proc
sub esp, 4
;make an if else loop to check if maxSize is >= 40
mov edx, offset string1				;move affress string1 into edx
call writeString					;call string1
call readDec						;read input (keep how many elements)
mov ArrayElement, eax				;put input into ArrayElement
cmp eax, 1							;compare eax with 1
jb else1							;jump if below to else1 
cmp eax, 40							;compare input with 40
ja else1							;jump to else1 if above 40
	jmp out1						;jump to otu1 if below or equal 40
else1:								;else1 label
	mov edx, offset string0			;move address string0 into edx 
	call writeString				;call string0
	call Crlf						;go down one line
	exit							;exit the program
out1:								;within out1 we will make the program
	mov edx, offset string2				;move address string3 into edx
	call writeString					;call string
	call readDec						;read in input
	mov ArrayRow, eax					;move ArrayRow = eax
	mov edx, offset string3				;move address string3 to edx
	call writeString					;call string
	call Crlf							;go down one line
	mov edx, offset string4				;move address string4 to edx
	call writeString					;call string
	call Crlf							;go down one line
	mov edx, offset string5				;move address string5 to edx
	call writeString					;call string
	call Crlf							;go down one line
	mov edx, offset string6				;move address string6 to edx
	call writeString					;call string
	call Crlf							;go down one line
	call readDec						;input the type
	mov ArrayType, eax					;move ArrayType = eax


	;now we perform the switch statement to check which array to use
	cmp ArrayType, 1					;check array type with 1
	JE case1							;jump to case3 if equal 
	cmp ArrayType, 2					;check array type with 2
	JE case2							;jump to case3 if equal 
	cmp ArrayType, 4					;check array type with 4
	JE case3							;jump to case3 if equal 
	jmp else2							;jump to else2 label 
	case1:								;case1 label
		mov ecx, ArrayElement			;loop counter
		mov esi, offset arrayB			;make esi points to arrayB
		;the loop uses to input elements for array
		l1:
			mov edx, offset string7		;put string7 into edx
			call writeString			;call string
			call readDec				;user input
			mov [esi], eax				;move element into where esi point at
			add esi, TYPE arrayB		;move to the next array element
			Loop l1
		push offset arrayB				;make esi points to arrayB
		jmp out2


	case2:
			mov ecx, ArrayElement			;loop counter
		mov esi, offset arrayW				;make esi points to arrayB
		;the loop uses to input elements for array
		l2:
			mov edx, offset string7		;put string7 into edx
			call writeString			;call string
			call readDec				;user input
			mov [esi], eax				;move element into where esi point at
			add esi, TYPE arrayW		;move to the next array element
			Loop l2
			push offset arrayW			;make esi point to arrayW
		jmp out2


	case3:
			mov ecx, ArrayElement			;loop counter
		mov esi, offset arrayD			;make esi points to arrayB
		;the loop uses to input elements for array
		l3:
			mov edx, offset string7		;put string7 into edx
			call writeString			;call string
			call readDec				;user input
			mov [esi], eax				;move element into where esi point at
			add esi, TYPE arrayD		;move to the next array element
			Loop l3
			push offset arrayD			;make esi points to arrayD
		jmp out2

else2:									;else2 label
	mov edx, offset string10			;move string10 to edx
	call writeString					;call string
	call Crlf							;go down one line
	exit								;exit
out2:									;out2 label

mov edx, offset string8				;set string to edx
call writeString					;call string
call readInt						;read user input
mov ArrayRowIndex, eax				;keep input in ArrayRowIndex

push ArrayRow						;push into stack
push ArrayType						;push into stack
push ArrayRowIndex					;push i



mov eax, ArrayElement				;move ArrayElement to eax
mov ebx, ArrayRow					;move ArrayRow to ebx
mov ecx, ArrayType					;move ArrayType to ecx
mov edx, ArrayRowIndex				;move ArrayRowIndex to edx

;call calcRowSum						;call procesure



exit
main endp



;calculates the sum of one row in the two-dimensional array of bytes, words,
;or doublewords and returns it to main proc.
;int calcRowSum ( int *array, int rowSize, int type, int rowIndex);
;For the parameters and the return value use the stack.
calcRowSum PROC
	push ebp 
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi






	ret 
calcRowSum ENDP 


end main


comment !
sample run:

Enter how many elements in your array: 6
Enter the row size: 2
Enter the type of your array.
 1 for byte.
 2 for word.
 4 for doubleword.
1
Enter an element in your array, 1
Enter an element in your array, 2
Enter an element in your array, 3
Enter an element in your array, 4
Enter an element in your array, 5
Enter an element in your array, 6
Enter row number that you want me to sum: 0
The sum is: 00000003
Press any key to continue . . .


		mov ecx, ArrayElement
		mov esi, offset arrayB
		l4:
			movzx eax, BYTE ptr [esi]
			call writeDec
			add esi, TYPE arrayB
			call Crlf
			Loop l4
			
!