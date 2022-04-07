.data

print_format:
.string "%d \n"

array:
        .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array_end:

.text
.global main
.type main, @function

main:
	movl $array, %ebx  	

edit:
	movl (%ebx), %eax 
	shl $1, %eax  
	movl %eax, (%ebx) 

	cmpl $array_end, %ebx  
	je new_array 

	addl $4, %ebx 

	movl (%ebx), %eax
	sar $1, %eax  
        movl %eax, (%ebx)


	cmpl $array_end, %ebx 
	je new_array 

	addl $4, %ebx

	jmp edit 




new_array:
	movl $array, %ebx 


print_arr:
	push (%ebx)  
	push $print_format 	
	call printf  	
	addl $8, %esp 

	addl $4, %ebx 
	cmpl $array_end, %ebx 
	jne print_arr 
	ret 
