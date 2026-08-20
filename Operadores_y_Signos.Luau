-- ============================================================================
-- GUÍA Y APUNTES: OPERADORES Y SIGNOS EN LUAU (ROBLOX STUDIO)
-- ============================================================================

-- 1. OPERADORES ARITMÉTICOS (MATEMÁTICAS BÁSICAS)
-- Se utilizan para realizar cálculos matemáticos entre números.

local suma = 10 + 5        -- Resultado: 15
local resta = 20 - 8       -- Resultado: 12
local multiplicacion = 4 * 3 -- Resultado: 12
local division = 50 / 2    -- Resultado: 25
local potencia = 2 ^ 3     -- Resultado: 8 (2 elevado a la tercera potencia)
local modulo = 10 % 3      -- Resultado: 1 (El residuo de dividir 10 entre 3)


-- 2. OPERADORES DE ASIGNACIÓN COMPUESTA (ATAJOS DE LUAU / ROBLOX)
-- Permiten modificar una variable usando su propio valor actual sin escribir el nombre dos veces.

local vida = 100
vida += 20 -- Suma 20 (Equivale a: vida = vida + 20) -> 120
vida -= 30 -- Resta 30 (Equivale a: vida = vida - 30) -> 90
vida *= 2  -- Multiplica por 2 (Equivale a: vida = vida * 2) -> 180
vida /= 3  -- Divide entre 3 (Equivale a: vida = vida / 3) -> 60
vida %= 50 -- Residuo (Equivale a: vida = vida % 50) -> 10
vida ^= 2  -- Potencia (Equivale a: vida = vida ^ 2) -> 100


-- 3. OPERADORES DE TEXTO (CADENAS DE CARACTERES)
-- Para unir textos o medir su longitud.

local nombre = "David"
local saludo = "Hola " .. nombre -- El punto doble '..' sirve para UNIR (concatenar) textos -> "Hola David"

-- Atajo de concatenación en Luau:
local mensaje = "Nivel: "
mensaje ..= "Avanzado" -- Unir y asignar -> "Nivel: Avanzado"

-- Operador de Longitud (#):
local cantidadLetras = #nombre -- El signo '#' devuelve cuántos caracteres tiene un texto -> 5


-- 4. OPERADORES RELACIONALES (COMPARACIONES)
-- Comparan dos valores y devuelven un booleano (true o false).

local a = 10
local b = 5

local igual = (a == b)       -- Igual a -> false
local diferente = (a ~= b)   -- ⚠️ Diferente de -> true (En Luau NUNCA se usa !=)
local mayor = (a > b)        -- Mayor que -> true
local menor = (a < b)        -- Menor que -> false
local mayorOIgual = (a >= 10) -- Mayor o igual -> true
local menorOIgual = (b <= 3)  -- Menor o igual -> false


-- 5. OPERADORES LÓGICOS (and, or, not)
-- Evalúan condiciones lógicas. Se escriben en texto plano (NO se usan &&, ||, !).

local tieneLlave = true
local tienePase = false

-- 'and': Ambas condiciones DEBEN ser verdaderas para devolver true.
local puedeAbrir = tieneLlave and tienePase -- false

-- 'or': Con que UNA condición sea verdadera devuelve true.
local puedeEntrar = tieneLlave or tienePase -- true

-- 'not': Invierte el valor booleano (true pasa a false, false pasa a true).
local sinLlave = not tieneLlave -- false


-- 6. PRECEDENCIA DE OPERADORES (ORDEN DE EJECUCIÓN)
-- Luau resuelve los signos en un orden específico (puedes usar paréntesis para forzar el orden):
-- 1. Paréntesis ()
-- 2. Potencia (^)
-- 3. Negación lógica (not), Longitud (#)
-- 4. Multiplicación (*), División (/), Módulo (%)
-- 5. Suma (+), Resta (-)
-- 6. Concatenación (..)
-- 7. Comparaciones (==, ~=, <, >, <=, >=)
-- 8. Operadores lógicos (and, or)

local calculo = (5 + 3) * 2 -- Da 16 (Primero suma el paréntesis y luego multiplica)

--Tips y cosas importantes a tener en cuenta sobre operadores y signos:

Atención con el signo de diferencia ~=: El error más común al venir de otros lenguajes o intentar adivinar es escribir !=. Si usas != en Roblox Studio, te dará un error de sintaxis de inmediato.

Concatenar con números: Puedes unir texto y números con .. (por ejemplo: "Puntos: " .. 100). Luau convertirá automáticamente el número a texto para que no falle.

El operador # también mide tablas: No solo sirve para saber la longitud de un texto (#"Hola" = 4), también sirve para saber cuántos elementos hay dentro de una lista o tabla.

No intentes sumar texto con +: Si haces "Hola" + "Mundo", Luau fallará intentando convertir las palabras a números. La única forma de unir cadenas es con ..
