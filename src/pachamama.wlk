import toni.*
import plantas.*
import wollok.game.*

object pachamama {
	var property agradecimiento = 10
	var property position = game.at(0, 13)
	
	method image() {
		if (agradecimiento >= 10) {
			return "pachamama-agradecida.png"
		} else {
			return "pachamama-noagradecida.png"
		}
	}
	
				
	/** Se supone que si llueve, riega todas las plantas, ¿no? 
	supuse que no hay que hacerlo todo de nuevo pero como lo hace toni,
	no creo que esté bien (Caro) */
	method llover() {
		agradecimiento += 5
		toni.regarLasPlantas() //Suponemos que cuando llueve riega las plantas
	}
	
	method fumigar() {
		self.agradecimiento(0)
		game.say(toni, "Ya está todo fumigado")
	}
	
	method estaAgradecida() {
		return self.agradecimiento() >= 10}
	
	method cambiarDePosicion() {
		const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x,y)
	}
	
	method puedeComprar() = false
}