title "Proyecto 1 Estructura y Programacion de Computadoras"
	ideal;
	model small;
	stack 64;
	dataseg;

contador	db	0; 
resultadoTotal	db	0;
tmp	db	0;
tmp1 db  0;
tmp2 db 0;
msj db 13,10,'Suma: ','$'

	codeseg;
	
ciclo:				;Etiqueta donde estará nuestro ciclo
	mov ax, @data
	mov ds, ax	
	cmp [contador],10
	
	je salir;

	;Potencia
	mov al, [contador] 
	mov bl, [contador]
	mul bl
	mov [tmp], al


	;Segunda parte
	mov al, [contador]
	mov bl, 3
	mul bl
	mov bl, al
	mov al, 2
	div bl
	mov [tmp1], al

	;Suma +10
	mov [tmp2], 10

	add dl, [tmp]
	add dl, [tmp1]	
	add dl, [tmp2]

	add dl,30h
	mov ah,02h
	int 21h

	inc [contador]
jmp ciclo



salir:  			;Inicia etiqueta salir
	mov ah,4Ch
	int 21h
	end ciclo
	.exit

