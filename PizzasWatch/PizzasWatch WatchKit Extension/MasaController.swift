//
//  MasaController.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {

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
    
    @IBAction func delgada() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: "Delgada", queso: "", ingredientes: [])
        pushControllerWithName("QuesoController", context: configuracion)
    }
    
    @IBAction func crujiente() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: "Crujiente", queso: "", ingredientes: [])
        pushControllerWithName("QuesoController", context: configuracion)
    }
    
    @IBAction func gruesa() {
        let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: "Gruesa", queso: "", ingredientes: [])
        pushControllerWithName("QuesoController", context: configuracion)
    }

}
