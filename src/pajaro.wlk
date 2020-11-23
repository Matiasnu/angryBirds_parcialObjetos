class Pajaro{
	var property fuerza
	var property cantidadDeEnojos
	var property ira
	var property posicion = null
		
	method enojarse(){
		self.duplicarSuIra()
		cantidadDeEnojos += 1
		self.aumentarFuerza()
		self.haceOtraCosa()
	}
	method aumentarFuerza() {
		fuerza = ira * 2
	}
	method haceOtraCosa() {}
	method duplicarSuIra() {
		ira = ira * 2
	}
	method tranquilizarse(){ ira -= 5}
}

class PajaroComun inherits Pajaro{
	
}

class Red inherits Pajaro{
	override method aumentarFuerza(){
		fuerza = ira * 10 * cantidadDeEnojos
	}
}

class Bomb inherits Pajaro{
	var property topeDeFuerza = 9000
	override method aumentarFuerza() {
		fuerza = (ira * 2).max(topeDeFuerza)
	}
}

class Chuck inherits Pajaro{
	var property velocidad
	override method haceOtraCosa(){
		velocidad = velocidad * 2
	}
	override method aumentarFuerza(){
		if(velocidad >= 80)
			fuerza = 150
		else
			fuerza = 150 + self.factorDeSumaPorKm()
	}
	method factorDeSumaPorKm() = (velocidad - 80) * 5
	override method tranquilizarse(){}
}

class Terence inherits Pajaro{
	var property multiplicador
	override method aumentarFuerza() {
		fuerza = ira * cantidadDeEnojos * multiplicador
	}	
}

class Matilda inherits Pajaro{
	var property huevos = []
	override method haceOtraCosa(){
		huevos.add(new Huevo(peso=2))
	}
	override method aumentarFuerza(){
		fuerza = (ira * 2) + self.fuerzaDeTodosSusHuevos()
	}
	method fuerzaDeTodosSusHuevos() = huevos.sum { huevo => huevo.fuerza() }
	
}

class Huevo{
	var property peso
	method fuerza() = peso
}