import toni.*
import plantas.*
import wollok.game.*

object pachamama {
	var property image = "pachamama-agradecida.png"
	
	/** No sé exactamente qué hace, pero pensé que a la pachamama no le gusta */
	method fumigar() {
		game.say(toni, "Ya está todo fumigado")
		return image == "pachamama-noagradecida.jpg" }  
			
	/** Se supone que si llueve, riega todas las plantas, ¿no? 
	supuse que no hay que hacerlo todo de nuevo pero como lo hace toni,
	no creo que esté bien (Caro) */
	method llover() {
		toni.regarLasPlantas()
		return image == "pachamama-agradecida.png"
		
	}
}