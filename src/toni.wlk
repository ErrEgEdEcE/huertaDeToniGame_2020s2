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
	
	/*******************************************************************************************/
	
	/**Movimientos */
	
	/**Mueve a toni un paso al este de la granja */
	method moveteDerecha(){
		self.position(self.position().right(1))
	}
	/**Mueve a toni un paso al oeste de la granja */
	method moveteIzquierda(){
		self.position(self.position().left(1))
	}
	/**Mueve a toni un paso al norte de la granja */
	method moveteArriba(){
		self.position(self.position().up(1))
	}
	/**Mueve a toni un paso al sur de la granja */
	method moveteAbajo(){
		self.position(self.position().down(1))
	}
	
	/*******************************************************************************************/
	
	/**Devuelve una colección con todas las pantas que hay en la granja */
	method plantasEnSuGranja() = game.allVisuals().filter({ obj => obj.tipo() == "Planta" })
	
	/**Siembra una planta dada */
	method sembrarPlanta(unaPlanta) { 
		if (not self.sobreUnaPlanta()) {
			plantasSembradas.add(unaPlanta)
			game.addVisual(unaPlanta)
		} 
	}
	
	/*******************************************************************************************/
	
	/**Riego */
	
	/**Indica si alguna planta de la granaja necesita ser regada. */
	method convieneRegar() = self.plantasEnSuGranja().any({ p => not p.estaLista() })
	
	/**Riega todas las plantas de la granja. */		
	method regarLasPlantas() { self.plantasEnSuGranja().forEach({ p => p.crecer() }) } 
	
	/**Riega una planta dada. */
	method regarPlanta(unaPlanta) { if (self.plantasEnSuGranja().contains(unaPlanta)) unaPlanta.crecer() }
	
	/*******************************************************************************************/
	
	/**Cosecha */
	
	/**Cosecha una planta dada, esta debe estar lista, de lo contrario toni avisará que dicha planta aún no lo está.
      *al ser cosechada, esta se remueve de la lista de "Plantas sembradas" y se añade a la colección de "Plantas cosechadas". */
	method cosechar(unaPlanta) { 
		if (unaPlanta.estaLista()) {
			plantasSembradas.remove(unaPlanta)
			plantasCosechadas.add(unaPlanta)
			game.removeVisual(unaPlanta)
	    } else { game.say(self, "No está lista") }
	}
	
	/**Cosecha todas las plantas que esten listas en la granja.  */
	method cosecharTodo() { self.plantasListasParaCosechar().forEach({ p => self.cosechar(p) }) }
	
	/*******************************************************************************************/
	
	/**Venta */
	
	/**Vende una planta dada. */
	method venderPlanta(unaPlanta) { oro += unaPlanta.valor(); plantasCosechadas.remove(unaPlanta)}
	
	/**Vende todas las plantas de la colección "Plantas cosechadas" si toni se encuentra sobre un mercado.
       *De no ser así, toni avisará que no se encuentra en un mercado.  */
	method venderCosecha() {
		if (self.estaEnUnMercado()) {
			game.uniqueCollider(self).comprarCosecha()
		} else { game.say(self, "No estoy en un mercado") }
	}
	
	/*******************************************************************************************/
	
	/**Ofrenda */
	
	/**Toni hace una ofrenda a la pachamama, esta consite en sacrificar una de las pantas de la granja, esto hace que la
      *pachamama cambie su estado a "agradecida" si no lo está y si ya está agradecida hace llover. */
	method hacerOfrenda() {
		const ofrenda = self.plantasEnSuGranja().anyOne()
		
		if (pachamama.estaAgradecida()) {
			pachamama.llover()
		}
		pachamama.agradecimiento(10.max(pachamama.agradecimiento()))
		game.removeVisual(ofrenda)
		plantasSembradas.remove(ofrenda)
	}
	
	/*******************************************************************************************/
	
	/**Indicadores de colisión */
	
	/**Indica si toni se encuantra sobre una planta. */
	method sobreUnaPlanta() = game.colliders(self).any({ obj => obj.tipo() == "Planta" })
	
	/**Indica si toni se encuantra sobre una celda vacía. */
	method estaEnCeldaVacia() = game.colliders(self).isEmpty()
	
	/**Indica si toni se encuentra en un mercado. */
	method estaEnUnMercado() = game.colliders(self).any({ obj => obj.tipo() == "Mercado" }) 
	
	/*******************************************************************************************/
	
	/**Devuelve el valor total de la cosecha. */
	method valorDeCosecha() = plantasCosechadas.sum({p => p.valor()})
	
	/**Indica para cuantos dias alcanza la cosecha. */
	method paraCuantosDiasLeAlcanza() = (oro + self.valorDeCosecha()) / 200
	
	/**Indica cuantas plantas de las sembradas no tienen gluten */
	method cuantoHayParaCeliacos() = self.plantasListasParaCosechar().count({ p => not p.tieneGluten() })
	
	/**Devueleve una colección con todas las plantas de la granja que esten listas para ser cosechadas. */
	method plantasListasParaCosechar() = self.plantasEnSuGranja().filter({ p => p.estaLista() })
	
	/**Indica si alguna de las plantas de la granja está lista para ser cosechada */
	method agunaPlantaLista() = self.plantasEnSuGranja().any({ p => p.estaLista() })
	
	/*******************************************************************************************/
	
	/**Indicadores de posición */
	
	/**Indica si toni se encuentra en el borde norte de la granja */
	method estaEnBordeNorte() = self.position().y() == game.height() - 1
	
	/**Indica si toni se encuentra en el borde sur de la granja */
	method estaEnBordeSur() = self.position().y() == 0
	
	/**Indica si toni se encuentra en el borde este de la granja */
	method estaEnBordeEste() = self.position().x() == game.width() - 1
	
	/**Indica si toni se encuentra en el borde oeste de la granja */
	method estaEnBordeOeste() = self.position().x() == 0
}





