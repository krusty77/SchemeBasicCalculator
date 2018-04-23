;Proyecto #1 Paradigmas de Programación
;Krusty
(require racket/gui/base)
; Creación de Frame
(define frame (new frame%
                   [label "Proyecto #1 - Krusty"]
                   [width 200][height 200]
                   [x 400][y 200]))

;Barra de Menú
(define barra-menu (new menu-bar% [parent frame]))

(let ([m (new menu% 
              [parent barra-menu]
              [label "&Archivo"])])
  (new menu-item%
       [parent m]
       [label "&Acerca"]
       [callback (lambda (b e) (message-box "|m|" "Desarrollado por Eduardo Sequeira H. |m|" frame))])
  (new menu-item%
       [parent m]
       [label "&Salir"]
       [callback (lambda (b e)(send frame show #f) )])
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define factorial
  (lambda (n)
    (if (= n 0) 1
        (* n (factorial (- n 1))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Texto Inicial
(define msg (new message% [parent frame]
                          [label "Calculadora en Scheme - Paradigmas"]))

;esto es un textfield
;Primero defino un método llamado etiqueta que me instancie un textfield
;le pongo una etiqueta y un valor inicial que lo voy a dejar de momento nulo
(define etiqueta (new text-field% [parent frame]
                                  [label "|m|"]
                                  [init-value ""]
                                  [callback void]))

;llamado al método para que se ejecute y se muestre
etiqueta


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Definición de variables globales, agarradas del ejemplo del profesor dado en clase:
(define value   0) ; value of text
(define num1    0) ; value 1
(define num2    0) ; value 2
(define result  0) ; value 2
(define oper    0) ; operation
(define bande   0) ; empty string – used below
(define bande1   1)
(define textoCalculadora   "") ; texto que aparece en el input
(string? textoCalculadora)

;les podría cambiar el nombre con un find and replace, pero lo sentiría
;muy poco sincero de mi parte
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(- 4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Como Scheme no maneja(al menos que yo sepa) Layouts predeterminados como los de Java(FlowLayout, GridLayout, etc, etc)
;Hay que crear un panel, por cada línea de botones.
;Los eventos de los botones se manejan en la misma declaración
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (define panel (new horizontal-panel% [parent frame];Si hubiera querido, defino el panel vertical, pero me ubico más con horizontal            
[alignment '(center center)]));hay que ver que el parámetro parent es para agregarlo a un contenedor, para mi caso en específico es un Frame
; Fila 1
;De momento todas las filas de botones, van a mostrar su valor de etiqueta en el text-field
(new button% [parent panel] [label "√"]
[callback (lambda (button event) ;así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  8) ;Raíz
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "+-"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  18) ;+-
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "C"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (limpiarvariables))])
(new button% [parent panel] [label "CE"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (botonce))])
(new button% [parent panel] [label "<-"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (eliminarultimo))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label ")"][enabled #f]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (send etiqueta set-value ")"))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "("][enabled #f]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (send etiqueta set-value "("))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "ln"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  10) ;logaritmo
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(when (system-position-ok-before-cancel?)
(send panel change-children reverse))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define panel (new horizontal-panel% [parent frame]
[alignment '(center center)]))
; Fila 2
(new button% [parent panel] [label "%"][enabled #f]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (send etiqueta set-value "%"))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "/"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  4) ;logaritmo
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "9"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "9")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "8"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "8")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "7"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "7")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "n!"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  12) ;factorial
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "x^2"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  9) ;cuadrado
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "sin"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  5) ;seno
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(when (system-position-ok-before-cancel?)
(send panel change-children reverse))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define panel (new horizontal-panel% [parent frame]
[alignment '(center center)]))
;  Fila 3
(new button% [parent panel] [label "1/x"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  11) ;1/x
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "*"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  3) ;multiplicación
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "6"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "6")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "5"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "5")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "4"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "4")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label ""][enabled #f]);desbilito este botón, solo lo puse, para tener un mejor orden
(new button% [parent panel] [label "x^y"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  15) ;x^y
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "cos"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  6) ;coseno
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(when (system-position-ok-before-cancel?)
(send panel change-children reverse))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define panel (new horizontal-panel% [parent frame]
[alignment '(center center)]))
;  Fila 4
(new button% [parent panel] [label "-"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  2) ;seno
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label ""][enabled #f]);desabilito este botón, solo lo puse, para tener un mejor orden
(new button% [parent panel] [label "3"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "3")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "2"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "2")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "1"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "1")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "x^3"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  13) ;cubo
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "tan"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  7) ;tangente
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "pi"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (send etiqueta ;a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
                               set-value (number->string pi)))]);(number->string pi) es un casteo de numero a string
(when (system-position-ok-before-cancel?);
(send panel change-children reverse))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define panel (new horizontal-panel% [parent frame]
[alignment '(center center)]))
;  Fila 5
(new button% [parent panel] [label "="]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value)); <-- esta linea se agrego
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "+"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  1) ;tangente
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "."]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value ".")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "0"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (concatenarTexto value "0")
                         (send etiqueta set-value (string-upcase  textoCalculadora)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "10x"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  17) ;tangente
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "log"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (send etiqueta set-value "log"))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "Mod"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  14) ;tangente
                         (makeOperation value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(new button% [parent panel] [label "Exp"]
[callback (lambda (button event);así se define la madre para mandarla un evento
                         (set! value (send etiqueta get-value))
                         (set! oper  16) ;tangente
                         (makeOperation2 value oper)
                         (send etiqueta set-value (number->string result)))]);a la etiqueta, que en realidad es el text-field, le digo que le imprima el valor que le digo
(when (system-position-ok-before-cancel?)
(send panel change-children reverse))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;Este método va a ser llamado en la ejecución del evento del botón CE, limpia todo para que no existan problemas
;ni pulgas a la hora de realizar operaciones

(define (limpiarvariables)
     (set! result 0)
     (set! value  0)
     (set! num1   0)
     (set! num2   0)
     (set! oper   0)
     (set! bande  0)
     (send etiqueta set-value "")
  )


(define (botonce)
  (set! num2   0)
  (send etiqueta set-value "")
  )
;Este otro método en teoría deberia ser la funcionalidad del botón <-

(define (eliminarultimo)
  (send etiqueta set-value (substring textoCalculadora 0 (- (string-length textoCalculadora) 1)))
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;Métodos de ejemplo brindado por el profesor, modificados para fines del proyecto
(define (makeOperation value ope)
  (cond
    ((= bande 1) 
          (set! bande 0)
          (set! num2  (string->number value))
          (doOperation)
    )
    (else 
           (set! bande 1)
           (set! oper  ope)(set! textoCalculadora "")
           (send etiqueta set-value "")
           (set! num1  (string->number value))
           (set! result 0)
           ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (makeOperation2 value ope)
  (set! oper  ope)
  (set! num1  (string->number value))
  (doOperation))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (concatenarTexto txtActual txtNuevo)
  (set! textoCalculadora (string-append txtActual txtNuevo))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (doOperation)
  (cond
    ((= oper 1) 
          (set! result (+ num1 num2))
    )
    ((= oper 2) 
          (set! result (- num1 num2))
    )
    ((= oper 3) 
          (set! result (* num1 num2))
    )
    ((= oper 4) 
          (set! result (/ num1 num2))
    )
    ((= oper 5) 
          (set! result (sin num1))
    )
    ((= oper 6) 
          (set! result (cos num1))
    )
    ((= oper 7) 
          (set! result (tan num1))
    )    
    ((= oper 8) 
          (set! result (sqrt num1))
    )    
    ((= oper 9) 
          (set! result (* num1 num1))
    )    
    ((= oper 10) 
          (set! result (log num1))
    )    
    ((= oper 11) 
          (set! result (/ 1 num1))
    )    
    ((= oper 12) 
          (set! result (factorial num1))
    )    
    ((= oper 13) 
          (set! result (* num1 num1 num1))
    )
    ((= oper 14) 
          (set! result (modulo num1 num2))
    )
    ((= oper 15) 
          (set! result (expt num1 num2))
    )
    ((= oper 16) 
          (set! result (expt e num1))
    )
    ((= oper 17) 
          (set! result (expt 10 num1))
    )
    ((= oper 18) 
          (set! result (* (- num1)))
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


; Este mae corre la bomba
(send frame show #t)