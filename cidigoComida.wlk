import wollok.game.*
import codigoRaton.*

class Comida {
    const property position

    method teAgarroRaton() {
        raton.aumentar(self.puntos())
        game.removeVisual(self)
        juego.removerComida(self)
    }

    method puntos()
    method image()
}

class Pizza inherits Comida {
  override method puntos() = 10
  override method image() = "pizza.png"
}

class Queso inherits Comida {
  override method puntos() = 20
  override method image() = "queso.png"
}

class Burger inherits Comida {
  override method puntos() = 50
  override method image() = "hamburgesa.png"
}
object marcador {
    var puntos = 0
    
    method position() = game.at(0.75,13) 
    
    method sumar(cantidad) {
        puntos += cantidad
    }

    method puntos() = puntos

    method text() = "Puntos: " + puntos

    method textColor() = "FFA800" // Violeta
}