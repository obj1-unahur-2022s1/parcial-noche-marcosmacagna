/*
 * 1) En el Bonus de ```siLeGustaAlComensalSeLoCome()``` tenias que guardate la variable que te devolvia ```cualquierComida()```. En tu código al llamar 3 veces a este método te puede devolver un plato distinto en cada llamado. 
 
 */
import comidas.*
import comensales.*

class Cocina {
	const comidasQueTiene = []
	
	method agregarComida(unaComida) = comidasQueTiene.add(unaComida)
	
	method comidasCarnivoras() = comidasQueTiene.filter({ c => not c.aptoVegetariano() })
	
	method cantComidasVegetarianas() = comidasQueTiene.count({ c => c.aptoVegetariano() })
	
	method buenaOfertaVegetariana() = (self.comidasCarnivoras().size() - self.cantComidasVegetarianas()).abs() <= 2
	
	method platoFuerteCarnivoro() = self.comidasCarnivoras().max({c => c.valoracion()})
	
	method comidasQueLeGustanA(unComensal) = comidasQueTiene.filter({ c => unComensal.leAgrada(c) })
	
	method cualquierComida() = comidasQueTiene.anyOne()
	
	method siLeGustaAlComensalSeLoCome(unComensal) {
		if(unComensal.leAgrada(self.cualquierComida())){
		  comidasQueTiene.remove(self.cualquierComida())
		  unComensal.comer(self.cualquierComida())
		}else{
			self.error("Al comensal no le gusta ninguna comida de la cocina")  
		}
		  
	}
}