import wollok.game.*
import pachamama.*

class Planta {
	var property position
	const property tipo = "Planta"
	
	method image()
	method crecer() {}
	method estaLista()
	method tieneGluten() = false
	method valor()
}

class Maiz inherits Planta {
	var property image = "maiz_bebe.png"
	
	override method crecer() {
		if (image == "maiz_bebe.png") {
			image = "maiz_adulto.png"
		}
	}
	
	override method estaLista() = image == "maiz_adulto.png"
	override method valor() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 30 else 0 
		
		return 150 + plusAgradecimiento
	}
}

class Trigo inherits Planta {
	const estados = ["trigo_0.png", "trigo_1.png","trigo_2.png","trigo_3.png"]
	var indiceEstado = 0
		
	override method valor() {
		return if (self.etapaEvolucion() == 2) 100
		else  if (self.etapaEvolucion() == 3) 200
		else 0 
	}
	
	override method crecer() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 1 else 0 
		
		indiceEstado += 1 + plusAgradecimiento
	}
	
	override method image() = estados.get(self.etapaEvolucion())
	
	override method estaLista() = self.etapaEvolucion() >= 2
	override method tieneGluten() = true
	
	method etapaEvolucion() = indiceEstado % 4	
}

class Tomaco inherits Planta {
	
	var property image = "tomaco_ok.png"
	const property valor = 80
	
	override method image() = if (pachamama.estaAgradecida()) "tomaco_podrido.png" else "tomaco_ok.png"
	
	override method estaLista() {
		return self.image() == "tomaco_ok.png"
	}
}








