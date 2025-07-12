

## Ejercicio
 ¡Ahoy, compañeros piratas de software! Necesitamos un programa en objetos que modele algunos aspectos de los verdaderos piratas de los viejos tiempos.
 
Hay barcos piratas que necesitan reclutar tripulantes. Cada barco pirata tiene una misión que quiere cumplir, y por eso sólo aceptará en su tripulación a los piratas que le sirvan para esa misión. Un barco puede cambiar de misión en cualquier momento.
Cada pirata puede llevar varios “ítems” consigo, como ser: un mapa, una brújula, un loro, un cuchillo, una botella de grogXD, etc.  Por ejemplo: el pirata Barbanegra tiene una brújula, dos cuchillos, un diente de oro y tres botellas de grogXD. Además, de cada pirata se conoce el nivel de ebriedad que tiene y la cantidad de dinero que lleva consigo (para simplificar el modelo, el dinero es un número de monedas).
Existen tres tipos de misiones: búsquedas del tesoro, convertirse en leyenda o saqueos. Nos va a interesar saber si un pirata es útil para una misión, y además si una misión puede ser realizada por un barco.
Una misión, para poder ser completada por un barco, debe cumplir ciertos requisitos. El primero, común a todas ellas, es que el barco tenga suficiente tripulación.  Se considera que un barco tiene suficiente tripulación cuando la cantidad de sus tripulantes llega al menos al 90% de su capacidad. De cada barco se conoce su capacidad (cuántas personas es capaz de llevar).

Además, cada tipo de misión tiene sus particularidades:
Búsqueda del Tesoro:
·         Para esta clase de misiones sólo serán útiles como tripulantes aquellos piratas que tengan una brújula, un mapa o una botella de grogXD entre sus ítems, y no tengan más de 5 monedas.
·         Para que una búsqueda del tesoro pueda ser realizada por un barco, al menos uno de sus tripulantes debe tener entre sus ítems una llave de cofre.
Convertirse en Leyenda:
·         Para que un pirata sea útil en una misión de convertirse en leyenda debe tener al menos 10 ítems, entre los cuales debe figurar un ítem obligatorio definido en cada misión de convertirse en leyenda.
·         Esta clase de misiones no tiene condiciones particulares para que pueda ser realizada con un barco.
Saqueo: los saqueos tienen un objetivo o víctima, que puede ser un barco o una ciudad costera.
·         Para estas misiones son útiles los piratas que cuenten con menos dinero que una cantidad de monedas determinada (para todas las misiones de saqueo es la misma cantidad, pero se debe poder cambiar)  y además se animen a saquear a la víctima de la misión de la que se trate (ver mas abajo).
·         Para que un saqueo pueda ser realizado por un barco, la víctima debe ser vulnerable al barco (ver más abajo).

Las víctimas  de saqueo pueden ser dos:

Un barco pirata: un pirata tiene que estar pasado de grogXD (tener un nivel de ebriedad de al menos 90) como para animarse a saquear a un barco pirata, y además un barco pirata es vulnerable a otro si tiene como máximo la mitad de los tripulantes que el que lo quiere saquear.
Una ciudad costera: un pirata debe tener un nivel de ebriedad de al menos 50 para animarse a saquear a una ciudad. Una ciudad costera es vulnerable a un barco si la cantidad de tripulantes es al menos el 40% de la cantidad de habitantes de la ciudad, o bien cuando toda la tripulación del barco está pasada de grogXD.
 
Nota: los ítems se pueden modelar con strings (ej: 'mapaDelCaribe').
 
Se requiere modelar el dominio pensando en el paradigma de objetos, incluyendo el diagrama de clases correspondiente y la codificación Smalltalk para cumplir con los siguientes objetivos:
 
1)    Saber si un pirata es útil para una misión
2)    Incorporar un pirata a la tripulación de un barco, sólo si esto puede ser llevado a cabo. Esto ocurre cuando el barco tiene lugar para un tripulante más, y además el pirata sirve para la misión del barco.
3)  Hacer que un barco cambie de misión. Al cambiar de misión, el barco echa a los tripulantes que no sirven para su misión actual.
4) Hacer que un barco ancle en una ciudad costera. Cuando los barcos anclan, toda la tripulación  se toma un trago de grogXD, que provoca que el nivel de ebriedad de cada uno suba en 5 unidades y se gasten una moneda. Además, el más ebrio de los tripulantes del barco queda perdido en la ciudad, o sea que deja de formar parte de la tripulación y la ciudad queda con un habitante más.
5)    Saber si un barco pirata es temible, que consiste en que pueda realizar la misión que tiene asignada 
6) Se sabe que algunos tripulantes son espías de la corona. Estos piratas se comportan igual que los piratas comunes a excepción de que nunca están pasados de grogXD y que para animarse a saquear una víctima se tienen que dar las condiciones explicadas anteriormente y además tener el ítem permiso de la corona.
7)
a) Saber cuántos tripulantes de un barco están pasados de grogXD
b) Saber cuántos tipos distintos de items se juntan entre los tripulantes de un barco que están pasados de grogXD (es decir, los ítems sin repetidos)
c) Obtener el tripulante pasado de grogXD con más dinero de la tripulación de un barco.
¡Gaaar! ¡Ojo con repetir código!
 
8)   Cada tripulante conoce qué tripulante del barco lo invito. Se quiere conocer quién es el tripulante de un barco pirata que invito (satisfactoriamente) a más gente.