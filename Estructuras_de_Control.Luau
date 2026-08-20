-- ============================================================================
-- GUÍA Y APUNTES: ESTRUCTURAS DE CONTROL EN LUAU (ROBLOX STUDIO)
-- ============================================================================

-- 1. CONDICIONALES (IF, THEN, ELSEIF, ELSE, END)
-- Permiten tomar decisiones en el juego según si una condición es true o false.

local vida = 75
local tieneEscudo = true

if vida >= 100 then
    print("El jugador tiene la vida al máximo.")
elseif vida > 50 and tieneEscudo then
    -- 'elseif' permite evaluar una segunda condición si la primera fue falsa.
    print("El jugador está herido pero protegido por el escudo.")
elseif vida > 0 then
    print("El jugador tiene vida baja.")
else
    -- 'else' se ejecuta si NINGUNA de las condiciones anteriores se cumplió.
    print("El jugador ha sido eliminado.")
end


-- 2. EVALUACIÓN DE VERDAD EN LUAU (REGLA FUNDAMENTAL)
-- En Luau, ÚNICAMENTE 'false' y 'nil' se evalúan como falso.
-- ¡CUIDADO!: El número 0 y el texto vacío "" CUENTAN COMO VERDADERO (true).

local monedas = 0

if monedas then
    -- Esto SÍ se ejecuta en Luau porque 0 es considerado 'true'.
    print("Esta línea se imprimirá aunque monedas sea 0.")
end


-- 3. EXPRESIÓN IF EN UNA SOLA LÍNEA (TERNARIO DE LUAU)
-- Permite asignar un valor a una variable dependiendo de una condición.

local velocidadBase = 16
local estaCorriendo = true

-- Sintaxis: if <condicion> then <valor1> else <valor2>
local velocidadFinal = if estaCorriendo then velocidadBase * 2 else velocidadBase
-- velocidadFinal ahora vale 32.


-- 4. BUCLE 'FOR' NUMÉRICO (REPETICIONES CONTROLADAS)
-- Sintaxis: for variable = inicio, fin, incremento do ... end
-- Nota: Si no especificas el incremento, Luau asumirá automáticamente que es 1.

-- Ejemplo 1: Conteo del 1 al 5
for i = 1, 5, 1 do
    print("Conteo ascendente: " .. i)
end

-- Ejemplo 2: Conteo regresivo del 10 al 0 de 2 en 2
for i = 10, 0, -2 do
    print("Conteo regresivo: " .. i)
end


-- 5. BUCLE 'WHILE' (SE EJECUTA MIENTRAS SEA VERDADERO)
-- Se repite indefinidamente MIENTRAS la condición evaluada continúe siendo 'true'.

local contador = 0

while contador < 3 do
    contador += 1
    print("Bucle While iteración: " .. contador)
end


-- 6. BUCLE 'REPEAT...UNTIL' (SE EJECUTA HASTA QUE SEA VERDADERO)
-- A diferencia de 'while', este bucle SIEMPRE ejecuta el código al menos una vez
-- antes de revisar la condición al final.

local energia = 0

repeat
    energia += 10
    print("Cargando energía: " .. energia)
until energia >= 30 -- Se detiene cuando energía sea mayor o igual a 30.


-- 7. CONTROL DE BUCLES: 'BREAK' Y 'CONTINUE'

-- 'continue' (Exclusivo de Luau / Roblox): Saltará la repetición actual y pasará a la siguiente.
for i = 1, 5 do
    if i == 3 then
        continue -- Se salta el número 3 y no imprime la línea de abajo.
    end
    print("Número procesado: " .. i)
end

-- 'break': Detiene y rompe el bucle por completo de forma inmediata.
local tiempoDeEspera = 0

while true do -- Bucle infinito
    tiempoDeEspera += 1
    if tiempoDeEspera >= 5 then
        print("Límite alcanzado, saliendo del bucle.")
        break -- Cancela el bucle 'while true'
    end
end

--Tips y reglas avanzadas que debes conocer sobre estructuras de control:

Cierre obligatorio de bloques: Toda estructura (if, for, while) requiere su palabra de apertura (then o do) y siempre debe cerrarse con la palabra end (a excepción de repeat...until que cierra con until).

Peligro con los Bucles Infinitos: En Roblox Studio, si haces un bucle while true do sin colocar un descanso como task.wait() o una condición de salida con break, el juego se congelará por completo.

El atajo continue: Recuerda que en el Lua clásico no existe continue. Esta es una norma y ventaja exclusiva del lenguaje Luau de Roblox.
