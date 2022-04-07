.data

hello_world:
        .string "Hello world\n"


.text
.globl main
.type main, @function

main:
	push $hello_world			
	call printf			

	addl $4, %esp	
	ret 			
