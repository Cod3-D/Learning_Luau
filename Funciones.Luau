-- ============================================================================
-- GUÍA Y APUNTES: FUNCIONES EN LUAU (ROBLOX STUDIO)
-- ============================================================================

-- 1. DECLARACIÓN BÁSICA DE UNA FUNCIÓN
-- Una función es un bloque de código reutilizable que realiza una tarea específica.
-- Siempre se recomienda declararlas como 'local'.

local function saludar()
    print("¡Hola! Bienvenido a Roblox Studio.")
end

-- Para ejecutar la función, se escribe su nombre seguido de paréntesis ():
saludar()


-- 2. PARÁMETROS Y ARGUMENTOS
-- Las funciones pueden recibir datos de entrada (parámetros) para trabajar con ellos.

local function calcularDanio(vidaActual: number, cantidadDanio: number)
    local nuevaVida = vidaActual - cantidadDanio
    print("Vida restante: " .. nuevaVida)
end

-- Llamada a la función pasando argumentos:
calcularDanio(100, 25) -- Imprime: Vida restante: 75


-- 3. VALORES DE RETORNO (RETURN)
-- Una función puede devolver uno o varios resultados usando la palabra 'return'.
-- Nota: 'return' detiene inmediatamente la ejecución de la función.

local function sumarPuntos(puntosActuales: number, puntosGanados: number): number
    return puntosActuales + puntosGanados
end

local totalPuntos = sumarPuntos(50, 25) -- Guardamos el resultado (75) en la variable
print("Total de puntos: " .. totalPuntos)


-- 4. RETORNO MÚLTIPLE (CARACTERÍSTICA ÚNICA DE LUAU)
-- A diferencia de otros lenguajes, Luau permite devolver varios valores a la vez separados por comas.

local function obtenerEstadoJugador()
    local nombre = "David"
    local nivel = 10
    local estaActivo = true
    return nombre, nivel, estaActivo -- Devuelve 3 valores
end

-- Recibimos los 3 valores en 3 variables distintas:
local miNombre, miNivel, miEstado = obtenerEstadoJugador()
print(miNombre .. " es nivel " .. miNivel)


-- 5. PARÁMETROS OPCIONALES Y VALORES POR DEFECTO
-- Si no le pasas un argumento a un parámetro, este valdrá 'nil'.

local function curarJugador(vidaActual: number, pocion: number?)
    -- Si 'pocion' es nil, le asignamos un valor por defecto de 10:
    local curacion = pocion or 10
    return vidaActual + curacion
end

print(curarJugador(50))     -- Usa el valor por defecto: 50 + 10 = 60
print(curarJugador(50, 30)) -- Usa el parámetro pasado: 50 + 30 = 80


-- 6. FUNCIONES ANÓNIMAS Y EVENTOS EN ROBLOX STUDIO
-- En Roblox, las funciones a menudo se conectan directamente a eventos (Connect)
-- sin darles un nombre explícito (funciones anónimas).

local bloque = workspace:FindFirstChild("MiParte")

if bloque then
    -- 'Touched' es un evento que se activa cuando algo toca la parte en el juego.
    bloque.Touched:Connect(function(objetoQueToco)
        -- 'objetoQueToco' representa la parte del jugador o modelo que tocó el bloque.
        print("El bloque fue tocado por: " .. objetoQueToco.Name)
    end)
end

--Tips y reglas avanzadas sobre las funciones en Luau:

Declaración Local Obligatoria: Al igual que las variables, acostumbra declarar tus funciones con local function miFuncion(). Si no pones local, la función se creará en el ámbito global, perjudicando el rendimiento.

Uso de return como freno: Puedes usar return sin ningún valor para salir inmediatamente de una función si no se cumple una condición básica.

Sensibilidad de Tipado: Si activas el tipado explícito (: number, : string), Luau te avisará si intentas pasarle un parámetro del tipo equivocado a tu función antes de compilar.
