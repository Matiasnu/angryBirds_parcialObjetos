class EventoSimple{
	method realizarEvento(isla)
}

class SerieDeEventos{
	var property eventos = []
	method realizarEventos(isla){
		eventos.forEach{ evento => evento.realizarEvento(isla)}
	}
}

object sesionDeManjoDeIra inherits EventoSimple{
	override method realizarEvento(isla){
		isla.pajaros().forEach{ pajaro => pajaro.tranquilizarse()}
	}
}

object invasionDeCerditos inherits EventoSimple{
	var property cantidadDeCerdos
	override method realizarEvento(isla){
		if(cantidadDeCerdos >= 100){
			isla.pajaros().forEach{ pajaro => pajaro.enojarse() }
			cantidadDeCerdos -=100
		}
		else
			throw new DomainException(message="La cantidad de cerditos no es la suficiente para hacer enojar los pajaros")
		self.realizarEvento(isla)
	}
}

object fiestaSorpresa inherits EventoSimple{
	var property homenajeados = []
	override method realizarEvento(isla){
		homenajeados.forEach{ pajaro => pajaro.enojarse()}
	}
}