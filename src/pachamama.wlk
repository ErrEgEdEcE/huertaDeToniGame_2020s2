import toni.*
import plantas.*
import wollok.game.*

object pachamama {
	var property agradecimiento = 10
	var property position = game.at(0, 13)
	const property tipo = "Pachamama"
	
	/**Establece la imagen de la pachamama según su nivel de agradecimiento.
      *Si este es mayor a 10, mostrará una imagen de la pachamama agradecida,
      *de lo cotrario, mostrará una no agradecida. */
	method image() {
		if (agradecimiento >= 10) {
			return "pachamama-agradecida.png"
		} else {
			return "pachamama-noagradecida.png"
		}
	}
				
	/**Llueve sobre la granja y porboca que todas las plantas sean regadas. */
	method llover() {
		agradecimiento += 5
		toni.plantasEnSuGranja().forEach({ p => p.crecer() })
	}
	
	/**Fumiga la granja y avisa que ya está todo fumigado */
	method fumigar() {
		self.agradecimiento(0)
		game.say(toni, "Ya está todo fumigado")
	}
	
	/**Indica si la pachamama está agradecida, devuelve un booleano */
	method estaAgradecida() {
		return self.agradecimiento() >= 10}
	
	/**Cambia de forma aleatoria la posición de la pachamama  */
	method cambiarDePosicion() {
		const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x,y)
	}
}