//
//  QuesoController.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {

    var configuracionPizza : ConfiguracionPizza? = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        configuracionPizza = context as? ConfiguracionPizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func mozarela() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: configuracionPizza!.masa, queso: "Mozarela", ingredientes: [])
        pushControllerWithName("IngredientesController", context: configuracion)
    }
    
    @IBAction func cheddar() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: configuracionPizza!.masa, queso: "Cheddar", ingredientes: [])
        pushControllerWithName("IngredientesController", context: configuracion)
    }
    
    @IBAction func parmesano() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: configuracionPizza!.masa, queso: "Parmesano", ingredientes: [])
        pushControllerWithName("IngredientesController", context: configuracion)
    }
    
    @IBAction func sinQueso() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: configuracionPizza!.masa, queso: "Sin queso", ingredientes: [])
        pushControllerWithName("IngredientesController", context: configuracion)
    }

}
