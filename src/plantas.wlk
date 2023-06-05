import wollok.game.*

class Maiz {
	var property estado = bebe
	const property position
	
	method image() = estado
	method recibirAgua(){estado = adulto}
	method estaLista() = estado == adulto
}

object bebe {
	method image() = "maiz_bebe.png"
}
object adulto {
	method image() = "maiz_adulto.png"
}


class Trigo {
	var property image = "trigo_0.png"
	const property position
	
	method recibirAgua(){
		if(image == "trigo_0.png"){
			image = "trigo_1.png"
		}
		else if(image == "trigo_1.png"){
			image = "trigo_2.png"
		}
		else if(image == "trigo_2.png"){
			image = "trigo_3.png"
		}
	}
	
	method valor(){
		if(image == "trigo_0.png") return 1
		else if(image == "trigo_1.png") return 5
		else if (image == "trigo_2.png") return 15
		else (image == "trigo_3.png") return 30
	}
}

class Tomate {
	var property image = "tomaco_ok.png"
	const property position
	
	method recibirAgua(){
		image = "tomaco_podrido.png"
	}
	
	method valor(){
		if(image == "maiz_bebe.png") return 15
		else return 0
	}
	
}