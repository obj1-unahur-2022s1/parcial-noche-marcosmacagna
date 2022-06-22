class Pan {
	method valoracion()
}

class Industrial inherits Pan {
	override method valoracion() = 0
}

class Casero inherits Pan {
	override method valoracion() = 20
}

class MasaMadre inherits Pan {
	override method valoracion() = 45
}

class Plato {
	
	method valoracion()
	
	method aptoVegetariano()
	
	method esAbundante()
} 



class Provoleta inherits Plato{
	const property peso
	const property tieneEspecias
	
	override method aptoVegetariano() = not tieneEspecias
	
	method esEspecial() = self.esAbundante() or tieneEspecias
	
	override method valoracion() = if(self.esEspecial()) 120 else 80
	
	override method esAbundante() = peso > 250
}

class HamburguesaDeCarne inherits Plato{
	const property peso = 250
	const property pan  
	
	override method aptoVegetariano() = false
	
	override method valoracion() = 60 + pan.valoracion()
	
	override method esAbundante() = peso > 250
}

class HamburguesaVegana inherits HamburguesaDeCarne {
	const property legumbre
	
	override method aptoVegetariano() = true
	
	method plus() = 17.min(2 * legumbre.size())
	
	override method valoracion() = super() + self.plus()
	
}

class CorteDeCarne {
	const property nombre
	const property calidad
	const property peso
}

class Parrillada inherits Plato{
	const pedidos = []
	
	method agregarCorte(unCorte) = pedidos.add(unCorte)
	
	method peso() = pedidos.sum({ p => p.peso() })
	
	override method aptoVegetariano() = false
	
	method maximaCalidad() = pedidos.max({ p => p.calidad() }).calidad()
	
	method cantidadDeCortes() = pedidos.size()
	
	override method valoracion() = 0.max((15 * self.maximaCalidad()) - self.cantidadDeCortes())
	
	override method esAbundante() = self.peso() > 250
}
