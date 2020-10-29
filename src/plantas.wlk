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
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 30 else 0 
		
		return 150 + plusAgradecimiento
	}
	method puedeComprar() = false
}

class Trigo {
	var property position 
	const estados = ["trigo_0.png", "trigo_1.png","trigo_2.png","trigo_3.png"]
	var indiceEstado = 0
		
	method valor() {
		return if (self.etapaEvolucion() == 2) 100
		else  if (self.etapaEvolucion() == 3) 200
		else 0 
	} /*Lo cambié de const property a method, porque el valor es variable, dependiendo del 
	 * índice de Estado y de si la pacha esta agradecida. No hace falta un setter (rocío)*/ 
	
	
	method crecer() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 1 else 0 
		
		indiceEstado += 1 + plusAgradecimiento
	}
	
	method image() = estados.get(self.etapaEvolucion())
	
	method estaLista() = self.etapaEvolucion() >= 2
	method tieneGluten() = true
	
	method etapaEvolucion() = indiceEstado % 4
	
	method puedeComprar() = false
} //Hacer metodo de etapa de evolucion





class Tomaco {
	var property position 
	var property image = "tomaco_ok.png"
	const property valor = 80
	
	method image() = if (pachamama.estaAgradecida()) "tomaco_podrido.png" else "tomaco_ok.png"
	
	method crecer() {}
	
	method estaLista() {
		return self.image() == "tomaco_ok.png"
	}
	
	method tieneGluten() = false
	
	method puedeComprar() = false
}








