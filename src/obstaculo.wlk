class Obstaculo{
	var property resistencia = 0
	var property position = null
	var property seDerribo = false
	method impactar(pajaro){
		if(self.loDerriba(pajaro.fuerza()))
			self.derribar()
	}
	method loDerriba(fuerza) = fuerza > resistencia
	method derribar(){
		seDerribo = true
	}
}

class CerditosArmados inherits Obstaculo{
	var property arma = casco
	override method resistencia() = 10 * arma.resistencia()
}

class Pared inherits Obstaculo{
	var property anchoDePared = 0
	var property coeficienteDeMultiplicacion
	override method resistencia() = anchoDePared * coeficienteDeMultiplicacion
}

const cerditoObrero = new Obstaculo(resistencia=50)
const casco = new Obstaculo(resistencia=20)
const escudo = new Obstaculo(resistencia=40)
const paredesDeVidrio = new Pared(coeficienteDeMultiplicacion=10)
const paredesDeMadera = new Pared(coeficienteDeMultiplicacion=25)
const paredesDePiedra = new Pared(coeficienteDeMultiplicacion=50)