import wollok.game.*

class Maiz {
	var property position 
	var property image = "maiz_bebe.png"
	const property valor = 150
	
	method crecer() {
		if (image == "maiz_bebe.png") {
			image = "maiz_adulto.png"
		}
	}
	
	method estaLista() = image == "maiz_adulto.png"
	method tieneGluten() = false
}

class Trigo {
	var property position 
	const estados = ["trigo_0.png", "trigo_1.png","trigo_2.png","trigo_3.png"]
	var indiceEstado = 0
	const property valor = 100
	
	method crecer() {
		indiceEstado += 1
	}
	
	method image() = estados.get(indiceEstado % 4)
	
	method estaLista() = indiceEstado >= 2
	method tieneGluten() = true
}



class Tomaco {
	var property position 
	var property image = "tomaco_ok.png"
	const property valor = 80
	
	method crecer() {}
	
	method estaLista() = true
	method tieneGluten() = false
}