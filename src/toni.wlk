import wollok.game.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	
	// Pegar acá todo lo que tenían de Toni en la etapa 1
	
	var property maizPlantado = []
	var property trigoPlantado = [] 
	var property tomacoPlantado = []
	

	method agregarMaiz(maiz){
		maizPlantado.add(maiz)
	}
	
	method sacarMaiz(maiz){
		maizPlantado.remove(maiz)
	}
	
	
	/**Funciones para el trigo (Danny) */
	
	/**Suma una instancia de "Trigo" a la lista "trigoPlantado" (Danny) */
	method agregarTrigo(trigo){
		trigoPlantado.add(trigo)
	}
	
	/**Saca una instancia de "Trigo" a la lista "trigoPlantado" (Danny) */
	method sacarTrigo(trigo){
		trigoPlantado.remove(trigo)
	}
	
	
	/**Funciones para el tomaco (Danny) */
	
	/**Suma una instancia de "tomaco" a la lista "tomacoPlantado" (Danny) */
	method agregarTomaco(tomaco){
		trigoPlantado.add(tomaco)
	}
	
	/**Saca una instancia de "tomaco" a la lista "tomacoPlantado" (Danny) */
	method sacarTomaco(tomaco){
		trigoPlantado.remove(tomaco)
	}
	
	
	method regarPlanta(unaPlanta) { unaPlanta.crecer() }
	
}