-- ============================================================================
-- GUÍA Y APUNTES: ESTRUCTURA CORRECTA, REGLAS DEL 'end' E INDENTACIÓN EN LUAU
-- ============================================================================

-- 1. LA REGLA VISUAL DEL "ABRE Y CIERRA"
-- En Luau, cada estructura de código funciona como abrir y cerrar un contenedor.
-- Palabras que ABREN un bloque: 'function', 'if' (con 'then'), 'for' (con 'do'), 'while' (con 'do').
-- Palabra que CIERRA un bloque: 'end'.
-- Regla de oro: Por cada palabra de apertura que escribas, DEBE existir un 'end' correspondiente.

local vida = 100

-- Ejemplo de apertura y cierre simple:
if vida == 100 then
    print("La vida está al máximo")
end -- Cierra el bloque del 'if'


-- 2. REGLA DE INDENTACIÓN (SANGRÍA / TECLA TAB)
-- Cada vez que abres un bloque (después de 'then', 'do' o de declarar una 'function'),
-- todo el código que escribas adentro va UN TAB HACIA LA DERECHA.
-- Cuando terminas las instrucciones y escribes el 'end', este debe regresar HACIA LA IZQUIERDA
-- y quedar alineado exactamente a la misma altura de la palabra que abrió el bloque.

local function saludarJugador()
    -- (Avanzamos un TAB a la derecha)
    local mensaje = "¡Bienvenido al juego!"
    print(mensaje)
end -- (Regresamos a la izquierda, alineado con 'local function')


-- 3. CÓMO METER BLOQUES DENTRO DE OTROS BLOQUES (ESTRUCTURAS ANIDADAS)
-- Cuando colocas un 'if' dentro de una 'function', estás abriendo múltiples contenedores.
-- Regla de orden: EL ÚLTIMO BLOQUE QUE ABRES ES EL PRIMERO QUE DEBES CERRAR.
-- Funciona como una pila de platos: cierras desde el bloque más interno hacia el más externo.

local function verificarAcceso(jugadorVivo: boolean, tieneLlave: boolean)
    -- Nivel 0 (Orilla izquierda): Abre la Función (Bloque 1)
    
    if jugadorVivo then
        -- Nivel 1 (1 TAB a la derecha): Abre el Primer 'if' (Bloque 2)
        
        if tieneLlave then
            -- Nivel 2 (2 TABs a la derecha): Abre el Segundo 'if' (Bloque 3)
            print("El jugador abrió la puerta.")
        end -- Nivel 1: Cierra el Bloque 3 (Alineado con el segundo 'if')
        
    end -- Nivel 0 (1 TAB): Cierra el Bloque 2 (Alineado con el primer 'if')
    
end -- Orilla izquierda: Cierra el Bloque 1 (Alineado con 'local function')


-- 4. LA PRUEBA DE LA "LÍNEA VERTICAL" PARA COMPROBAR TU CÓDIGO
-- Para saber si tu código está bien escrito sin ejecutarlo, traza una línea recta imaginaria
-- hacia abajo desde la letra inicial de la palabra que abrió el bloque:
-- - Baja en línea recta desde la 'f' de 'function' -> Debe chocar con la 'e' de su 'end'.
-- - Baja en línea recta desde la 'i' de 'if' -> Debe chocar con la 'e' de su 'end'.
-- - Baja en línea recta desde la 'f' de 'for' o 'w' de 'while' -> Debe chocar con la 'e' de su 'end'.


-- 5. LA ÚNICA EXCEPCIÓN A LA REGLA DEL 'end': EL BUCLE 'REPEAT'
-- El bucle 'repeat' es la única estructura en Luau que NO utiliza la palabra 'end'.
-- Se abre con 'repeat' y se cierra obligatoriamente con la palabra 'until'.

local contador = 0

repeat
    contador += 1
    print("Contando: " .. contador)
until contador == 3 -- Cierra el bucle 'repeat' cuando la condición es verdadera


-- 6. NORMAS DE ESTILO PARA ESCRIBIR CÓDIGO LIMPIO Y PROFESIONAL
-- - Espaciado legible: Deja un espacio antes y después de los operadores (vida = 100, NO vida=100).
-- - Uso de camelCase: Las variables y funciones empiezan con minúscula y las palabras nuevas con mayúscula (ejemplo: 'velocidadMaxima').
-- - Sin punto y coma: En Luau NO se coloca ';' al final de cada línea. Solo presionas ENTER para ir abajo.
-- - Comentarios explicativos: Utiliza '--' para escribir notas en español sobre lo que hace tu código.
