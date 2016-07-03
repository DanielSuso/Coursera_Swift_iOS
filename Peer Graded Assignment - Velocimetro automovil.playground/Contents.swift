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
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadBaja)
            salida = (velocidad.rawValue, "Velocidad baja")
        case .velocidadBaja:
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadMedia)
            salida = (velocidad.rawValue, "Velocidad media")
        case .velocidadMedia:
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadAlta)
            salida = (velocidad.rawValue, "Velocidad alta")
        case .velocidadAlta:
            velocidad = Velocidades(velocidadInicial : Velocidades.velocidadMedia)
            salida = (velocidad.rawValue, "Velocidad media")
        }
        
        return salida
    }
}

var auto : Auto = Auto()
print("\(auto.velocidad.rawValue), Apagado")
    
for i in 1...20 {
    
    var (valor, velocidadEnCadena) = auto.cambioDeVelocidad()
    print("\(valor), \(velocidadEnCadena)")
}