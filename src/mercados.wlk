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
}
