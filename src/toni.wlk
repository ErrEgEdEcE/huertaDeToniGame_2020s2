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
	
	
	method sembrarPlanta(unaPlanta) { 
		if (not self.sobreUnaPlanta()) {
			plantasSembradas.add(unaPlanta)
			game.addVisual(unaPlanta)
		} 
	}
			
	method regarLasPlantas() { plantasSembradas.forEach({ p => p.crecer() }) } 
	
	method regarPlanta(unaPlanta) { if (plantasSembradas.contains(unaPlanta)) unaPlanta.crecer() }
	
	method plantasListasParaCosechar() = plantasSembradas.filter({ p => p.estaLista() })
	
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
		const ofrenda = plantasSembradas.anyOne()
		
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
	
	method convieneRegar() = plantasSembradas.any({ p => not p.estaLista() })
	
	method sobreUnaPlanta() = game.colliders(self).any({ obj => obj.tipo() == "Planta" })
	
	method estaEnCeldaVacia() = game.colliders(self).isEmpty()
	
	method estaEnUnMercado() = game.colliders(self).any({ obj => obj.tipo() == "Mercado" }) 
	
	method agunaPlantaLista() = plantasSembradas.any({ p => p.estaLista() })
}





