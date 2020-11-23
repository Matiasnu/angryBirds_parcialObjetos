import generador.*

class Isla{
	var property posicionXIsla
	var property posicionYIsla
	var property habitantes = []
	method agregarHabitanteALaIsla(habitante){
		habitantes.add(habitante)
	}
	method ubicarATodos(){
		habitantes.forEach{ habitante => self.ubicar(habitante)}
	}
	method ubicar(habitante){
		habitante.posicion(generador.generarPosicionRandom(posicionXIsla,posicionYIsla))
	}
}

object islaPajaro inherits Isla (posicionXIsla=0,posicionYIsla=100){
	method pajarosFuertes() = habitantes.filter { pajaro => pajaro.fuerza() > 50 }
	method fuerzaDeLaIsla() = self.pajarosFuertes().sum{ pajaro => pajaro.fuerza() }
	method realizarEvento(evento){
		evento.realizarEvento(self)
	}
	
	method saberObstaculoMasCercano(pajaro) = islaCerdito.habitantes().min{ habitante => self.calcularDiferencia(pajaro.posicion(),habitante.posicion())}
	method calcularDiferencia(posicionPajaro, posicionObstaculo)  = ((posicionPajaro.x() - posicionObstaculo.x()).abs() - (posicionPajaro.y() - posicionObstaculo.y()).abs()).abs()
	method atacar(){
		const obstaculoMasCercano =  self.saberObstaculoMasCercano(pajaro)
		if(obstaculoMasCercano.seDerribo())
			throw new DomainException(message="El obstaculo ya fue derribado")
		habitantes.forEach{ pajaro => obstaculoMasCercano.impactar(pajaro)}
	}
	
}

object islaCerdito inherits Isla (posicionXIsla=150,posicionYIsla=200){
	method seRecuperaronLosHuevos() = habitantes.all{ habitante => habitante.seDerribo() }
}