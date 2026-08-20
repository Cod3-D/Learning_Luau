-- ============================================================================
-- GUÍA Y APUNTES: OBJETOS, PROPIEDADES Y EVENTOS EN ROBLOX STUDIO
-- ============================================================================

-- 1. REFERENCIAR OBJETOS EN EL EXPLORER
-- Para modificar un objeto primero debes obtener su ubicación en la jerarquía.

-- 'script' hace referencia a este archivo de código.
-- 'script.Parent' hace referencia al objeto que contiene a este script.
local bloque = script.Parent

-- Referenciar un objeto desde la carpeta principal del juego ('workspace'):
local parteEspecial = workspace:FindFirstChild("MiParte")


-- 2. MODIFICAR PROPIEDADES DE UN OBJETO
-- Usas la sintaxis de punto '.' para cambiar las características de un bloque.

if bloque then
    bloque.Anchored = true                         -- Booleano: Anclar el bloque para que no caiga
    bloque.CanCollide = true                      -- Booleano: Permitir que los jugadores colisionen con él
    bloque.Transparency = 0.5                     -- Número: Cambiar la transparencia (de 0 a 1)
    bloque.Material = Enum.Material.Neon          -- Enum: Cambiar el material a Neón
    bloque.BrickColor = BrickColor.new("Bright red")-- Color: Cambiar el color a rojo brillante
end


-- 3. CREAR Y DESTRUIR OBJETOS DESDE CÓDIGO (Instance.new)

-- A. Crear una nueva Parte en el juego:
local nuevaParte = Instance.new("Part")
nuevaParte.Name = "MonedaGenerada"
nuevaParte.Size = Vector3.new(2, 2, 2)            -- Tamaño en 3D (X, Y, Z)
nuevaParte.Position = Vector3.new(0, 10, 0)        -- Posición en el mapa
nuevaParte.Parent = workspace                      -- Colocarla dentro del mundo de juego

-- B. Eliminar un objeto (Destruir):
-- task.wait(5) -- Espera 5 segundos antes de continuar
-- nuevaParte:Destroy() -- Elimina la parte por completo de la memoria


-- 4. MANEJO DE EVENTOS (EVENT-DRIVEN PROGRAMMING)
-- Los eventos detectan cuando sucede algo en el juego y ejecutan una función.

-- Ejemplo: Evento 'Touched' (Se activa cuando algo entra en contacto físico con la parte)
local function alTocarBloque(objetoQueToco: Instance)
    -- Verificamos si lo que tocó el bloque es una parte del cuerpo de un jugador (Character)
    local modelo = objetoQueToco.Parent
    local humanoide = modelo:FindFirstChildWhichIsA("Humanoid")
    
    if humanoide then
        -- Le restamos 10 de vida al jugador al tocar el bloque dañino
        humanoide.Health -= 10
        print("¡El jugador " .. modelo.Name .. " recibió daño!")
    end
end

-- Conectamos el evento a la función usando :Connect()
bloque.Touched:Connect(alTocarBloque)


-- 5. EVENTOS DE JUGADORES (PLAYERS)
-- Detectar cuando un jugador entra o sale del juego.

local Players = game:GetService("Players")

-- Evento que se dispara cuando un usuario entra al servidor:
Players.PlayerAdded:Connect(function(jugador)
    print("¡Un nuevo jugador ha entrado al juego!: " .. jugador.Name)
    
    -- Evento que detecta cuando el personaje del jugador aparece en el mapa (Spawn):
    jugador.CharacterAdded:Connect(function(personaje)
        print("El personaje de " .. jugador.Name .. " ha aparecido.")
    end)
end)

--Tips y reglas avanzadas sobre los Objetos y Eventos en Roblox Studio:

Métodos con dos puntos : versus Propiedades con punto .:

Para modificar características usas punto (parte.Transparency = 1).

Para ejecutar acciones/métodos del objeto usas dos puntos (parte:Destroy(), workspace:FindFirstChild()).

Uso de FindFirstChild: Siempre usa :FindFirstChild("Nombre") cuando no estés 100% seguro de si un objeto existe al momento de ejecutar el código. Si intentas modificar workspace.MiParte y el bloque aún no carga, el juego fallará con un error.

Control de tiempo moderno (task.wait): En Roblox Studio moderno, evita usar wait() antiguo. Utiliza siempre la librería task.wait(segundos), ya que es mucho más precisa y eficiente con los recursos del juego.
