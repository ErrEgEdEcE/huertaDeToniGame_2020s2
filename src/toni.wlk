import wollok.game.*
import plantas.*
import pachamama.*
import mercados.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	var property oro = 0
	const property tipo = "Granjero"
	
	var property plantasSembradas = [] 
	var property plantasCosechadas = []
	
	
	/** Métodos de movimietos agragados para poder hacer el "Caminar como pacman" (Danny) */
	method moveteDerecha(){
		self.position(self.position().right(1))
	}
	
	method moveteIzquierda(){
		self.position(self.position().left(1))
	}
	
	method moveteArriba(){
		self.position(self.position().up(1))
	}
	
	method moveteAbajo(){
		self.position(self.position().down(1))
	}
	
	method plantasEnLaGranja() = game.allVisuals().filter({ obj => obj.tipo() == "Planta" })
	
	method sembrarPlanta(unaPlanta) { 
		if (not self.sobreUnaPlanta()) {
			plantasSembradas.add(unaPlanta)
			game.addVisual(unaPlanta)
		} 
	}
			
	method regarLasPlantas() { self.plantasEnLaGranja().forEach({ p => p.crecer() }) } 
	
	method regarPlanta(unaPlanta) { if (self.plantasEnLaGranja().contains(unaPlanta)) unaPlanta.crecer() }
	
	method plantasListasParaCosechar() = self.plantasEnLaGranja().filter({ p => p.estaLista() })
	
	method cosechar(unaPlanta) { 
		if (unaPlanta.estaLista()) {
			plantasSembradas.remove(unaPlanta)
			plantasCosechadas.add(unaPlanta)
			game.removeVisual(unaPlanta)
	    } else { game.say(self, "No está lista") }
	}
	
	method cosecharTodo() { self.plantasListasParaCosechar().forEach({ p => self.cosechar(p) }) }
	
	method venderPlanta(unaPlanta) { oro += unaPlanta.valor(); plantasCosechadas.remove(unaPlanta)}
	
	method venderCosecha() {
		if (self.estaEnUnMercado()) {
			game.uniqueCollider(self).comprarCosecha()
		} else { game.say(self, "No estoy en un mercado") }
	}
	
	/** Reescribí el codigo de manera que no haga nada ninuna ofrenda cuando no tiene 
      * con que. (Danny) */
	method hacerOfrenda() {
		const ofrenda = self.plantasEnLaGranja().anyOne()
		
		pachamama.agradecimiento(10.max(pachamama.agradecimiento()))
		game.removeVisual(ofrenda)
		plantasSembradas.remove(ofrenda)
		if (pachamama.estaAgradecida()) {
			pachamama.llover()
		}
	}
		
	
	/**Estos son metodos que faltaban en la etapa 1 (Danny) */
	method valorDeCosecha() = plantasCosechadas.sum({p => p.valor()})
	
	method paraCuantosDiasLeAlcanza() = (oro + self.valorDeCosecha()) / 200
	
	method cuantoHayParaCeliacos() = self.plantasListasParaCosechar().filter({ p => not p.tieneGluten() }).size()
	
	method convieneRegar() = self.plantasEnLaGranja().any({ p => not p.estaLista() })
	
	method sobreUnaPlanta() = game.colliders(self).any({ obj => obj.tipo() == "Planta" })
	
	method estaEnCeldaVacia() = game.colliders(self).isEmpty()
	
	method estaEnUnMercado() = game.colliders(self).any({ obj => obj.tipo() == "Mercado" }) 
	
	method agunaPlantaLista() = self.plantasEnLaGranja().any({ p => p.estaLista() })
	
	method estaEnBordeNorte() = self.position().y() == game.height() - 1
	
	method estaEnBordeSur() = self.position().y() == 0
	
	method estaEnBordeEste() = self.position().x() == game.width() - 1
	
	method estaEnBordeOeste() = self.position().x() == 0
}





