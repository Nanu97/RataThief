import wollok.game.*

object juego {
    method iniciar() {

        game.width(20)
        game.height(14)
        game.addVisualCharacter(raton) 


        game.onCollideDo(raton, { algo=> algo.teAgarroRaton() })

        self.generarComidas()

    }

    method generarComidas() {
        game.schedule(500, {
            self.crearComida(10)
            self.crearComida(10)
            self.crearComida(10)
            self.crearComida(10)
            self.crearComida(10)
        })
    }

    method crearComida(puntos) {
        const pos = self.posicionAlAzar()
        const comida = new Comida(position = pos, puntos = puntos)
        game.addVisual(comida)
    }

    method posicionAlAzar() = game.at(
        0.randomUpTo(game.width()-1),
        0.randomUpTo(game.height()-1)
    )

}

object raton {
    var property position = game.center()
    var puntaje = 0

    method aumentar(puntos) {
        puntaje += puntos
        game.say(self, "Tengo " + puntaje.toString() + " puntos")
    }

    method image() = "assets/raton.png"
    

}

class Comida {
    var puntos
    const property position

    method teAgarroRaton() {
        raton.aumentar(puntos)
        game.removeVisual(self)
    }

    method image() = "assets/comida.png"

}