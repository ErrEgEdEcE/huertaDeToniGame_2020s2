import toni.*
import wollok.game.*

class Mercado {
	var property monedas = 0
	var property position = game.at(5,7)
	var property mercaderia = []
	const property image = "mercado.png"
	
	// Indica si las monedas de ese mercado alcanzan para comprar la cosecha
	method puedeComprar() {
		return self.monedas() >= toni.valorDeCosecha()
	}
	
	method comprarCosecha() {
		if (self.puedeComprar() && game.uniqueCollider(self).equals(toni)) {
			monedas -= toni.valorDeCosecha()
			mercaderia.addAll(toni.plantasCosechadas())
		} else { game.say(self, "No tengo suficientes monedas") }
	}
}
