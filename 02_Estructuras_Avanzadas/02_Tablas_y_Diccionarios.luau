-- ============================================================================
-- GUÍA Y APUNTES: TABLAS Y DICCIONARIOS EN LUAU (ROBLOX STUDIO)
-- ============================================================================

-- 1. TABLAS BÁSICAS (LISTAS / ARRAYS)
-- Una tabla tipo lista es una secuencia ordenada de valores.
-- ⚠️ REGLA CRÍTICA EN LUAU: Las tablas empiezan a contar desde el índice 1 (NO desde 0).

local inventario = {"Espada", "Escudo", "Poción de Vida", "Antorcha"}

-- Acceder a un elemento mediante su posición (índice):
print("Primer objeto: " .. inventario[1]) -- Imprime: Espada
print("Segundo objeto: " .. inventario[2]) -- Imprime: Escudo

-- Obtener la cantidad total de elementos usando el operador '#':
print("Total de items: " .. #inventario) -- Imprime: 4


-- 2. DICCIONARIOS (CLAVE-VALOR / DICTIONARIES)
-- En lugar de usar índices numéricos (1, 2, 3...), asocias un valor a una 'clave' (key).
-- Se utilizan para guardar datos organizados de un objeto o jugador.

local datosJugador = {
    Nombre = "David",
    Nivel = 10,
    Monedas = 250,
    EstaVivo = true
}

-- Acceder a los datos de un diccionario (2 formas distintas):
print("Nombre: " .. datosJugador.Nombre)        -- Forma estándar usando el punto '.' -> David
print("Monedas: " .. datosJugador["Monedas"])   -- Forma usando corchetes [] -> 250

-- Modificar o añadir nuevos pares clave-valor:
datosJugador.Monedas += 50           -- Incrementa a 300
datosJugador.Rango = "Principiante" -- Crea una nueva clave 'Rango'

-- ⚠️ NOTA: El operador '#' NO funciona en diccionarios. Solo funciona en listas con índices 1, 2, 3...


-- 3. MÉTODOS Y FUNCIONES DE LA LIBRERÍA 'table'

local listaFrutas = {"Manzana", "Pera"}

-- A. table.insert(tabla, elemento): Añade un elemento al final de la lista.
table.insert(listaFrutas, "Plátano") -- Ahora la lista tiene 3 elementos

-- B. table.remove(tabla, indice): Elimina el elemento en la posición dada.
table.remove(listaFrutas, 1) -- Elimina "Manzana" y reordena los índices automáticamente

-- C. table.find(tabla, elemento): Busca un elemento y devuelve su índice. Si no lo halla, devuelve nil.
local posicionPera = table.find(listaFrutas, "Pera")
print("Posición de la Pera: " .. tostring(posicionPera))


-- 4. RECORRER TABLAS CON BUCLES FOR

-- A. Recorrer una Lista (Array) usando ipairs():
-- 'ipairs' respeta el orden numérico exacto desde el 1 hasta el final.
for indice, valor in ipairs(inventario) do
    print("Posición " .. indice .. ": " .. valor)
end

-- B. Recorrer un Diccionario usando pairs():
-- 'pairs' recorre todas las claves sin importar el orden.
for clave, valor in pairs(datosJugador) do
    print(clave .. " -> " .. tostring(valor))
end

--Tips y reglas avanzadas sobre las Tablas en Luau:

El valor por defecto es nil: Si intentas acceder a un índice o clave que no existe (ej. inventario[99]), Luau no romperá el código con un error fatídico; simplemente te devolverá nil.

Diferencia entre ipairs y pairs:

Usa ipairs cuando tengas una lista ordenada numéricamente ({"A", "B", "C"}).

Usa pairs cuando tengas un diccionario con claves de texto ({Vida = 100, Nombre = "David"}).

Matriz / Tablas Anidadas: En Luau puedes meter tablas dentro de otras tablas. Es muy útil en Roblox para inventarios avanzados o coordenadas de mapas.
