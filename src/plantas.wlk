import wollok.game.*
import pachamama.*

class Planta {
	var property position = game.at(0, 0)
	const property tipo = "Planta"
	
	/**Establece la imagen de la plata según ciertas condiciones propias de cada planta. */
	method image()
	
	/**Hace madurar la planta a su siguiente etapa. */
	method crecer() {}
	
	/**Indica si la plnata esta lista para ser cosechada. */
	method estaLista()
	
	/**Indica si la planta tiene gluten o no. */
	method tieneGluten() = false
	
	/**Indica el valor de venta de una planta. */
	method valor()
}

class Maiz inherits Planta {
	var property image = "maiz_bebe.png"
	
	/**Transforma un maiz bebé en un maiz adulto. */
	override method crecer() {
		if (image == "maiz_bebe.png") {
			image = "maiz_adulto.png"
		}
	}
	
	/**Indica si un maiz está listo para se cosechado, este lo estará si su imagen es la de un
      *maiz aldulto. */
	override method estaLista() = image == "maiz_adulto.png"
	
	/**Indica el valor de un maiz, este valor varía según el estado de agradecimiento de 
      *la pacahamama, si esta está agradecida, su valor será el básico + 30. Si la pachamama
      *no está agradesida, su valor será el normal, 150 monedas */
	override method valor() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 30 else 0 
		
		return 150 + plusAgradecimiento
	}
}

class Trigo inherits Planta {
	const estados = ["trigo_0.png", "trigo_1.png","trigo_2.png","trigo_3.png"]
	var indiceEstado = 0
	
	/**Indica el valor de un trigo según su etapa de evolución */	
	override method valor() {
		return if (self.etapaEvolucion() == 2) 100
		else  if (self.etapaEvolucion() == 3) 200
		else 0 
	}
	
	/**Transforma al trigo a su siguente etapa, sí la pachama está agradecida se suma un plus
      *en el cual el trigo crece una etapa mas. */
	override method crecer() {
		const plusAgradecimiento = if (pachamama.estaAgradecida()) 1 else 0 
		
		indiceEstado += 1 + plusAgradecimiento
	}
	
	/**Muestra la imagen del trigo segun su etapa de evolución actual. */
	override method image() = estados.get(self.etapaEvolucion())
	
	/**Indica si el trigo está listo, este lo estará si su etapa de evolución es al menos 2 */
	override method estaLista() = self.etapaEvolucion() >= 2
	
	/**Indica que si el trigo tiene gluten, este siempre tiene. */
	override method tieneGluten() = true
	
	/**Describe la etapa de evolución en la que se encuetra el trigo actualmente */
	method etapaEvolucion() = indiceEstado % 4	
}

class Tomaco inherits Planta {
	var property image = "tomaco_ok.png"
	const property valor = 80
	
	/**Establece la imagen del tomaco, esta será de uno podrido si la pachamam está agradecida
      *de lo contrario muetra una imagen de un tomaco en buen estado. */
	override method image() = if (pachamama.estaAgradecida()) "tomaco_podrido.png" else "tomaco_ok.png"
	
	/**Indica si el tomaco está listo para ser cosechado, solo lo estará si su imagen es de un
      *tomaco en buen estado. */
	override method estaLista() {
		return self.image() == "tomaco_ok.png"
	}
}








