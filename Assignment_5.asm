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

;create three variables 
count DWORD  ?	;counter variable
input DWORD	 ?  ;keep user input
.code
main proc
	mov edx, offset enter_string	;move string to edx
	call writeString				;cout string

	call readDec					;input number, store in eax
	
	mov input, eax					;
	mov count, 2					;set count equal 2 



	exit
main endp


	isPrime PROC
	mov ecx, eax					;set loop counter
	add ecx, 1						;increate by 1. Start the loop from 2.

	mov counter, 2					;set 2 to counter

	while1:
		cmp ecx, eax
		JNE 

		cmp ecx, 2 
		JNE else1:
		cmp ecx, 3 



		else1:
			




		ret 
	isPrime ENDP





end main

comment

sample run:

Please enter a number: 35

Primes found until the given number:

2 3 5 7 11 13 17 19 23 29 31 Press any key to continue . . .
!