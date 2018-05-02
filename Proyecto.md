<h1>Proyecto Programación Multimedia</h1>

<p>Este documento contiene la iformación y el desarrollo del proyecto final para la asignatura "Programacion Multimedia" del Master de Artes Visuales y Multimedia (AVM) de la Universitat Politecnica de Valencia (UPV).</p>

<p>Profesores:<ul>
 <li>Fernando Cordon</li>
 <li>Moises Mañas</li>
 <li>Carlos García</li>
 <li>Paco Sanmartín </li></ul></p>

 <p>Alumno: Sergio Lecuona Fornes</p>
 <br>
 <hr>

<h3>Pre-Alpha</h3>

<p>Se que al final de la asignatura hay que presentar un proyecto en el que se comuniquen Arduino, Processing3 (P3), y PureData-extended (PD-e) que aprenderemos con los diferentes profesores.
Por eso voy a plantear el trabajo intentando tener en cuenta esa premisa de base.</p>

<p>Realmente tengo dos ideas de proyecto:<ol>

	<li>Utilizar datos de la actividad de redes inalambricas, para realizar composiciones sonoras en vivo.<ul>
		<li>El dispositivo ha de ser capaz de interceptar paquetes de datos, y enviarlos a un procesador que los mapee para generar sonidos y sus secuencias.</li>
		<li>Además, ha de incluir una interfaz física mediante la cual se pueda modular el sonido o la mezcla final. No habría nigun elemento visual dinámico ya que la importancia se encuentra en el sonido, la vista no ha de despistar. </li></ul>
	<br>
	<li>Crear un sistema de audio-looping para directos. Este debe consistir en:<ul>
		<li>Una interfaz física para contolar el funcionamiento de los loops.</li>
    	<li>Una aplicación para configurar los canales y envíos de audio (previo a la actuación).</li>
    	<li>Una interfaz visual para reconocer el estado de los bucles.</li>
    	<li>Se abre la posibilidad de que modifique unos visuales "predefinidos" vinculados a los bucles.</li>
    	<li>La posibilidad de integrar un secuenciador-midi para controlar samplers o sintetizadores externos.</li></li></ol></p>
 <br>
 <hr>

<h3>Alpha</h3>
<p>Después del bloque con Moisés y a mitad del de Carlos, me voy a ceñir a la primera propuesta que hice, aunque con algunos cambios.</p>

<p>La idea a desarrollar queda de la siguiente manera:<ul>
	<li>La instalación ha de leer la información sobre los envíos de datos por el punto wifi al que esté conectado el dispositivo y procesarlos para generar sonido. Este será tanto analógico como digital, siendo producido, por una parte mediante sintetizadores digitales, y por otra con solenoides (sonidos percusivos).</li>
	<li>La lectura del flujo de paquetes por el punto de enrutador se realizará desde una Raspberry Pi3-B con Processing3 y la librería "Carnivore". Esta librería, no permite desencriptar los paquetes (no es el objetivo de la propuesta), sin embargo nos permite leerlos y obtener información tanto del dispositivo emisor como del receptor (IP,Puerto,Protocolo...).</li>
	<li>Para la generación del sonido digital se utilizará PureData-extended, un entorno de programación gráfica originalmente diseñado para el procesamiento de audio. Este nos permite diseñar procesos de síntesis de sonido que serán activados y modificados por los datos que P3 envíe.</li>
	<li>Aunque "Carnivore" nos permite recoger los datos con distintos formatos, será necesario establecer un formato propio para realizar los envíos a PD-e.</li>
	<li>Por otra parte, los sonidos percusivos, que se realizarán con solenoides, estarán controlados directamente desde P3 en la Raspberry usado la libreria "ArduinoFirmata" y una placa Arduino.</li></ul></p>
<p>Más de cara al concepto y su presentación, tengo claro que quiero que por lo menos, uno de los sonidos que quiero que se produzcan sea el de los timbres clásicos de las recepciones de hotel o usados también en cocinas para avisar de que hay un pedido nuevo o listo. En estrecha relación con este último ejemplo, debería sonar cada vez que se lea la recepción o envío de un paquete, resultando en un ruido insoportable si el tráfico es muy denso o silencio en el caso contrario (esto ya de por sí podría ser una instalación, pero excluiría el uso de PD-e).</p>
<p>La sonificación con PD-e aún no está definida. El resultado de esta debería tener una sonoridad suspendida con cortes enventuales, en contraposición al sonido del timbre. Pienso que por lógica han de ser sonidos contrapuestos ya que lo son los medios que los producen (analógico y digital).</p>
<p>Se plantea así, por una parte el diálogo entre dispositivos, el tráfico de datos de fonodo, la actividad de un dispositivo de forma independiente (más allá de la interacción con el ser humano), y por otra, la percepción de la punta del iceberg que es el mundo de las máquinas, el mundo digital con el que sólo podemos comunicarnos mediante interfaces limitadas.</p>