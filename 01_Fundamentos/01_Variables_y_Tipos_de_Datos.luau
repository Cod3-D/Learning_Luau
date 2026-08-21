-- ============================================================================
-- GUÍA Y APUNTES: VARIABLES Y TIPOS DE DATOS EN LUAU (ROBLOX STUDIO)
-- ============================================================================

-- 1. LA REGLA DE ORO: SIEMPRE USAR 'local'
-- Usar 'local' limita la variable a este script, ahorrando memoria y evitando errores.

local vidaMaxi = 100 -- ✅ Correcto (Variable local)
-- vidaGlobal = 100  -- ❌ Incorrecto (Crea una variable global innecesaria)


-- 2. REGLAS PARA NOMBRAR VARIABLES
-- - No pueden empezar con números.
-- - Sensibles a mayúsculas y minúsculas (Monedas != monedas).
-- - Sin espacios, acentos, 'ñ' o símbolos especiales ($, @, #).
-- - No usar palabras reservadas (local, if, function, end, nil, etc.).

local jugador1 = "David"     -- ✅ Correcto
local nivelJugador = 5     -- ✅ Correcto (camelCase)
local nivel_jugador = 5    -- ✅ Correcto (snake_case)


-- 3. TIPOS DE DATOS PRINCIPALES

-- A. Números (number): Enteros o decimales
local vida: number = 100
local velocidad: number = 16.5
local temperatura: number = -10

-- B. Texto (string): Siempre entre comillas dobles "" o simples ''
local nombre: string = "David"
local rango: string = 'Aventurero'

-- C. Booleanos (boolean): Únicamente true (verdadero) o false (falso)
local estaVivo: boolean = true
local estaEnPausa: boolean = false

-- D. Nulo (nil): Representa ausencia de valor o variable vacía
local herramientaEquipada: string? = nil -- Puede ser un string o estar vacío


-- 4. MODIFICAR VALORES Y ATAJOS DE LUAU (ASIGNACIÓN COMPUESTA)
-- Una vez declarada con 'local', no vuelves a escribir 'local' para cambiar su valor.

local monedas = 50

monedas += 10 -- Suma 10 (Equivale a: monedas = monedas + 10) -> 60
monedas -= 5  -- Resta 5  (Equivale a: monedas = monedas - 5)  -> 55
monedas *= 2  -- Multiplica por 2 -> 110
monedas /= 2  -- Divide entre 2 -> 55
monedas %= 10 -- Obtiene el residuo de la división -> 5


-- 5. IMPRIMIR VALORES EN LA CONSOLA (OUTPUT)
print("Jugador: " .. nombre)
print("Monedas actuales: " .. monedas)
print("¿Está vivo?: " .. tostring(estaVivo))


-- Tips y cosas importantes a tener en cuenta sobre las variables:

Usa la convención camelCase: Por estándar en la comunidad de Roblox, las variables suelen empezar con minúscula y cada palabra nueva con mayúscula (ejemplo: puntosDeExperiencia).

El valor por defecto es nil: Si declaras local energia y no le pones = valor, su valor automático será nil. Intentar hacer operaciones matemáticas con una variable nil provocará un error (Attempt to perform arithmetic on a nil value).

Nombres descriptivos: En lugar de llamar a una variable local x = 100, nómbrala local vidaJugador = 100. Cuando tengas un script largo, te agradecerás a ti mismo entender de inmediato qué hace cada variable.
