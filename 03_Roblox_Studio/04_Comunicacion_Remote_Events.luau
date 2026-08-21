-- ============================================================================
-- 1. CLIENTE A SERVIDOR (Pedir una acción)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL CLIENTE (LocalScript en StarterGui o StarterPlayerScripts)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventoCompra = ReplicatedStorage:WaitForChild("ComprarArmaEvent")

-- Ejemplo: Función ejecutada al hacer clic en un botón de compra
local function solicitarCompra()
    local nombreObjeto = "EspadaDeMadera"
    
    -- Envia la señal desde el cliente hacia el servidor
    eventoCompra:FireServer(nombreObjeto)
end


-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL SERVIDOR (Script en ServerScriptService)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventoCompra = ReplicatedStorage:WaitForChild("ComprarArmaEvent")

-- REGLA DE ORO: El servidor recibe automáticamente al 'jugador' como PRIMER argumento
eventoCompra.OnServerEvent:Connect(function(jugador, nombreObjeto)
    print(jugador.Name .. " solicitó comprar: " .. nombreObjeto)
    
    -- El servidor valida el dinero de forma independiente por seguridad
    local stats = jugador:FindFirstChild("leaderstats")
    if stats and stats.Oro.Value >= 50 then
        stats.Oro.Value -= 50
        print("Compra autorizada e inventario actualizado para " .. jugador.Name)
    else
        warn(jugador.Name .. " no tiene suficiente oro.")
    end
end)


-- ============================================================================
-- 2. SERVIDOR A CLIENTE (Notificar un cambio visual)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL SERVIDOR (Script en ServerScriptService)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventoNotificacion = ReplicatedStorage:WaitForChild("NotificacionEvent")

local function avisarGanador(jugadorGanador)
    -- Opción A: Enviar señal a un jugador específico
    eventoNotificacion:FireClient(jugadorGanador, "¡Has ganado la partida!")
    
    -- Opción B: Enviar señal a todos los jugadores conectados
    -- eventoNotificacion:FireAllClients("La partida ha finalizado.")
end


-- ----------------------------------------------------------------------------
-- CÓDIGO EN EL CLIENTE (LocalScript en StarterGui o StarterPlayerScripts)
-- ----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventoNotificacion = ReplicatedStorage:WaitForChild("NotificacionEvent")

-- NOTA: OnClientEvent NO recibe el argumento 'jugador', solo los datos enviados
eventoNotificacion.OnClientEvent:Connect(function(mensajeTexto)
    print("Notificación recibida del servidor: " .. mensajeTexto)
    -- Aquí se actualizaría un texto en la pantalla (GUI)
end)


-- ============================================================================
-- TIPS Y REGLAS DE SEGURIDAD CRUCIALES
-- ============================================================================
-- 1. Parámetro 'player' Implícito:
--    Al usar 'FireServer(dato1)', el servidor recibe '(player, dato1)'. Roblox
--    inserta al jugador automáticamente para evitar que se suplanten identidades.
--
-- 2. Confianza Cero en el Cliente (Never Trust the Client):
--    Nunca envíes cantidades de vida o precios desde un LocalScript. Un hacker
--    puede alterarlos. El LocalScript solo pide "comprar X", el servidor valida.
--
-- 3. Uso de WaitForChild():
--    Usa siempre 'ReplicatedStorage:WaitForChild("NombreEvento")' en los LocalScripts
--    para evitar errores si los elementos tardan un instante en cargar.
--
-- 4. Ubicación Obligatoria:
--    Los RemoteEvents se colocan dentro de 'ReplicatedStorage' para que tanto
--    el Cliente como el Servidor tengan acceso a ellos.
