import wollok.game.*
import cidigoComida.*



object juego {
    const property comidas = []

    method iniciar() {
        game.width(20)
        game.height(14)
        game.addVisualCharacter(raton) 

        game.onCollideDo(raton, { algo=> algo.teAgarroRaton() })

        self.generarComidas()
    }

    method generarComidas() {
        game.schedule(500, {
            self.crearComidaAlAzar()
            self.crearComidaAlAzar()
            self.crearComidaAlAzar()
            self.crearComidaAlAzar()
            self.crearComidaAlAzar()
        })
    }

    method crearComidaAlAzar() {
        const pos = self.posicionAlAzar()
        
        const tipoComida = [
            new Pizza(position = pos),
            new Queso(position = pos),
            new Burger(position = pos)
        ].anyOne()

        comidas.add(tipoComida)
        game.addVisual(tipoComida)
    }

    method removerComida(comida) {
        comidas.remove(comida)
    }

    method posicionAlAzar() = game.at(
        0.randomUpTo(game.width()-1),
        0.randomUpTo(game.height()-1)
    )
}

object raton {
    var property position = game.center()

    method aumentar(cantidad) {
        marcador.sumar(cantidad) 
    }

    method image() = "rata.png"
}
