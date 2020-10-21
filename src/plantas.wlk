class Maiz {
	var property position /**Para que el Maiz tenga una posición (Danny) */
	var tamanio = 0
	
	method image() {
		if (tamanio == 0){
			return "maiz_bebe.png"
		} else {
			return "maiz_adulto.png"
		}
	}
	
	method crecer() { tamanio += 1 }
	
	
}

class Trigo inherits Maiz { /**(Danny) */
	
	override method image() {
		if (tamanio == 0){
			return "trigo_0.png"
		} else if (tamanio == 1) {
			return "trigo_1.png"
		} else if (tamanio == 2) {
			return "trigo_2.png"
		} else {
			return "trigo_3.png"
		}
	}
}

class Tomaco inherits Maiz { /**(Danny) */

	override method image() = "tomaco_ok.png"
}

// Agregar las demás plantas y completar el Maiz.