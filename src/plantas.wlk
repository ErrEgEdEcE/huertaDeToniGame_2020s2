import wollok.game.*
import pachamama.*

class Maiz {
	var property position 
	var property image = "maiz_bebe.png"
	
	method crecer() {
		if (image == "maiz_bebe.png") {
			image = "maiz_adulto.png"
		}
	}
	
	method estaLista() = image == "maiz_adulto.png"
	method tieneGluten() = false
	method valor() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 20 else 0 
		
		return 150 + plusAgradecimiento
	}
}

class Trigo {
	var property position 
	const estados = ["trigo_0.png", "trigo_1.png","trigo_2.png","trigo_3.png"]
	var indiceEstado = 0
	const property valor = 100
	
	method crecer() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 1 else 0 
		
		indiceEstado += 1 + plusAgradecimiento
	}
	
	method image() = estados.get(indiceEstado % 4)
	
	method estaLista() = indiceEstado >= 2
	method tieneGluten() = true
}



class Tomaco {
	var property position 
	var property image = "tomaco_ok.png"
	const property valor = 80
	
	method image() = if (pachamama.estaAgradecida()) "tomaco_podrido.png" else "tomaco_ok.png"
	
	method crecer() {}
	
	method estaLista() = true
	method tieneGluten() = false
}