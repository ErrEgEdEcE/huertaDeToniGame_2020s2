import toni.*
import plantas.*
import wollok.game.*

object pachamama {
	var property agradecimiento = 10
	
	method image() {
		if (agradecimiento >= 10) {
			return "pachamama-agradecida.png"
		} else {
			return "pachamama-noagradecida.jpg"
		}
	}
	
	/** No sé exactamente qué hace, pero pensé que a la pachamama no le gusta */
	method fumigar() {
		agradecimiento = 0
		game.say(toni, "Ya está todo fumigado")
	}
		
			
	/** Se supone que si llueve, riega todas las plantas, ¿no? 
	supuse que no hay que hacerlo todo de nuevo pero como lo hace toni,
	no creo que esté bien (Caro) */
	method llover() {
		agradecimiento += 5
		toni.regarLasPlantas()
	}
	
	method estaAgradecida() = agradecimiento >= 10
}