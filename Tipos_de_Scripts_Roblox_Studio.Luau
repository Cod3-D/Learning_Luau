 ============================================================================
   GUÍA Y APUNTES: LOS 3 TIPOS DE SCRIPTS EN ROBLOX STUDIO Y DÓNDE USARLOS
 ============================================================================

-- En Roblox Studio existen 3 tipos de scripts. Entender la arquitectura Cliente-Servidor
-- es fundamental: el 'Servidor' es la computadora de Roblox que gestiona el juego, 
-- mientras que el 'Cliente' es la pantalla/dispositivo de cada jugador individual.


-- ============================================================================
-- 1. SCRIPT (SERVER SCRIPT / SCRIPT DE SERVIDOR)
-- Ícono en Roblox Studio: Hoja de papel blanca con código.
-- Dónde se ejecuta: En el Servidor (Server).
-- Dónde se debe colocar: ServerScriptService, Workspace, ServerStorage.
-- ============================================================================

-- ¿Para qué sirve?: 
-- Modifica el juego para TODOS los jugadores al mismo tiempo. Es el encargado de la 
-- lógica principal, seguridad, guardar datos y evitar trampas (exploits/hacks).

-- ¿Qué se debe escribir aquí?:
-- - Guardado de datos de los jugadores (DataStores).
-- - Dar monedas, experiencia o subir de nivel.
-- - Compras dentro del juego (Gamepasses / Developer Products).
-- - Hacer daño a los personajes o destruirlos.
-- - Controlar puertas, zonas o mecánicas globales del mapa.

-- Ejemplo de un Server Script (Colocado en ServerScriptService):
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(jugador)
    print("El servidor detectó la entrada de: " .. jugador.Name)
    -- El servidor asigna los datos de forma segura para que nadie haga trampa
end)


-- ============================================================================
-- 2. LOCALSCRIPT (SCRIPT DE CLIENTE / SCRIPT LOCAL)
-- Ícono en Roblox Studio: Hoja de papel azul con código.
-- Dónde se ejecuta: En el dispositivo del Jugador (Cliente).
-- Dónde se debe colocar: StarterPlayerScripts, StarterCharacterScripts, StarterGui.
-- ============================================================================

-- ¿Para qué sirve?: 
-- Ejecuta acciones visuales que SOLO ve y siente el jugador que las activa.
-- Los cambios hechos aquí NO se reflejan automáticamente para los demás jugadores.

-- ¿Qué se debe escribir aquí?:
-- - Interfaz de usuario (Guis, menús, botones en pantalla, barras de vida).
-- - Detectar teclas presionadas (Teclado, Mouse, Pantalla táctil o Control).
-- - Efectos visuales individuales (Cámara, sonidos locales, partículas en pantalla).
-- - Movimientos personalizados de la cámara o animaciones del jugador.

-- Ejemplo de un LocalScript (Colocado dentro de un Botón en StarterGui):
local boton = script.Parent -- Asumiendo que el script está dentro de un TextButton

boton.MouseButton1Click:Connect(function()
    print("Solo ESTE jugador hizo clic en el botón de su pantalla.")
    -- Abrir o cerrar una ventana de tienda en su interfaz
end)


-- ============================================================================
-- 3. MODULESCRIPT (SCRIPT MÓDULO)
-- Ícono en Roblox Studio: Hoja de papel con un engrane / módulo.
-- Dónde se ejecuta: Donde sea invocado (Server o Cliente).
-- Dónde se debe colocar: ReplicatedStorage (si se comparte) o ServerStorage (solo servidor).
-- ============================================================================

-- ¿Para qué sirve?: 
-- Es una "librería de funciones". No se ejecuta por sí solo; otros scripts (Server o Local)
-- lo llaman usando la función 'require()' para reutilizar código y no repetir funciones.

-- Estructura interna obligatoria de un ModuleScript:
local MiModulo = {} -- Creamos una tabla que contendrá todas las funciones

-- Definimos una función dentro del módulo:
function MiModulo.calcularMultiplicador(nivel: number): number
    return nivel * 1.5
end

return MiModulo -- OBLIGATORIO: Siempre debe devolver la tabla al final


-- ============================================================================
-- CÓMO USAR UN MODULESCRIPT DESDE OTRO SCRIPT (EJEMPLO CON require)
-- ============================================================================

-- Desde un Script de Servidor o LocalScript importamos el módulo así:
-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local MiModulo = require(ReplicatedStorage:WaitForChild("MiModulo"))
-- local resultado = MiModulo.calcularMultiplicador(10) -- Devuelve 15


-- CONSEJOS CLAVE Y REGLAS DE SEGURIDAD
-- Regla de la Confianza Cero (Never Trust the Client):

Nunca calcules las monedas, vida o compras dentro de un LocalScript. Un hacker puede modificar el código que corre en su computadora.

La interfaz (LocalScript) solo pide la acción; el servidor (Script) verifica si el jugador tiene el dinero y le otorga el objeto.

No pongas LocalScripts en el Workspace directo:

Un LocalScript dentro de un bloque básico en medio del mapa no funcionará a menos que esté dentro del modelo del personaje del jugador (Character).

Usa ReplicatedStorage para la comunicación:

Si necesitas que un LocalScript hable con un Script del servidor, debes usar un objeto especial llamado RemoteEvent o RemoteFunction ubicado dentro de ReplicatedStorage.
