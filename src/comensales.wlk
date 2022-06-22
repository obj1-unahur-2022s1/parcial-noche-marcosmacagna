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
