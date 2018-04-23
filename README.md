# SchemeBasicCalculator

Introducción

El presente trabajo, es un proyecto programado, el cual pretende ampliar los conocimientos en los diferentes paradigmas de programación. En este caso específico en la programación funcional como lo es el language Scheme. Por ende se ha recomendado por parte del profesor a utilizar el editor DrRacket.
El Proyecto, se debe llevar a cabo en grupos de no más de dos personas. Para mi caso en particular, lo hare solo, pues me es díficil ponerme de acuerdo con algún compañero.
Objetivo General

Investigar sobre el lenguaje de programación Scheme, buscando en diferentes fuentes, para poder realizar una calculadora gráfica, con diferentes funcionalidades.
Objetivos Específicos

Crear una interfaz gráfica, con los diferentes components de Scheme, para que tenga un nivel de usabilidad aceptable por el usuario.
Utilizar las diferentes funciones íntrinsecas de Scheme, para poder llegar solucionar problema.
Ejecutar los conocimientos y prácticas adquiridos en clases, para poder lograr una solución óptima, tanto gráfica como funcional del problema.
Alcances de la investigación

Para esta investigación, se requirios la instalación de DrRacket en mi computadora personal y la de mi trabajo. Además se debió realizar una investigación exhaustiva del lenguaje de programación funcional scheme, en diferentes fuentes de internet (http://racket-lang.org/, s.f.). Debo rescatar que los ejemplos y las ayudas brindadas por el profesor fueron de gran ayuda, para poder llevar a cabo con éxito este proyecto.


Limitaciones

Dentro de las limitaciones del proyecto, puedo mencionar las siguientes:

La funcionalidad del botón “%” no se pudó implementar, por lo que se dejó el mismo, deshabilitado.
El evento del botón <-, solo elimina un carácter. Si se vuelve a digitar otro carácter, y se vuelve a presionar lo elimina.
El campo de texto pone un “0”, cuando se realiza una operación básica, por ejemplo, “1” “+”, después presionar estos botones, el cuadro muestra un “0”, aunque no genera ningún problema en la funcionalidad de la calculadora, considero importante mencionarlo entre sus limitaciones.

Desarrollo

Principales métodos:
Aunque la mayor parte de la funcionalidad fue brindad por el profesor, debo reseñar, que para hacer ciertas modificaciones, tuve que recorrer y entender el código a fondo. Y a pesar de que no lo entendí 100%, creo que maneje un nivel aceptable, para poder realizarlo, a continuación detallo algunos métodos sencillos realizados por mí y otros modificados:
_______________________________________________________________

(define (limpiarvariables)
(set! result 0)
(set! value 0)
(set! num1 0)
(set! num2 0)
(set! oper 0)
(set! bande 0)
(send etiqueta set-value "")
)


Lo que realiza este método es prácticamente la funcionalidad del botón “C”, el cual se encarga se borrar todo lo que tiene en memoria. Es decir, lo que hace es dejar todo en cero.
_______________________________________________________________
(define (botonce)
(set! num2 0)
(send etiqueta set-value "")
)
Cumple la misma función de “limpiarvariables”, solo que este lo hace para el num2 y la etiqueta. El valor de num1 queda en memoria, por si desea realizar una operación con el.

_______________________________________________________________

(define (makeOperation2 value ope)
(set! oper ope)
(set! num1 (string->number value))
(doOperation))
Este método se reescribio, con el fin de que lo utilicen las funciones íntrisecas de Scheme, como lo es TAN, SIN, COS, entre otros.
Lo demás está debidamente documentado en el .rkt

Mejoras:

Dentro de las mejoras que se le pueden realizar al proyecto, esta la implementación de los parentésis. Y mejorar las limitaciones de la aplicación.


Conclusiones

Consideró que la codificación en un lenguaje funcional como Scheme, es sumamente corto. Sin embargo es un poco más díficil de programar, por el hecho de que no estoy acostumbrado.
El proyecto tuvó colaboración de dos ejemplo proporcionados por el profesor. Sin esto, hubiera durado más de lo previsto, para terminarlo.
Scheme como lenguaje de programación, requiere mucho más concentración y atención para poder entenderlo y programarlo, que cualquier otro lenguaje que haya utilizado.
No se si algún día en la vida real, llegué a utilizar Scheme, pero por lo menos aprendí un poco de programación funcional.
Este proyecto, será compartido en mi blogger personal, este para fines educativos.
Definitivamente trabajé mejor solo. Sin embargo con un compañero de programación conocido, es probable que no haya tenido que pedir ayuda y la entrega del mismo hubiera sido más expedita.

Glosario

DrRacket: Entorno de desarrollo, para Lisp y Scheme
Bibliografía

http://racket-lang.org/
