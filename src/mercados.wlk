import toni.*
import wollok.game.*

class Mercado {
	var property monedas = 0
	var property position = game.at(5,7)
	var property mercaderia = []
	const property image = "mercado.png"
	const property tipo = "Mercado"
	
	/**Indica si las monedas de ese mercado alcanzan para comprar la cosecha */
	method puedeComprar() {
		return self.monedas() >= toni.valorDeCosecha()
	}
	
	/**Si el mercado tiene suficientes monedas para cubrir el costo de la cosecha de toni,
      *compra toda su cosecha y la añadirá a su "mercaderia". En el caso contrario,
      *avisará que no tiene suficientes monedas e iniformará cuantas tiene. */
	method comprarCosecha() {
		if (self.puedeComprar()) {
			monedas -= toni.valorDeCosecha()
			mercaderia.addAll(toni.plantasCosechadas())
			toni.plantasCosechadas().forEach({ p => toni.venderPlanta(p) })
		} else { game.say(self, "Monedas insuficientes, " + " tengo solo " + monedas + " monedas") }
	}
}
