.data /* Объявление сегмента данных */

/* Переменная типа string */
print_format:
.string "%d \n"

/* Переменная типа int(long) занимает 4ре байта */
array:
        .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
array_end:
/* Конец массива */

/* Объявляем сегмент кода */
.text
/* Программа начинается с функции main */
.global main
/* Объявляем, что main это функция */
.type main, @function

/* Описание main */
main:
	/* Кладем указателя (адрес) на начало массива в регистр %ebx */
	movl $array, %ebx  	

edit:
	/* Кладем в eax значение ebx */
	movl (%ebx), %eax 
	/* Логический сдвиг влево на одну ячейку у значения eax*/
	shl $1, %eax
	/* Обновление значения на которое ссылается ebx  */
	movl %eax, (%ebx) 
	
	/* Сравниваем адрес конца массива с адресом ebx */
	cmpl $array_end, %ebx  
	/* Если array_end === ebx, то массив проитерирован */
	je new_array 

	/* Переходим к след ячейке памяти */
	addl $4, %ebx 

	movl (%ebx), %eax
	/* Арифметический сдвиг вправо */
	sar $1, %eax
        movl %eax, (%ebx)


	cmpl $array_end, %ebx 
	je new_array 

	addl $4, %ebx
	
	/* Безусловный переход в начало */
	jmp edit 




new_array:
	movl $array, %ebx 


print_arr:
	/* Кладем в стек значение в ebx */
	push (%ebx)  
	/* Кладем в стек переменную */
	push $print_format 
	/* Передаем управление системной функции printf - все что есть в стеке выведет на экран */
	call printf
	/* ESP - регистр отвечающий за стек */
	addl $8, %esp 
	
	/* По регистру ebx идем к след значению массива */
	addl $4, %ebx 
	cmpl $array_end, %ebx 
	jne print_arr 
	/* Возвращаем управление себе и завершаем программу */
	ret 
