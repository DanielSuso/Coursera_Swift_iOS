//
//  Datos.swift
//  Hamburguesas
//
//  Created by Daniel Suso Sánchez on 3/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import Foundation

class ColeccionDePaises {
    
    var paises : [String] = ["España", "Italia", "Portugal", "Francia", "Inglaterra", "Alemania", "Holanda", "Bélgica", "Grecia", "Austria", "México", "Argentina", "Brasil", "Perú", "Chile", "Bolivia", "Cuba", "Uruguay", "Ecuador", "Colombia"]
    
    func obtenerPais() -> String {
        
        let random = Int(arc4random()) % paises.count
    
        return paises[random]
    }
}

class ColeccionDeHamburguesas {
    
    var hamburguesas : [String] = ["Hamburguesa sola", "Hamburguesa con queso", "Hamburguesa completa", "Hamburguesa doble", "Hamburguesa doble con queso", "Hamburguesa con queso y bacon", "Hamburguesa con huevo", "Hamburguesa con huevo y bacon", "Hamburquesa de pollo", "Hamburguesa de ternera", "Hamburguesa de buey", "BigMac", "MacPollo", "MacRoyal Deluxe", "Whopper", "Cheeseburger", "BigKing", "CrispyChicken", "MacRib", "Hamburquesa con cebolla caramelizada"]
    
    func obtenerHamburguesa() -> String {
        
        let random = Int(arc4random()) % hamburguesas.count
        
        return hamburguesas[random]
    }
}

