-- ============================================================================
-- DESCRIPCIÓN DEL ARCHIVO Y PROPÓSITO
-- ============================================================================
-- ¿Qué contiene este archivo?:
--   - Uso de 'CFrame' para alterar posición y rotación de partes.
--   - Conversión de ángulos con la librería matemática 'math.rad()'.
--   - Creación de rotación continua (efecto de giro).
--   - Creación de movimiento oscilatorio flotante mediante 'math.sin()'.

-- ============================================================================
-- 1. ROTACIÓN CONTINUA (Girar una MeshPart)
-- ============================================================================
local parteGiratória = script.Parent -- Asumiendo que el script está dentro del objeto

-- Velocidad de rotación en grados por segundo
local velocidadGiro = 45 

task.spawn(function()
    while true do
        local deltaTiempo = task.wait() -- Captura el tiempo exacto transcurrido entre fotogramas
        
        -- CFrame.Angles requiere radianes, por eso usamos math.rad()
        local incrementoRadianes = math.rad(velocidadGiro * deltaTiempo)
        
        -- Multiplicar CFrames combina la posición actual con la nueva rotación en el eje Y
        parteGiratória.CFrame = parteGiratória.CFrame * CFrame.Angles(0, incrementoRadianes, 0)
    end
end)


-- ============================================================================
-- 2. MOVIMIENTO FLOTANTE O SUAVE (Efecto Moneda u Objeto Flotante)
-- ============================================================================
local parteFlotante = script.Parent
local posicionInicial = parteFlotante.Position

local amplitud = 2 -- Altura máxima a la que sube y baja (estudios en studs)
local velocidadFlotacion = 3 -- Velocidad de oscilación

task.spawn(function()
    local tiempoAcumulado = 0
    
    while true do
        local deltaTiempo = task.wait()
        tiempoAcumulado = tiempoAcumulado + deltaTiempo
        
        -- math.sin() devuelve un valor suave entre -1 y 1
        local desplazamientoY = math.sin(tiempoAcumulado * velocidadFlotacion) * amplitud
        
        -- Mantenemos X y Z fijos en la posición inicial y variamos Y
        parteFlotante.Position = Vector3.new(
            posicionInicial.X,
            posicionInicial.Y + desplazamientoY,
            posicionInicial.Z
        )
    end
end)


-- ============================================================================
-- REGLAS Y NOTAS SOBRE 'MATH' Y 'CFRAME'
-- ============================================================================
-- 1. Anchored = true:
--    Para mover objetos directamente por CFrame/Position en script sin que la
--    gravedad interfiera, la propiedad 'Anchored' de la parte debe ser 'true'.
--
-- 2. Diferencia entre Position y CFrame:
--    - Position: Solo cambia las coordenadas (X, Y, Z) en el espacio 3D.
--    - CFrame: Mantiene tanto la Posición como la Orientación (Rotación).
--
-- 3. Multiplicación de CFrames (*):
--    En Luau, al multiplicar dos CFrames (CFrame1 * CFrame2), estás aplicando una
--    transformación relativa (por ejemplo: "conserva la posición actual y gira X grados").

-- ============================================================================
-- CONSEJOS PRÁCTICOS Y ERRORES COMUNES (TIPS DE DESARROLLO)
-- ============================================================================
-- 1. Movimiento en Cliente vs Servidor:
--    - Mover partes en el servidor con bucles continuos (while true) consume CPU.
--    - Para efectos puramente visuales (monedas, luces, adornos), ejecuta la 
--      rotación/flotación dentro de un LocalScript para no saturar al servidor.
--
-- 2. Evitar la degradación de precisión en CFrame:
--    - No acumules multiplicaciones de CFrame sobre el CFrame actual indefinidamente.
--    - Almacena siempre el 'CFrame inicial' en una variable y calcula la rotación/posición
--      tomando ese origen como referencia:
--      Ejemplo: parte.CFrame = cframeInicial * CFrame.Angles(0, math.rad(angulo), 0)
--
-- 3. Uso de 'task.wait()' en lugar de 'wait()':
--    - 'task.wait()' está optimizado por la biblioteca 'task' de Luau.
--    - Se ejecuta a la frecuencia del renderizado o física del motor (mínimo 60 FPS),
--      evitando tirones visuales en los movimientos.
--
-- 4. Limitación de valores con 'math.clamp':
--    - Utiliza 'math.clamp(valor, minimo, maximo)' para restringir coordenadas o
--      ángulos y evitar que los objetos atraviesen paredes o límites del mapa.
-- ============================================================================
