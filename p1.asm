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
	cmp [contador],10 ; Compara contador=10
	je salir; Si contador = 10, se va a la etiqueta salir

	;Potencia
	mov al, [contador] ; Pasa valor de contador a al
	mov bl, [contador] ; Pasa valor de contador a bl
	mul bl	; al = al*bl
	mov [tmp], al ; Pasa valor de al a una variable temporal


	;Segunda parte
	mov al, [contador] ; Pasa valor de contador a al
	mov bl, 3	; bl = 3
	mul bl	; al = al * bl(3)
	mov bl, al; bl = al
	mov al, 2;	al = 2
	div bl	;al= al/bl
	mov [tmp1], al; Pasa valor de al a otra variable temporal 

	;Suma +10
	mov [tmp2], 10	; A una tercera variable temporal, se le asigna el valor 10

	add dl, [tmp]	; Se agrega el valor de tmp(Potencia) a dl
	add dl, [tmp1]	; Se agrega el valor de tmp1(Parte 2) a dl
	add dl, [tmp2]	; Se le agrega el valor de tmp2(Suma +10) a dl

	; POR LO TANTO dl = tmp + tmp1 + tmp2

	add dl,30h ; Se agregan 30 en valor hexadecimal para tratar de sacar el valor verdadero en hexa
	
	;Impresion
	mov ah,02h
	int 21h

	inc [contador]; Incrementa el contador en 1 (contador++)
jmp ciclo ; Salta al ciclo de nuevo



salir:  			;Inicia etiqueta salir
	mov ah,4Ch
	int 21h
	end ciclo
	.exit

