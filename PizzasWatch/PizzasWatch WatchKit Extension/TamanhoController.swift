//
//  TamanhoController.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class TamanhoController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func chica() {
        let configuracion = ConfiguracionPizza(tamanho: "Chica", masa: "", queso: "", ingredientes: [])
        pushControllerWithName("MasaController", context: configuracion)
    }
    
    @IBAction func mediana() {
        let configuracion = ConfiguracionPizza(tamanho: "Mediana", masa: "", queso: "", ingredientes: [])
        pushControllerWithName("MasaController", context: configuracion)
    }
    
    @IBAction func grande() {
        let configuracion = ConfiguracionPizza(tamanho: "Grande", masa: "", queso: "", ingredientes: [])
        pushControllerWithName("MasaController", context: configuracion)
    }
}
