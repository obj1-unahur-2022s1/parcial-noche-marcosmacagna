/*
1) Recordá que podes unar el mensaje x.even() a un número para saber si es par en lugar de usar la funcion modulo de 2  (x % 2)
2) Quizás en este enunciado los más adecuado hubiera sido colocar los métodos ```ningunaComidaEsAbundante()``` en Vegetariano y ```comidasIngeridasEsPar() ``` en PaladarFino 
 */
import comidas.*

class Comensales {
	const property peso
	const comio = []
	
	method leAgrada(unaComida)
	
	method comer(unaComida) = comio.add(unaComida)
	
	method pesoDeLoQueComio() = comio.sum({ c => c.peso() })
	
	method estaSatisfecho() = self.pesoDeLoQueComio() >= (peso * 0.01)
	
	method ningunaComidaEsAbundante() = comio.all({ c => not c.esAbundante() })
	
	method comidasIngeridasEsPar() = comio.size() % 2 == 0
}

class Vegetariano inherits Comensales {
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() and unaComida.valoracion() > 85
	
	override method estaSatisfecho() = super() and self.ningunaComidaEsAbundante()
}

class Popular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	
	override method estaSatisfecho() = super() and self.comidasIngeridasEsPar()
}
