import UIKit

enum Velocidades : Int {
    
    case apagado = 0
    case velocidadBaja = 20
    case velocidadMedia = 50
    case velocidadAlta = 120
    
    init(velocidadInicial : Velocidades) {
        
        self = velocidadInicial
    }
}

class Auto {
    
    var velocidad : Velocidades
    
    init() {
        
        self.velocidad = Velocidades(velocidadInicial: Velocidades.apagado)
    }
    
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena: String) {
        
        var salida : (Int, String)
        
        switch velocidad {
        case .apagado:
            salida = (velocidad.rawValue, "Apagado")
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadBaja)
        case .velocidadBaja:
            salida = (velocidad.rawValue, "Velocidad baja")
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadMedia)
        case .velocidadMedia:
            salida = (velocidad.rawValue, "Velocidad media")
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadAlta)
        case .velocidadAlta:
            salida = (velocidad.rawValue, "Velocidad alta")
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadMedia)
        }
        
        return salida;
    }
}

var auto : Auto = Auto()

for i in 1...20 {
    
    var (valor, velocidadEnCadena) = auto.cambioDeVelocidad()
    print("\(valor), \(velocidadEnCadena)")
}