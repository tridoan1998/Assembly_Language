;Tri Doan / 03/01/2018 
comment ! 
Objective:A prime number is an integer that is divisible only by 1 and by itself. Write a program that:
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
string BYTE "Primes found until the given number: ", 0
space BYTE " ", 0

;create variables 
input DWORD			?			;keep user input
count DWORD			2			;hold eax, the input

.code
main proc
	mov edx, offset enter_string	;move string to edx
	call writeString				;cout string
	call readDec					;input number, store in eax
	

	mov edx, offset string			;move string into edx
	call writeString				;cout string

	call Crlf 
	mov esi, eax					;esi hold the input 
	mov edx, offset space			;move string to edx 
	mov ecx, count					;move count to ecx
	
	;this while2 loop check count varible if it <= input 
	;while count is <= and it's prime, we print out the count 
	;if not, we increate count and continue the loop
	while2:
		cmp ecx, esi				;move esi, the input, into ecx
		jae outwhile2				;jump out if ecx above equal to esi
		mov eax, ecx				;
		call isPrime					;call isPrime proceture
		cmp ebx, 1
		jne out3
		mov eax, ecx
		call writeDec
		call writeString
		out3:
		inc ecx

		jmp while2

		outwhile2:
 
	exit
main endp

;isPrime take in the  input, eax, and then check 
;if the input is prime, return ebx = 1
;if not, return ebx = 0
isPrime PROC
push ecx					;keep ecx value in the stack
push edx					;keep edx value in the stack

	mov ebx, eax			;hold input  
	mov ecx, 2				;hold temp(counter)

	;while1 loop to check the input with counter ecx = 2
	;perform the division eax/ecx 
	while1:
		cmp ecx, ebx		;compare counter with input
		jae outwhile1		;jump out if above or equal 
	
		mov eax, ebx		;
		xor edx, edx		;make edx 0
		div	ecx				;edx:eax/ecx
		cmp edx, 0
		jz notPrime			;jump out to notPrime if remainder is 0
		inc ecx				;increate temp
		jmp while1			;jump back to the top
	outwhile1:
		mov ebx, 1			;make ebx 1 if prime
		jmp out1
	notPrime:
		mov ebx, 0			;make ebx 0 if not prime 
	out1:

pop edx
pop ecx

	ret 
isPrime ENDP





end main

comment

sample run:

Please enter a number: 35
Primes found until the given number:
2 3 5 7 11 13 17 19 23 29 31 Press any key to continue . . .

!



