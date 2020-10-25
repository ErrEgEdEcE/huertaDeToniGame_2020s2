import wollok.game.*
import plantas.*
import pachamama.*
import mercados.*
object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	var property oro = 0
	
	var property plantasSembradas = [] 
	var property plantasCosechadas = []
	
	method sembrarPlanta(unaPlanta) { plantasSembradas.add(unaPlanta) }
			
	method regarLasPlantas() { plantasSembradas.forEach({ p => p.crecer() }) } 
	
	method regarPlanta(unaPlanta) { if (plantasSembradas.contains(unaPlanta)) unaPlanta.crecer() }
	
	method plantasListasParaCosechar() = plantasSembradas.filter({ p => p.estaLista() })
	
	method cosechar(unaPlanta) { 
		if (self.plantasListasParaCosechar().contains(unaPlanta)) {
			plantasSembradas.remove(unaPlanta); plantasCosechadas.add(unaPlanta)
	    } else {game.say(self, "No está lista") }
	}
	
	method cosecharTodo() { self.plantasListasParaCosechar().forEach({ p => self.cosechar(p) }) }
	
	method venderPlanta(unaPlanta) { oro += unaPlanta.valor(); plantasCosechadas.remove(unaPlanta) }
	
	method venderCosecha() {plantasCosechadas.forEach({ p => self.venderPlanta(p) })
	}
	
	/*Traje el método de pachamama hacia Toni, porque es una acción que realiza él, aunque 
	  tenga efectos sobre la pacha (RO)*/
	method fumigar() {
		pachamama.agradecimiento(0)
		game.say(self, "Ya está todo fumigado")
	}
	
	method hacerOfrenda() {
		game.removeVisual(self.plantasSembradas().anyOne()) // REVISAR xQ tira error cuando la visual no está 
		if (pachamama.estaAgradecida()) {pachamama.llover()}
		else {pachamama.agradecimiento(10)}
		game.say(self, "Gracias,Pacha")
		pachamama.cambiarDePosicion()
	}
		
	
	/**Estos son metodos que faltaban en la etapa 1 (Danny) */
	method valorDeCosecha() = plantasCosechadas.sum({p => p.valor()})
	
	method paraCuantosDiasLeAlcanza() = (oro + self.valorDeCosecha()) / 200
	
	method cuantoHayParaCeliacos() = self.plantasListasParaCosechar().filter({ p => not p.tieneGluten() }).size()
	
	method convieneRegar() = plantasSembradas.any({ p => not p.estaLista() })
}
