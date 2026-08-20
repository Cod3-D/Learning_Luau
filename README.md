# Learning_-Luau-
# Mis apuntes de Luau
                                                           #Reglas de Luau 


1)Reglas de Sintaxis Básica:

*Sensible a Mayúsculas y Minúsculas (Case-Sensitive): Jugador, jugador y JUGADOR son variables totalmente distintas.

*Nombres de Identificadores (Variables y Funciones):

*Solo pueden contener letras, números y guiones bajos (_).

*Jamás pueden iniciar con un número (ejemplo válido: jugador1; inválido: 1jugador).

*No pueden usar caracteres especiales ($, @, ñ, acentos, etc.).

*No pueden usar palabras reservadas del lenguaje para nombrar alguna variable o funcion (local, function, if, end, then, else, while, return, nil, true, false, and, or, not, etc.).

*Punto y coma opcional: No es necesario colocar ; al final de cada línea de código (Solamente usarlo si decides escribir varias órdenes juntas sin dar un salto de línea, el punto y coma le ayuda a Luau a saber exactamente dónde termina una instrucción y dónde empieza la otra).

2)Variables y Alcance (Scope):

*Regla de Alcance Local: Siempre debes declarar las variables con la palabra clave local (ejemplo: local vida = 100). Si no usas local, Luau la creará como una variable global, lo cual impacta negativamente el rendimiento y genera errores de organización.

*Inicialización por defecto: Toda variable declarada que no reciba un valor explícito almacenará automáticamente nil.

3)Manejo de Tipos de Datos y Valores:

Evaluación de Booleanos (Verdadero/Falso):

   *En Luau, únicamente false y nil se consideran falsos.

   *El número 0 y los textos vacíos "" son evaluados como verdaderos (true) en las condiciones (if).

*Arrays indexados desde 1: A diferencia de la mayoría de los lenguajes de programación que empiezan a contar listas/arrays desde la posición 0, en Luau las listas y tablas empiezan tradicionalmente en el índice 1.

4)Estructura del Código:

Comentarios:

*Una sola línea: -- Comentario

*Bloques multilínea: --[[ Comentario de varias líneas ]]

*Bloques delimitados por palabras: Luau no utiliza llaves {} para abrir y cerrar bloques de código (como C++ o C#). Los bloques de function, if, for y while siempre se cierran explícitamente con la palabra end.
