import wollok.game.*
import plantas.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const property cosechaSembrada = []
	const property cosecha = []
	var property oro = 0
	
	// Pegar acá todo lo que tenían de Toni en la etapa 1
	
	method configuracion(){
		game.addVisualCharacter(self)
		keyboard.m().onPressDo{self.sembrar(new Maiz(position = position))}
		keyboard.t().onPressDo{self.sembrar(new Trigo(position = position))}
		keyboard.o().onPressDo{self.sembrar(new Tomate(position = position))}
		keyboard.r().onPressDo{self.regarPlanta()}
		keyboard.a().onPressDo{self.regarTodo()}
		keyboard.c().onPressDo{self.cosecharPlanta()}
		keyboard.x().onPressDo{self.cosecharTodo()}
		keyboard.v().onPressDo{self.venderCosecha()}
		keyboard.space().onPressDo{self.informarEstado()}
	}
	
	method sembrar(planta){
		game.addVisual(planta)
		cosechaSembrada.add(planta)
	}
	
	method regarPlanta(){
		game.colliders(self).forEach( {p => p.recibirAgua()} )
	}
	
	method regarTodo(){
		cosechaSembrada.forEach({p => p.recibirAgua()})
	}
	
	method cosecharPlanta(){
		if (game.colliders(self).estaLista()){
			cosecha.add(game.colliders(self))
			game.colliders(self).cosecharse()
			
			game.removeVisual(game.colliders(self))
			cosechaSembrada.remove(game.colliders(self))
		}
	}
	
	method cosecharTodo(){
		cosechaSembrada.forEach{self.cosecharPlanta()}
	}
	
	method venderCosecha(){
		var resultado = 0
		resultado = cosecha.sum( { p => p.valor()} )
		game.say(self, "Vendí todo y tengo "+resultado+" más de oro")
	}
	
	method cantCosechada() = cosecha.size()
	
	method informarEstado(){
		game.say(self, "Tengo "+oro+" de oro actualmente y tengo "+self.cantCosechada()+" plantas para vender")
	}
}