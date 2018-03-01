;Tri Doan / 03/01/2018 
comment ! 
A prime number is an integer that is divisible only by 1 and by itself. Write a program that:

Takes a number as an input.
Prints back to the console all the primes that are larger than 1 but not larger than the number that has been entered.
You need to have a procedure called isPrime. You may have more procedures if you like.

This procedure receives a number through one of the registers.
Checks if this number is prime.
Returns back through one of the registers to the main program 1, if the number is prime, 0 otherwise.
!

include Irvine32.inc

.data

;create strings 
enter_string BYTE "Please enter a number: ", 0	
display_result_string BYTE "Primes found until the given number: ", 0

;create variables 
input DWORD	 ?			;keep user input
count DWORD  2			;hold eax, the input
keep_eax   DWORD  ?     ;keep eax 
.code
main proc
	mov edx, offset enter_string	;move string to edx
	call writeString				;cout string

	call readDec					;input number, store in eax

	mov keep_eax, eax 
	inc count 
	mov eax, count 
	call writeDec
	call isPrime					;call isPrime proceture
									;the resule store in ebx
									;1 if prime, 0 if not
	
	mov eax, keep_eax				;put input back to eax

	;this while loop print the numbers <= the input that are prime
	while2:								;check count and input
		cmp count, eax					;compare count and input
		ja outwhile2					;jump out if count above input
		cmp ebx, 1
		jne else1
		mov eax, ecx 
		call writeDec
		inc ecx						;increate count

		jmp while2
	outwhile2:


	else1:



	exit
main endp

isPrime PROC
	mov ebx, eax			;hold count  
	mov ecx, 2				;hold temp

	while1:
		cmp ecx, ebx
		jae outwhile1
	
		mov eax, ebx
		xor edx, edx		;make edx 0
		div	ecx				;edx:eax/ecx
		cmp edx, 0
		jz notPrime			;jump out when 0
		inc ecx				;increate temp
		jmp while1			;jump back to the top
	outwhile1:
		mov ebx, 1			;make ebx 1 if prime
		jmp out1
	notPrime:
		mov ebx, 0			;make ebx 0 if not prime 
	out1:




	ret 
isPrime ENDP





end main

comment

sample run:

Please enter a number: 35

Primes found until the given number:

2 3 5 7 11 13 17 19 23 29 31 Press any key to continue . . .
!



