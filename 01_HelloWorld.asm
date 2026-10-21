; Script Hello World Assembly

.286    ; Conjunto de instrucciones del procesador 80286
; Este es un comentario

; Segmento de Pila
pila segment stack

    db 32 DUP('stack--')

pila ends

; Segmento de Datos
datos segment

    letrero db 'Hola Mundo', '$'

datos ends

;Segmento de Código
codigo segment 'code'

    main proc FAR

        ; Indicar los segmentos
        assume ss:pila, ds:datos, cs:codigo

        ; Ingresa a la pila el Segmento de Datos
        push ds
        push 0

        mov ax, datos
        mov ds, ax

        ; Inicia la lógica del programa
        mov ah, 09h
        ; mov dx, offset letrero  ; 1era Opción
        lea dx, letrero         ; 2da Opción
        int 21h

        ; Termina el programa
        mov ah, 4ch
        int 21h

        ret

    main endp

codigo ends

end main