1)Reglas de Sintaxis Básica:

*Sensible a Mayúsculas y Minúsculas (Case-Sensitive): Jugador, jugador y JUGADOR son variables totalmente distintas.

*Nombres de Identificadores (Variables y Funciones):
- Solo pueden contener letras, números y guiones bajos (_).
- Jamás pueden iniciar con un número (ejemplo válido: jugador1; inválido: 1jugador).
- No pueden usar caracteres especiales ($, @, ñ, acentos, etc.).
- No pueden usar palabras reservadas del lenguaje para nombrar alguna variable o función (local, function, if, end, then, else, while, return, nil, true, false, and, or, not, etc.).

*Punto y coma opcional: No es necesario colocar ; al final de cada línea de código (Solamente usarlo si decides escribir varias órdenes juntas sin dar un salto de línea, el punto y coma le ayuda a Luau a saber exactamente dónde termina una instrucción y dónde empieza la otra).

2)Variables y Alcance (Scope):

*Regla de Alcance Local: Siempre debes declarar las variables con la palabra clave local (ejemplo: local vida = 100). Si no usas local, Luau la creará como una variable global, lo cual impacta negativamente el rendimiento y genera errores de organización.

*Inicialización por defecto: Toda variable declarada que no reciba un valor explícito almacenará automáticamente nil.

3)Manejo de Tipos de Datos y Valores:

Evaluación de Booleanos (Verdadero/Falso):

*En Luau, únicamente false y nil se consideran falsos.

*El número 0 y los textos vacíos "" son evaluados como verdaderos (true) en las condiciones (if).

*Arrays indexados desde 1: A diferencia de la mayoría de los lenguajes de programación que empiezan a contar listas/arrays desde la posición 0, en Luau las listas y tablas empiezan tradicionalmente en el índice 1.

4)Estructura del Código:

Comentarios:

*Una sola línea: -- Comentario

*Bloques multilínea: --[[ Comentario de varias líneas ]]

*Bloques delimitados por palabras: Luau no utiliza llaves {} para abrir y cerrar bloques de código (como C++ o C#). Los bloques de function, if, for y while siempre se cierran explícitamente con la palabra end.

5)Arquitectura Cliente-Servidor y RemoteEvents:

*Diferencia entre Entornos:
- Cliente (LocalScript): Maneja la interfaz de usuario (GUI), sonidos, efectos visuales y entradas del teclado/mouse.
- Servidor (Script): Maneja la lógica crucial del juego, inventarios, datos guardados, compras y daño real.

*Uso de RemoteEvents:
- Se ubican obligatoriamente dentro de ReplicatedStorage.
- Cliente a Servidor: El LocalScript envía la señal con FireServer() y el Script del servidor la recibe con OnServerEvent.
- Servidor a Cliente: El Script envía la señal a un jugador con FireClient(jugador) o a todos con FireAllClients(), y el LocalScript la recibe con OnClientEvent.

*Regla de Seguridad (Never Trust the Client):
- En OnServerEvent, el primer parámetro siempre es automáticamente el jugador que envió la señal (parámetro implícito).
- El cliente NUNCA debe enviar datos críticos como cantidades de oro o vida. El cliente solo pide realizar una acción y el servidor valida si es posible.

6)Comunicación Bidireccional con RemoteFunctions:

*Diferencia con RemoteEvents:
- RemoteEvents solo envían una señal ("dispara y olvida").
- RemoteFunctions envían una solicitud y esperan obligatoriamente una respuesta (retorno de datos) para continuar ejecutando el código.

*Uso de RemoteFunctions:
- Se ubican obligatoriamente dentro de ReplicatedStorage.
- Solicitud del Cliente al Servidor: El LocalScript llama a InvokeServer() y pausa su ejecución hasta recibir la respuesta. El Script del servidor procesa la petición asignando una función a la propiedad OnServerInvoke y regresa los valores con la palabra clave return.

*Regla de Seguridad Crítica (Peligro de InvokeClient):
- En OnServerInvoke, el primer parámetro es automáticamente el jugador que hizo la consulta (parámetro implícito).
- ¡NUNCA usar InvokeClient en el servidor!: Si el servidor invoca al cliente para pedirle datos, un usuario con hacks puede evitar responder, congelando el script del servidor indefinidamente y rompiendo el juego para todos los demás jugadores.
