-- ============================================================================
-- 1. SOLICITUD DEL CLIENTE CON RETORNO DEL SERVIDOR
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL CLIENTE (LocalScript en StarterGui o StarterPlayerScripts)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local funcionConsulta = ReplicatedStorage:WaitForChild("ObtenerPrecioItem")

local function consultarPrecio()
    local nombreItem = "EspadaDeDiamante"
    
    -- ':InvokeServer()' PAUSA la ejecución del script local hasta recibir el 'return' del servidor
    local precio, disponible = funcionConsulta:InvokeServer(nombreItem)
    
    print("El precio recibido del servidor es: " .. tostring(precio))
    if disponible then
        print("El ítem está disponible para compra.")
    end
end


-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL SERVIDOR (Script en ServerScriptService)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local funcionConsulta = ReplicatedStorage:WaitForChild("ObtenerPrecioItem")

-- En RemoteFunctions se ASIGNA una función a '.OnServerInvoke' (no se usa :Connect)
-- REGLA DE ORO: El primer argumento recibido es siempre el 'jugador' que invocó la señal
funcionConsulta.OnServerInvoke = function(jugador, nombreItem)
    print(jugador.Name .. " está consultando el precio de: " .. tostring(nombreItem))
    
    -- El servidor procesa la petición y REGRESA los valores al cliente
    if nombreItem == "EspadaDeDiamante" then
        return 500, true -- Retorna el precio y un booleano
    else
        return 0, false
    end
end


-- ============================================================================
-- TIPS Y REGLAS DE SEGURIDAD CRUCIALES
-- ============================================================================
-- 1. Pausa de Ejecución (Sincrónico):
--    A diferencia de 'FireServer()', llamar a 'InvokeServer()' congela la línea de
--    código local actual hasta que el servidor ejecute el 'return'.
--
-- 2. ¡NUNCA USAR 'InvokeClient' EN EL SERVIDOR!:
--    Existe el método 'InvokeClient()' para que el servidor le pida datos al cliente,
--    pero ES UN RIESGO GRAVE DE SEGURIDAD. Si un hacker modifica su cliente para
--    no responder, el script de tu servidor se congelará indefinidamente.
--
-- 3. Asignación con Signo Igual (=):
--    'OnServerInvoke' es una propiedad a la que se le asigna una función (= function),
--    a diferencia de los eventos de RemoteEvent que usan conexión (:Connect).
--
-- 4. Manejo de Errores:
--    Si hay lag o caída de conexión durante un 'InvokeServer()', la llamada puede
--    fallar. En sistemas avanzados se recomienda envolver la llamada en un 'pcall()'.
